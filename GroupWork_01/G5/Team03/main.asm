
DATA SEGMENT PARA PUBLIC 'DATA'
    ; Do NOT add other variables to the data segment
    result  DB ?
    nb1     DB ?
    nb2     DB ?
    op      DB ?
DATA ENDS



CODE SEGMENT PARA PUBLIC 'CODE'
;;EXTRN READ_BYTE:NEAR
ASSUME CS:CODE, DS:DATA
START PROC FAR
PUSH DS
XOR AX, AX
MOV DS, AX
PUSH AX
MOV AX, DATA
MOV DS, AX
; your code starts here
	
	CALL READ_NBS
	CALL READ_NB2
	;;COMPUTE_OP NB1, OP, NB2, RESULT

    CMP op, '+'
    JE lbl1
    ; Compute the subtraction
    MOV AL, NB1
    SUB AL, nb2
    MOV result, AL
    JMP lbl2
lbl1:
    ; Compute the addition
    MOV AL, nb1
    ADD AL, nb2
    MOV result, AL
lbl2:
	xor ax, AX
	xor ax, ax
	mov al, result
	mov dl, al
	call PRINT_DIG
	
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
	mov dl, 0
	mov bl, 0
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
	MOV nb2, DL
    JMP bgn2
fin2:
    MOV nb2, DL
    RET
ENDP

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



END START