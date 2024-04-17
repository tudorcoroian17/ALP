DATA SEGMENT PARA PUBLIC 'DATA'
    TTABLE   DB  '0123456789ABCDEF'
    NUMBER  DD  12AB34CDH
    NB_STR  DB  8 DUP (0) 
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

; initialize values
MOV DI, 3   ; DI = 0003 because we need to start from NUMBER[3] to get the first byte
MOV SI, 0
MOV CX, 4   ; CX = 0004 because the number has 4 bytes

lbl:
    ; isolate byte of the number
    MOV DL, BYTE PTR NUMBER[DI]

    ; isolate first digit of the byte
    SHR DX, 4
    AND DL, 0FH

    ; translate digit to ASCII character
    MOV AL, DL
    MOV BX, OFFSET TTABLE
    XLAT TTABLE

    ; place digit in the string variable
    MOV NB_STR[SI], AL

    ; go to next place in the string variable
    INC SI

    ; isolate the same byte of the number
    MOV DL, BYTE PTR NUMBER[DI]

    ; isolate second digit of the byte
    AND DL, 0FH

    ; translate digit to ASCII character
    MOV AL, DL
    MOV BX, OFFSET TTABLE
    XLAT TTABLE

    ; place digit in the string variable
    MOV NB_STR[SI], AL

    ; go to next place in the string variable
    INC SI

    ; go to next byte in number variable
    DEC DI

LOOP lbl  

; your code ends here
RET
START ENDP

CODE ENDS
END START