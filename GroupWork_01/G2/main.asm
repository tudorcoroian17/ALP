DATA SEGMENT PARA PUBLIC 'DATA'
    ; Do NOT add other variables to the data segment
    sentence    DB  255, ?, 255 DUP(?)
    letter      DB  ?
    len         DB  ?
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

; your code ends here
RET
START ENDP

CODE ENDS
END START