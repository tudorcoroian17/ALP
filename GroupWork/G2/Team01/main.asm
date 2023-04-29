INCLUDE maclib.asm
DATA SEGMENT PARA PUBLIC 'DATA'
    ; Do NOT add other variables to the data segment
    sentence    DB  255, ?, 255 DUP(?)
    letter      DB  ?
    len         DB  ?
DATA ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
EXTERN PRINT_STRING: NEAR
EXTERN CHANGE: NEAR
ASSUME CS:CODE, DS:DATA
START PROC FAR
PUSH DS
XOR AX, AX
MOV DS, AX
PUSH AX
MOV AX, DATA
MOV DS, AX

; your code starts here

READ_STRING sentence
READ_CHAR letter
CALL CHANGE
PREP_PRINT sentence
PRRINT_STRING sentence

; your code ends here
SWAP   PROC NEAR
; Swap the values of x and y
    PUSH AX         ; Save contents of AX and BX
    PUSH BX

    MOV AX, '#'
    MOV BX, sentence
    MOV sentence[SI], AX

    POP BX          ; Restore contents of AX and BX
    POP AX
ENDP

CHANGE   PROC NEAR
    MOV DL, sentence[SI]  ; load letter in DL
    CMP DL, letter         ; compare with 'LETTER'
    JNE  exit            ; return if != 'LETTER'
    CALL SWAP          ; make upper case -> MAKE #
    INC SI              ; increment index
exit:
    RET
CHANGE   ENDP
RET
START ENDP

CODE ENDS
END START