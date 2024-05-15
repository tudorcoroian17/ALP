DATA SEGMENT PARA PUBLIC 'DATA'
    RADIUS      DQ      8.567
    AREA        DQ      ?
DATA ENDS

; Macro declaration zone

; End of macro declaration zone

CODE SEGMENT PARA PUBLIC 'CODE'
.8087
ASSUME CS:CODE, DS:DATA
START PROC FAR
PUSH DS
XOR AX, AX
MOV DS, AX
PUSH AX
MOV AX, DATA
MOV DS, AX
; your code starts here
    FINIT
    FLD RADIUS
    FMUL RADIUS
    FLDPI
    FMUL
    FSTP AREA
    FWAIT
; your code ends here
RET
START ENDP

; Near procedures declaration zone

; End of near procedures declaration zone

CODE ENDS
END START