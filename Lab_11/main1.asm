DATA SEGMENT PARA PUBLIC 'DATA'
    STRINGY     DB  "racecar"
    LEN_STR     DB  $ - STRINGY
    SYMS        DB  "#$%^&*@"
    LEN_SYMS    DB  $ - SYMS
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

PUSH OFFSET STRINGY
PUSH OFFSET LEN_STR
PUSH OFFSET SYMS
PUSH OFFSET LEN_SYMS
CALL CHG_ID

RET
START ENDP

CHG_ID PROC NEAR
; BP
; IP
; OFFSET LEN_SYSM
; OFFSET SYMS
; OFFSET LEN_STR
; OFFSET STRINGY
    PUSH BP

    MOV BP, SP
    MOV SI, [BP + 10]
    MOV DI, [BP + 8]
    XOR CH, CH
    MOV CL, [DI]
    MOV DI, SI
    ADD DI, CX
    DEC DI

    MOV BX, [BP + 4]
    XOR CH, CH
    MOV CL, [BX]

    MOV BX, [BP + 6]
    ADD CX, BX

    lbl:
        CMP SI, DI
        JAE exit

        MOV AL, [SI]
        CMP AL, [DI]
        JNE continue

        CMP BX, CX
        JB dont_reset

        MOV BX, [BP + 6]
        
        dont_reset:
            MOV AL, [BX]
            MOV [SI], AL
            MOV [DI], AL
            INC BX

        continue:
            INC SI
            DEC DI
            JMP lbl
    exit:
        POP BP
    RET 8
CHG_ID ENDP

CODE ENDS
END START