DATA SEGMENT PARA PUBLIC 'DATA'
    read_buff   DB  32, ?, 32 DUP (?)
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

CALL PRINTS
; your code ends here
RET
START ENDP

READS   PROC NEAR
    MOV AH, 0AH
    LEA DX, read_buff
    INT 21H
    RET
READS   ENDP

PRINTS  PROC NEAR
    MOV SI, 1
    MOV SI, WORD PTR read_buff[SI]  ; load in SI the size of the input string
    AND SI, 00FFH
    ADD SI, 2
    MOV read_buff[SI], '$'          ; add the $ to the end of the string
    MOV AH, 09H
    LEA DX, read_buff
    ADD DX, 2                       ; skip over the first 2 bytes in read_buff
    INT 21H
    RET
PRINTS  ENDP

CODE ENDS
END START