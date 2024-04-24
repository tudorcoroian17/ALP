; Check https://redirect.cs.umbc.edu/courses/undergraduate/CMSC211/fall02/burt/lectures/Chap18/DOSerrors.html
; for error codes

DATA SEGMENT PARA PUBLIC 'DATA'
    ATTR_NORMAL     DW  0000H
    FILE_NAME       DB  'test.txt',0
    ADR_FILE_NAME   DW  FILE_NAME
    READ_WRITE      DB  02H
    BUFFER_TO_WRITE DB  'testw'
    ADR_BUFFER      DW  BUFFER_TO_WRITE
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

    ; Create a file
    MOV AH, 3CH
    XOR CX, CX
    OR CX, ATTR_NORMAL
    MOV DX, ADR_FILE_NAME
    INT 21H

    ; Open file
    MOV AH, 3DH
    MOV AL, 0
    OR AL, READ_WRITE
    MOV DX, ADR_FILE_NAME
    INT 21H
    MOV BX, AX ; get file handle

    ; Write in file
    MOV AH, 40H
    MOV CX, 5
    MOV DX, ADR_BUFFER
    INT 21H

    ; Close file
    MOV AH, 3EH
    INT 21H


; your code ends here
RET
START ENDP

; Near procedures declaration zone

; End of near procedures declaration zone

CODE ENDS
END START