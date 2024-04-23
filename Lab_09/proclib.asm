INCLUDE maclib.asm

CODE SEGMENT PARA PUBLIC 'CODE'
PUBLIC READ_DEC_NUMBER
ASSUME CS:CODE
; NEAR procedures declaration zone

READ_DEC_NUMBER PROC NEAR
    ; Write a procedure that reads a decimal number
    ; Use the READCHAR macro

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

RET 4
PRINT_DEC_NUMBER ENDP

; End of FAR procedures declaration zone
CODE2 ENDS
END