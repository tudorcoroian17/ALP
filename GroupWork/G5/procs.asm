CODE SEGMENT PARA PUBLIC 'CODE'
    PUBLIC  READ_BYTE
    PUBLIC  PRINT_DIG
ASSUME CS:CODE

READ_BYTE   PROC    NEAR
; Read a byte from the keyboard and store it in AL
    MOV AH, 01H
    INT 21H  
    RET
ENDP

PRINT_DIG  PROC    NEAR
; Print a digit stored in DL
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
    RET
ENDP

CODE ENDS
END