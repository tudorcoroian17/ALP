DATA SEGMENT PARA PUBLIC 'DATA'

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

; DX = 7 * AX - 2 * BX - BX / 8
; initialize AX with 267 D and BX with 572 D

MOV AX, 267D
MOV BX, 572D

MOV CX, AX      ; keep old AX_old
SAL AX, 3       ; AX_new = 8 * AX_old
SUB AX, CX      ; AX_new = 7 * AX_old

MOV CX, BX      ; keep old BX_old
SAL BX, 1       ; BX_mul = 2 * BX_old
PUSH BX         ; save new BX_mul on the stack

MOV BX, CX      ; move old BX_old
SAR BX, 3       ; BX_div = BX_old / 8
POP CX          ; retrieve new BX_mul from stack in CX
                ; CX = 2 * BX_old

MOV DX, AX      ; DX = 7 * AX_old
SUB DX, CX      ; DX = 7 * AX_old - 2 * BX_old
SUB DX, BX      ; DX = 7 * AX_old - 2 * BX_old - BX_old / 8


; your code ends here
RET
START ENDP

CODE ENDS
END START