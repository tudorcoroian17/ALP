CODE SEGMENT PARA PUBLIC 'CODE'
    PUBLIC PROC1
    PUBLIC PROC2
ASSUME CS:CODE

PROC1    PROC    NEAR
; Add 16 to the value of AX
    ADD AX, 10H
    RET
PROC1    ENDP

PROC2   PROC    NEAR
; Subtract 16 from the value of AX
    SUB AX, 10H
    RET
PROC2   ENDP

CODE ENDS
END