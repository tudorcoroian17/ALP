DATA SEGMENT PARA PUBLIC 'DATA'
    ; Do NOT add other variables to the data segment
    result  DB ?
    nb1     DB ?
    nb2     DB ?
    op      DB ?
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

; your code ends here
RET
START ENDP

READ_NBS    PROC    NEAR
; Read the first number from the keyboard
XOR BX, BX
XOR DX, DX
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
XOR BX, BX
XOR DX, DX
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

CODE ENDS
END START