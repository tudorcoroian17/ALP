DATA SEGMENT PARA PUBLIC 'DATA'
    read_buff   DB  32, ?, 32 DUP (?)
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
CALL READS
MOV SI, 1
MOV BL, read_buff[SI]
MOV len, BL
MOV CX, WORD PTR len
MOV SI, 2
lbl:
    CALL UPPER
    LOOP lbl
CALL PRINTS
; your code ends here
RET
START ENDP

UPPER   PROC NEAR
    MOV DL, read_buff[SI]   ; load letter in DL
    CMP DL, 41H             ; compare with 'a'
    JB  exit                ; return if < 'a'
    CMP DL, 7AH             ; compare with 'z'
    JA  exit                ; return if > 'z'
    SUB DL, 20H             ; make upper case
    MOV read_buff[SI], DL   ; store letter in memory
exit:
    INC SI                  ; increment index
    RET
UPPER   ENDP

READS   PROC NEAR
    MOV AH, 0AH
    LEA DX, read_buff
    INT 21H
    RET
READS   ENDP

PRINTS  PROC NEAR
    MOV SI, WORD PTR len    ; load in SI the size of the input string
    ADD SI, 2
    MOV read_buff[SI], 24H  ; add the $ to the end of the string
    MOV AH, 09H
    LEA DX, read_buff
    ADD DX, 2               ; skip over the first 2 bytes in read_buff
    INT 21H
    RET
PRINTS  ENDP

CODE ENDS
END START