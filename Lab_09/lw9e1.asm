INCLUDE maclib.asm

DATA SEGMENT PARA PUBLIC 'DATA'
    VEC     DB  32 DUP (0)
    A_VEC   DW  VEC
    LEN     DB  ?
    A_LEN   DW  LEN
    SUM     DB  ?
    A_SUM   DW  SUM
    MSG1    DB  "Enter the numbers in the vector, separated by comma. Press ENTER when done: $"
    A_MSG1  DW  MSG1
    MSG2    DB  "The sum of all numbers is: $"
    A_MSG2  DW  MSG2
    ENTR    DB  0AH, 0DH, '$'
    TEN     DB  10
DATA ENDS

; Macro declaration zone
; End of macro declaration zone

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
PRINT_MSG A_MSG1
; your code ends here
RET
START ENDP

; Near procedures declaration zone

; End of near procedures declaration zone

CODE ENDS
END START