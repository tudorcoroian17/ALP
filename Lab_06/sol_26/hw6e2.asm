DATA SEGMENT PARA PUBLIC 'DATA'
    ORG         02ACH
    VAR1        DW    4567H
    ADR_VAR1    DD    VAR1
    VAR2        DD    ?
    ADR_VAR2    DD    VAR2
DATA ENDS

DATA2 SEGMENT PARA PUBLIC 'DATA'
    ORG         0A01H
    VAR3        DW    ?
    ADR_VAR3    DD    VAR3
    VAR4        DD    1200AB00H
    ADR_VAR4    DD    VAR4
DATA2 ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:CODE, DS:DATA, ES:DATA2
START PROC FAR
; Initialize DS with adr of DATA
PUSH DS
XOR AX, AX
MOV DS, AX
PUSH AX
MOV AX, DATA
MOV DS, AX

; Initialize ES with adr of DATA2
PUSH ES
XOR AX, AX
MOV ES, AX
PUSH AX
MOV AX, DATA2
MOV ES, AX
; your code starts here

; Moving VAR1 into VAR3
MOV AX, VAR1    ; Move the value of VAR1 in AX
LEA DI, VAR3    ; Load the address (offset) of VAR3 in DI
MOV ES:[DI], AX ; Use DI with ES to move the value of AX (which has VAR1) in VAR3 (pointed to by ES:[DI])

; Moving VAR4 into VAR2
LEA SI, VAR4                    ; Load the address (offset) of VAR4 in SI 
MOV AX, WORD PTR ES:[SI]        ; Use SI with ES to move the value of the first two bytes of VAR4 into AX
MOV DX, WORD PTR ES:[SI + 2]    ; Use SI with ES to move the value of the last two bytes (SI+2) of VAR4 into BX
LEA BX, VAR2                    ; Load the address (offset) of VAR2 in BX
MOV WORD PTR [BX], AX           ; Use BX (with implicit DS) to move the value of AX (which has the first two bytes of VAR4) into the first two bytes of VAR2
MOV WORD PTR [BX + 2], DX       ; Use BX (with implicit DS) to move the value of DX (which has the last two bytes of VAR4) into the last two bytes (BX+2) of VAR2

; your code ends here
RET
START ENDP

CODE ENDS
END START
