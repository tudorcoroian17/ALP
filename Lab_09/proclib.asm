INCLUDE maclib.asm

CODE SEGMENT PARA PUBLIC 'CODE'
PUBLIC READ_DEC_NUMBER
ASSUME CS:CODE
; NEAR procedures declaration zone

READ_DEC_NUMBER PROC NEAR
    ; Write a procedure that reads a decimal number
    ; Use the READCHAR macro
    MOV BL, 10
    MOV BP, SP
    MOV SI, [BP + 2] ; digit
    MOV DI, [BP + 4] ; number
    do_while_loop:
        READCHAR [SI]

        ; test the stop condition
        MOV CH, 's'
        CMP BYTE PTR [SI], CH
        JE stop

        ; test that we read a digit and skip 
        ; anything that is not a digit
        MOV CH, '0'
        CMP [SI], CH
        JB do_while_loop
        MOV CH, '9'
        CMP [SI], CH
        JA do_while_loop

        ; subtract '0' to obtain the value of the digit
        MOV CH, '0'
        SUB [SI], CH
        XOR CX, CX
        MOV CL, BYTE PTR [SI]

        ; add the digit to the number
        MOV AX, [DI]
        MUL BL
        ADD AX, CX
        MOV [DI], AX
        JMP do_while_loop

    stop:

RET 4
READ_DEC_NUMBER ENDP

; End of NEAR procedures declaration zone
CODE ENDS

CODE2 SEGMENT PARA PUBLIC 'CODE'
PUBLIC PRINT_DEC_NUMBER
ASSUME CS:CODE2
; FAR procedures declaration zone

PRINT_DEC_NUMBER PROC FAR
    ; Write a procedure that prints a decimal number
    ; Use the PRINTCHAR macro
    MOV BL, 10
    MOV BH, 0       ; keep a counter of how many digits we put on stack
    MOV BP, SP
    MOV SI, [BP + 4]    ; digit
    MOV DI, [BP + 6]    ; number

    do_while_loop2:
        MOV AX, [DI]
        CMP AX, 0
        JE stop2

        DIV BL          ; AH has the remainder, AL has the quotient
        XOR CX, CX
        MOV CL, AH
        PUSH CX         ; Put the remainder on the stack
        INC BH          ; Increment counter

        MOV AH, 0
        MOV [DI], AX
        JMP do_while_loop2

    stop2:

    ; get the digits back from the stack and print them one by one
    XOR CX, CX
    MOV CL, BH
    for_loop:
        POP BX
        ADD BL, '0'
        MOV BYTE PTR [SI], BL
        PRINTCHAR [SI]
    LOOP for_loop
RET 4
PRINT_DEC_NUMBER ENDP

; End of FAR procedures declaration zone
CODE2 ENDS
END