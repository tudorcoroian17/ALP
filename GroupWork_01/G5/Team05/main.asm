DATA SEGMENT PARA PUBLIC 'DATA'
    ; Do NOT add other variables to the data segment
    result  DB ?
    nb1     DB ?
    nb2     DB ?
    op      DB ?
    tbl     DB  '0123456789ABCDEF'
DATA ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
EXTRN READ_BYTE:NEAR
ASSUME CS:CODE, DS:DATA
START PROC FAR
PUSH DS
XOR AX, AX
MOV DS, AX
PUSH AX
MOV AX, DATA
MOV DS, AX
; your code starts here
XOR BX, BX
XOR DX, DX
XOR AX, AX
CALL READ_NBS
XOR BX, BX
XOR DX, DX
XOR AX, AX
CALL READ_NB2
CMP op, '+'
    JE lbl1
    ; Compute the subtraction
    MOV AL, nb1
    MOV BL, NB2
    SUB AL, BL
    MOV result, AL
    JMP lbl2
lbl1:
    ; Compute the addition
    MOV AL, nb1
    ADD AL, nb2
    MOV result, AL
lbl2:
    XOR BX, BX
    MOV BL, result
    CALL PRINT_UNS_INT
    ;MOV AH, 02H
    ;MOV DL, BL
    ;INT 21H
; your code ends here
RET
START ENDP

READ_NBS    PROC    NEAR
; Read the first number from the keyboard
bgn1:
    CALL READ_BYTE
    CMP AL, '+'
    JE sign1
    CMP AL, '-'
    JNE digit1
sign1:
    MOV op, AL
    JMP fin1
digit1:
    SUB AL, '0'
    XOR AH, AH
    MOV BL, 0AH
    PUSH AX
    MOV AX, DX
    MUL BL
    POP DX
    ADD DL, AL
    JMP bgn1
fin1:
    MOV nb1, DL
    RET
ENDP

READ_NB2    PROC    NEAR
; Read the second number from the keyboard
bgn2:
    CALL READ_BYTE
    CMP AL, 0DH
    JNE digit2
    JMP fin2
digit2:
    SUB AL, '0'
    XOR AH, AH
    MOV BL, 0AH
    PUSH AX
    MOV AX, DX
    MUL BL
    POP DX
    ADD DL, AL
    JMP bgn2
fin2:
    MOV nb2, DL
    RET
ENDP

PRINT_UNS_INT   PROC NEAR
    MOV CX, 0
first:              ; Shift digits until first nibblet of BX is not 0
    PUSH BX
    AND BX, 0F000H
    CMP BH, 0
    POP BX
    JNE head
    INC CX          ; Count digits shifted
    SHL BX, 4
    JMP first
head:
    MOV DX, CX
    MOV CX, 4
    SUB CX, DX      ; Count how many digits to print (4 - digits shifted)
prnt:
    CALL PRINT_DIG
    SHL BX, 4
    LOOP prnt
    RET
PRINT_UNS_INT   ENDP

PRINT_DIG   PROC NEAR
    PUSH BX     
    AND BX, 0F000H      ; Keep only firts digit in BX
    SHR BX, 12          ; Move digit to the last nibblet of BX
    MOV AX, BX      
    MOV BX, OFFSET tbl
    XLAT tbl            ; Translate digit to ASCII character
    POP BX
    MOV DL, AL          ; Load ASCII character in DL
    MOV AH, 02H
    INT 21H
    RET
PRINT_DIG   ENDP


CODE ENDS
END START
