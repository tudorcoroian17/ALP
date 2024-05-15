READCHAR MACRO DST
    ; This is a macro that reads a character
    PUSH AX

    MOV AH, 01
    INT 21H
    MOV BYTE PTR DST, AL

    POP AX
ENDM

PRINTCHAR MACRO CHAR
    ; This is a macro that prints a character
    PUSH AX
    PUSH DX

    MOV AH, 02H
    MOV DL, BYTE PTR CHAR
    INT 21H

    POP DX
    POP AX
ENDM