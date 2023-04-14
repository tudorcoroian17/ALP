DATA SEGMENT PARA PUBLIC 'DATA'
    ten     DB  0AH
    tbl     DB  '0123456789ABCDEF'
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
CALL READ_UNS_INT
CALL PRINT_UNS_INT
; your code ends here
RET
START ENDP

; Read an unsigned integer from the keyboard in base 10 and store
; it in BX
READ_UNS_INT    PROC NEAR
    MOV BX, 0
begin:  
    CALL READ_DIG
    CMP AL, 0DH     ; Check if enter was pressed (ENTER = 0A0DH)
    JE exit         
    MOV AH, 0
    PUSH AX         ; Put number on the stack
    MOV AX, BX      ; Get the number read so far
    MUL ten         ; Multiply by ten
    POP BX          ; Get number from the stack
    ADD BX, AX      ; Add with previous number
    JMP begin
exit:
    RET
READ_UNS_INT    ENDP

; Print and unsigned integer stored in BX
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

READ_DIG    PROC NEAR
    MOV AH, 01H
    INT 21H
    CMP AL, 0DH     ; Check if enter was pressed (ENTER = 0A0DH)
    JE nope
    SUB AL, '0'     ; Transform from ASCII to integer
nope:
    RET
READ_DIG    ENDP

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