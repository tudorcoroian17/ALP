; Check https://redirect.cs.umbc.edu/courses/undergraduate/CMSC211/fall02/burt/lectures/Chap18/DOSerrors.html
; for error codes

DATA SEGMENT PARA PUBLIC 'DATA'
    FILE_NAME_1     DB      "Tudor.txt"
    ATTR_NORMAL     DW      0H
    FILE_HANDLE_1   DW      ?
    FILE_NAME_2     DB      "Coroian.csv", 0
    OPEN_ACC_RW     DB      02H
    FILE_HANDLE_2   DW      ?
    INPUT_BUFFER    DB      63 DUP (?)
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

    ; Creating the file
    MOV AH, 3CH
    MOV CX, ATTR_NORMAL
    LEA DX, FILE_NAME_1
    INT 21H
    MOV FILE_HANDLE_1, AX

    ; Opening a file
    MOV AH, 3DH
    MOV AL, OPEN_ACC_RW
    LEA DX, FILE_NAME_2
    INT 21H
    MOV FILE_HANDLE_2, AX

    ; Read from file
    MOV AH, 3FH
    MOV BX, FILE_HANDLE_2
    MOV CX, 63
    LEA DX, INPUT_BUFFER
    INT 21H

    ; Write to file
    MOV CX, AX
    SUB CX, 2
    MOV AH, 40H
    MOV BX, FILE_HANDLE_1
    LEA DX, INPUT_BUFFER
    INT 21H

RET
START ENDP

; Near procedures declaration zone

; End of near procedures declaration zone

CODE ENDS
END START