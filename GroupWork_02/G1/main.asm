DATA SEGMENT PARA PUBLIC 'DATA'
    PRELUDE     DB  "The decrypted message is: $"
    MESSAGE1    DB  "@qsi k@qd d@dr@x jiylct j@#t d@ y# k@qdj ki@fx fdgc@d@#kqkfy# (y#cp ki@ vfc@ sy#kqf#f#w ki@ gxys@tlx@).$"
    MSG1_LEN    DB  $ - MESSAGE1 - 1
    MESSAGE2    DB  "@qsi k@qd d@dr@x jiylct qcjy j@#t d@ ki@ cfjkf#w qjjysfqk@t nfki ki@ qjd vfc@. iqggp syttf#w!$"
    MSG2_LEN    DB  $ - MESSAGE2 - 1
    MESSAGE3    DB  "yi, q#t y#@ dyx@ kif#w: @qsi jklt@#k jiylct qcjy j@#t d@ y# k@qdj niqk qx@ ki@ mqcl@j f# @qsi w@#@xqc qlxgyj@ x@wfjk@x qvk@x xl##f#w ki@ niyc@ syt@ (q jsx@@#jiyk).$"
    MSG3_LEN    DB  $ - MESSAGE3 - 1
    KEY1        DB  10H
    KEY2_1      DB  "@u"
    KEY2_2      DB  "#e"
    KEY3_1      DB  "xi"
    KEY3_2      DB  "yf"
DATA ENDS

START_REG_VALS MACRO
    MOV AX, 8008H
    MOV BX, 0420H
    MOV CX, 6969H
    MOV DX, 1258H
ENDM

STORE_GEN_REGS MACRO
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
ENDM

RESTORE_GEN_REGS MACRO
    POP DX
    POP CX
    POP BX
    POP AX
ENDM

PRINT_STRING MACRO OFFSET_MSG
    MOV DX, OFFSET_MSG
    MOV AH, 09H
    INT 21H
ENDM

PRINT_NEW_LINE MACRO
    MOV AH, 02H
    MOV DL, 0AH
    INT 21H
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
ENDM

CODE SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODE, DS:DATA
    START PROC FAR
        PUSH DS
        XOR AX, AX
        MOV DS, AX
        PUSH AX
        MOV AX, DATA
        MOV DS, AX
        START_REG_VALS  ; do not remove

        MOV SI, OFFSET PRELUDE
        PRINT_STRING SI
        PRINT_NEW_LINE

        ; calls to decoding functions here

        ; until here

        MOV SI, OFFSET MESSAGE1
        PRINT_STRING SI
        PRINT_NEW_LINE
        MOV SI, OFFSET MESSAGE2
        PRINT_STRING SI
        PRINT_NEW_LINE
        MOV SI, OFFSET MESSAGE3
        PRINT_STRING SI
        PRINT_NEW_LINE

        RET
    START ENDP
CODE ENDS
END START