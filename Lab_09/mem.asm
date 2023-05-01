_ZONA   STRUC
    VAL1    DD ?
    VAL2    DD ?
    RETURN  DD ?
_ZONA ENDS

DATA SEGMENT PARA PUBLIC 'DATA'
    MEM_ZONE    _ZONA   <10, 20, ?>
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
    LEA BX, MEM_ZONE    ; Load in BX the memory zone that contains the parameters
    ; call procedure
; your code ends here
RET
START ENDP

CODE ENDS
END