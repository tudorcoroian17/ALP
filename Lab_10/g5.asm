DATA SEGMENT PARA PUBLIC 'DATA'
VECTOR  DB  255 DUP (?)
LEN     DB  ?
; Additional data

DATA ENDS

SWAP MACRO X, Y
; Swap the values of X and Y
	PUSH AX

	MOV AL, X
	MOV AH, Y
	MOV X, AH 
	MOV Y, AL

	POP AX
ENDM

NEW_LINE MACRO 
; Print a new line to the console
    PUSH AX
    PUSH DX

    MOV AH, 02H
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H

    POP DX
    POP AX
ENDM

SPACE MACRO
; Print a space to the console
    PUSH AX
    PUSH DX

    MOV AH, 02H
    MOV DL, ' '
    INT 21H

    POP AX
    POP DX
ENDM

BASE10 MACRO value
; Convert the byte passed in value to base 10 and
; store the digits of the number of the stack.
; Additionally, count the number of digits stored on the stack
; and load this value in CX
MOV AX, WORD PTR value
MOV BL, 0AH
MOV CX, 0
divide:
    INC CX      ; Increment the nb of digits stored on the stack
    XOR AH, AH
    DIV BL      ; Divide AX to BL
    MOV DL, AH  ; Load rest in DL
    XOR DH, DH  
    PUSH DX     ; Put rest (digit) on the stack
    CMP AL, 0   ; Check if quotient != 0
    JNE divide
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
CALL READ_VECTOR    ; To be implemented
CALL SORT
NEW_LINE
CALL PRINT_VECTOR
; your code ends here
RET
START ENDP

SORT PROC NEAR
; Sort a vector of bytes in ascending order
; VECTOR - the address of the vector
; LEN - the lenghth of the vector
MOV SI, 0
MOV CX, WORD PTR LEN
fori: ; for (i = 0; i <= n - 1; i ++)
    PUSH CX
    MOV CX, WORD PTR LEN
    MOV DI, 0
    forj: ; for (j = 0; j <= n - 1; j++)
        MOV BL, VECTOR[SI]
        MOV BH, VECTOR[DI]
        CMP BL, BH ; if (vector[i] < vector[j])
        JNBE noswap
        SWAP VECTOR[SI], VECTOR[DI]
        noswap:
        INC DI ; j++
    LOOP forj
    POP CX
    INC SI ; i++
    LOOP fori
RET
SORT ENDP

READ_VECTOR PROC NEAR
; Read the whole vector from the keyboard using the subroutine 01H
; Entries are separated by "," (e.g. 18,2,9,7,13,1)
RET
READ_VECTOR ENDP

PRINT_VECTOR PROC NEAR
; Print the entries (in base 10) from the vector separated by " "
MOV CX, WORD PTR LEN    ; Load length of the vector in CX
MOV SI, 0
loop1: ; for (i = 0; i < len; i++)
    PUSH CX
    CALL PRINT_ENTRY    ; Print an entry from the vector
    SPACE               ; Print ' '
    INC SI              ; i++
    POP CX              
LOOP loop1
RET
PRINT_VECTOR ENDP

PRINT_ENTRY PROC NEAR
; Print an entry from the vector to the console using the 02H subroutine
; and the BASE10 macro
BASE10 VECTOR[SI]   ; Transform entry from base 16 to base 10
prnt_dig:           ; CX is loaded with the number of digits placed on the stack
    POP DX          ; Get one digit from the stack
    ADD DX, '0'     ; Get the ASCII code for the digit
    MOV AH, 02H     ; Print to console
    INT 21H
LOOP prnt_dig
RET
PRINT_ENTRY ENDP

CODE ENDS
END START