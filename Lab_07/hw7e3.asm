DATA SEGMENT PARA PUBLIC 'DATA'
    VEC     DB  'we dont talk about Bruno$'
    ; This is a $-terminated string. You can test for it
    ; to see if you reached the end of the string.
    VOW     DB  'o'
    SYM     DB  '*'
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
PUSH OFFSET VEC
PUSH OFFSET VOW
PUSH OFFSET SYM
CALL REPLACE_VOWELS
ADD SP,6
; your code ends here
RET
START ENDP
CODE ENDS

CODE2 SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:CODE2

; Procedure definition
REPLACE_VOWELS PROC FAR

RET
REPLACE_VOWELS ENDP

CODE2 ENDS

END START