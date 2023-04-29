DATA SEGMENT PARA PUBLIC 'DATA'
    ; Do NOT add other variables to the data segment
    result  DB ?
    nb1     DB ?
    nb2     DB ?
    op      DB ?
DATA ENDS



;aici macro
COMPUTE_OP  MACRO a, op, b, res
; Compute the operation a <op> b and store the result in res
; a, b, res --defined-- DB ?
; op --only-- '+' or '-'
    LOCAL lbl1, lbl2
    PUSH AX

    CMP op, '+'
    JE lbl1
    ; Compute the subtraction
    MOV AL, a
    SUB AL, b
    MOV res, AL
    JMP lbl2
lbl1:
    ; Compute the addition
    MOV AL, a
    ADD AL, b
    MOV res, AL
lbl2:
    POP AX
ENDM




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

CALL READ_NBS
XOR BX, BX
XOR DX, DX
CALL READ_NB2

CMP op, '+'
    JE lbl1
    ; Compute the subtraction
    MOV AL, nb1
    SUB AL, nb2
    MOV result, AL
    JMP lbl2
lbl1:
    ; Compute the addition
    MOV AL, nb1
    ADD AL, nb2
    MOV result, AL
lbl2:

;ajwdbfihasdbfkajsbdfjkashdgkhasd

MOV DL, result
l1:
	CALL PRINT_DIG
	MOV AL, DL
	MOV BL, 10
	DIV BL
	
	;MOV DL, AL
	;CMP AL, 0
	JNE l1

; your code ends here..........................................
RET
START ENDP



;aici proceduri
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

TO_DIGIT   PROC    NEAR
; Transform from hex to dec
	
ENDP


READ_NBS    PROC    NEAR
; Read the first number from the keyboard
bgn1:
    CALL READ_BYTE
    CMP AL, '+'
    JE sign1
    CMP AL, '-'
    JE digit1
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

CODE ENDS
END START