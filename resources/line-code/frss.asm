DATA SEGMENT PARA PUBLIC 'DATA'
    VEC     DB      5, 15, 21, 98, 32, 17, 29
    LEN     DB      $ - VEC
    NUM     DB      7
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
PUSH OFFSET LEN
PUSH OFFSET NUM
CALL REPLACE_EVEN
; your code ends here
RET
START ENDP

REPLACE_EVEN PROC FAR
    PUSH BP
    
    MOV BP, SP

    MOV SI, [BP + 8]
    XOR CX, CX
    MOV CL, [SI]

    MOV SI, [BP + 6]
    XOR DX, DX
    MOV DL, [SI]

    MOV SI, [BP + 10]

    POP BP

    parse:
        XOR AX, AX
        MOV AL, [SI]
        AND AL, 01H
        CMP AL, 01H
        JNE even

        ADD [SI], DL

        even:
            INC SI
    LOOP parse


RET 6
REPLACE_EVEN ENDP

CODE ENDS
END START