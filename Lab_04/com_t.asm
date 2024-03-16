COMMENT * identification information for the program, 
author, program's function, utilization *

CODE SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODE, DS:CODE, ES:CODE
    ORG 100H

START:
    JMP ENTRY
    ; define the data here

ENTRY:
    ; program code begins here

    ; program code ends here

    ; return to OS
    MOV AH, 4CH
    INT 21H 
CODE ENDS ; end of code segment

END START ; end of file