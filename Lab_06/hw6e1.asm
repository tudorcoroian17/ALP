DATA SEGMENT PARA PUBLIC 'DATA'
    VAR1    DW  1256H
    VAR2    DW  0ABCDH
    VAR3    DD  0
DATA ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:CODE, DS:DATA
START PROC FAR
PUSH DS
XOR AX, AX
MOV DS, AX
PUSH AX
MOV AX, DATA
MOV DS, AX
; your code starts here
PUSH VAR1   ; put VAR1 on the stack
PUSH VAR2   ; put VAR2 on the stack

POP WORD PTR VAR3[0]    ; retrieve VAR2 from the stack and place it on the lower half of VAR3
POP WORD PTR VAR3[2]    ; retrieve VAR3 from the stack and place it on the higer half of VAR3
; your code ends here
RET
START ENDP

CODE ENDS
END START