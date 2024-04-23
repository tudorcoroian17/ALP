DATA SEGMENT PARA PUBLIC 'DATA'
    NUMBER          DW  ?
    ADR_NB          DW  NUMBER
    ASCII_DIGIT     DB  ?
    ADR_A_DIGIT     DW  ASCII_DIGIT
    MSG1            DB  'Enter number: $'
    ADR_MSG1        DW  MSG1
    MSG2            DB  'The result is: $'
    ADR_MSG2        DW  MSG2
DATA ENDS

; Macro declaration zone
PRINT_MSG MACRO MSG_PTR
    ; Print a $-terminated message to the console
    PUSH AX
    PUSH DX

    MOV AH, 09H
    MOV DX, MSG_PTR
    INT 21H

    POP DX
    POP AX
ENDM
; End of macro declaration zone

CODE SEGMENT PARA PUBLIC 'CODE'
EXTRN   READ_DEC_NUMBER:NEAR
EXTRN   PRINT_DEC_NUMBER:FAR
ASSUME CS:CODE, DS:DATA
START PROC FAR
PUSH DS
XOR AX, AX
MOV DS, AX
PUSH AX
MOV AX, DATA
MOV DS, AX
; your code starts here

PRINT_MSG ADR_MSG1

PUSH ADR_NB
PUSH ADR_A_DIGIT
CALL READ_DEC_NUMBER

CALL NEW_LINE

PRINT_MSG ADR_MSG2

PUSH ADR_NB
CALL MODIFY_NB

PUSH ADR_NB
PUSH ADR_A_DIGIT
CALL PRINT_DEC_NUMBER

; your code ends here
RET
START ENDP

; Near procedures declaration zone
NEW_LINE PROC NEAR
    ; Print a new line to the console
    MOV AH, 02H
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
RET
NEW_LINE ENDP
; End of near procedures declaration zone

CODE ENDS

CODE3 SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:CODE3

MODIFY_NB PROC FAR
    ; Write a procedure that adds 12H to a number
    ; with the address sent via the stack
RET 2
MODIFY_NB ENDP

CODE3 ENDS
END START