CODE2 SEGMENT PARA PUBLIC 'CODE'

    PUBLIC REPLACE_ODD

ASSUME CS:CODE2

REPLACE_ODD PROC FAR
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
        JNE even_lbl

        ADD [SI], DL

        even_lbl:
            INC SI
    LOOP parse


RET 6
REPLACE_ODD ENDP

CODE2 ENDS
END ; Always put an end to things :D