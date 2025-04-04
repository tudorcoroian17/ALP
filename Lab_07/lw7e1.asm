; Write a near type procedure that, given an address for the ASCII representation of a
; decimal number and another address for the value of that number (via the stack, pushed
; in this order), it will construct the number to the second memory location.

DATA SEGMENT PARA PUBLIC 'DATA'
    NB_STR      DB  4, '1234'   ; NB_STR[0] = lenght of the string
                                ; NB_STR[1:8] = the string
    ADR_NB_STR  DW  NB_STR
    NUMBER      DW  0
    ADR_NUMBER  DW  NUMBER
    TEN         DB  10
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
PUSH ADR_NB_STR
PUSH ADR_NUMBER
CALL DEC_STR_TO_NB
; your code ends here
RET
START ENDP


DEC_STR_TO_NB PROC NEAR
; Decimal string to number converter
; e.g.: 167 = ((1 * 10) + 6) * 10) + 7
    MOV BP, SP      ; Get current value of SP
    MOV SI, [BP+2]  ; Skip the IP value on the stack and load ADR_NUMBER in BX
    MOV DI, [BP+4]  ; SKIP the IP and ADR_NUMBER on the stack and load ADR_NB_STR in DX

    XOR CX, CX
    MOV CL, [DI]    ; CX contains ADR_NB_STR[0] - the length of the string
    INC DI, 1       ; Begining of the string is 1, not 0

    parse:
        XOR AX, AX
        MOV AL, [DI]            ; Move the next digit of NB_STR in AL
        SUB AL, '0'             ; Get the value of the ASCII character (e.g. '1' - '0' = 1 bcs: 31H - 30H = 1)
        PUSH AX                 ; Put the digit on the stack

        MOV AX, [SI]            ; Load AX with the value of the number so far
        MUL TEN                 ; Multiply the number by 10 
        MOV [SI], AX            ; Put the new number back in memory
        POP AX                  ; Retrieve the digit from the stack
        ADD BYTE PTR [SI], AL   ; Add the digit to the number

        INC DI                  ; Move to the next digit
    LOOP parse
RET 4                           ; RET 4 will add 4 bytes to SP upon return to the main procedure
                                ; in order to change the top of the stack to the value it had before
                                ; pushing the parameters for the procedure on the stack
DEC_STR_TO_NB ENDP

CODE ENDS
END START