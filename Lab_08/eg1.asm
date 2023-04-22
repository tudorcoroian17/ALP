INCLUDE maclib.asm      ; Include a macro library

DATA SEGMENT PARA PUBLIC 'DATA'
    var1    DW  0AH
    var2    DW  0CH
    var3    DW  0FH
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
    SWAP var1, var2
    
    ADD16 var3
; your code ends here
RET
START ENDP

CODE ENDS
END START