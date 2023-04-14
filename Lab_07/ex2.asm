DATA SEGMENT PARA PUBLIC 'DATA'
    string  DB  "small$"
    len     DB  $-string
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
MOV CX, WORD PTR len
MOV SI, 0
lbl:
    CALL UPPER
    LOOP lbl
CALL PRINTS
; your code ends here
RET
START ENDP

UPPER   PROC NEAR
    MOV DL, string[SI]  ; load letter in DL
    CMP DL, 41H         ; compare with 'a'
    JB  exit            ; return if < 'a'
    CMP DL, 7AH         ; compare with 'z'
    JA  exit            ; return if > 'z'
    SUB DL, 20H         ; make upper case
    MOV string[SI], DL  ; store letter in memory
    INC SI              ; increment index
exit:
    RET
UPPER   ENDP

; Print a string to the console
PRINTS  PROC NEAR
    MOV AH, 09H
    LEA DX, string
    INT 21H
    RET
PRINTS  ENDP

CODE ENDS
END START