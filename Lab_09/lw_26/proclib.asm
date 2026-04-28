INCLUDE maclib.asm

CODE SEGMENT PARA PUBLIC 'CODE'
PUBLIC READ_UINT
PUBLIC PRINT_UINT
ASSUME CS:CODE
READ_UINT PROC NEAR
    PUSH BP

    MOV BP, SP
    MOV SI, [BP + 4]
    MOV BX, [SI]
    XOR DX, DX

    read_d:
        READ_CHAR       ; AL will contain the digit read from the keyboard
        CMP AL, 0DH     ; Check if enter was pressed
        JE store_nb

        SUB AL, '0'     ; AL will contain the value of the digit
        MOV CL, AL      ; Save the digit in a separate register
        MOV AX, DX      ; Load the number constructed so far in AX
        MOV CH, 10      ; Load 10 in CH to multiply
        MUL CH          ; Multiply the number constructed so far with 10
        XOR CH, CH      ; Clear CH
        ADD AX, CX      ; Add the digit that was read
        MOV DX, AX      ; Save the number read so far
        JMP read_d

        store_nb:
            MOV [BX], DX

    POP BP
RET 2
READ_UINT ENDP

PRINT_UINT PROC NEAR
    PUSH BP

    MOV BP, SP
    MOV SI, [BP + 4]
    MOV AX, [SI]            ; Store the number to print in AX
    MOV BL, 10              ; Load 10 in BL for division
    XOR BH, BH              ; Clear BH to use it as counter of how many digits are stored on the stack

    parse_nb:
        DIV BL              ; Divide the number by 10

        ADD AH, '0'         ; Take the remainder (AX mod 10) and add '0' to convert it to ASCII code for that digits
        XOR CH, CH          ; Clear CH
        MOV CL, AH          ; Place the ASCII digit on the low byte of CX
        PUSH CX             ; Store the digit on the stack (because we want to print the remainders (digits) in reverse order)
        INC BH              ; Increment BH to count another digit placed on the stack
        XOR AH, AH          ; Clear AH for the next division

        CMP AX, 0           ; Check if AX = 0, meaning the whole number was converted into a string of ASCII digits
        JNE parse_nb

    XOR CX, CX              ; Clear CX
    MOV CL, BH              ; Load the number of digits in CX to use the LOOP instruction

    print_dig:
        POP AX              ; Load one ASCII digit from the stack
        PRINT_CHAR AL       ; Print the digit using a macro
    LOOP print_dig

    POP BP
RET 2
PRINT_UINT ENDP
CODE ENDS

CODE2 SEGMENT PARA PUBLIC 'CODE'
PUBLIC READ_STRING_P
PUBLIC PRINT_STRING_P
ASSUME CS:CODE2
READ_STRING_P PROC FAR
    ; Read a string from the keyboard until enter is pressed
    PUSH BP

    MOV BP, SP
    MOV DX, [BP + 6]
    MOV AH, 0AH
    INT 21H

    POP BP
RET 2
READ_STRING_P ENDP

PRINT_STRING_P PROC FAR
    ; Print a $-terminated string to the screen
    PUSH BP

    MOV BP, SP
    MOV DX, [BP + 6]
    MOV AH, 09H
    INT 21H

    POP BP
RET 2
PRINT_STRING_P ENDP

CODE2 ENDS
END