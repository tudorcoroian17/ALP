SWAP    MACRO x, y
; Swap the values of x and y
    PUSH AX         ; Save contents of AX and BX
    PUSH BX

    MOV AX, x
    MOV BX, y
    MOV x, BX
    MOV y, AX

    POP BX          ; Restore contents of AX and BX
    POP AX
ENDM