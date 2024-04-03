DATA SEGMENT PARA PUBLIC 'DATA'

    ; choose byte size values for NUM1 and NUM2
    NUM1    DB  0AH
    NUM2    DB  1FH
    REZ     DB  0

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

; REZ = AL * NUM1 + (NUM2 * AL + BL) + (BL - AH)
; initialize the registers AX with 12AB H and BX with CD34 H
MOV AX, 12ABH
MOV BX, 0CD34H

MOV CL, BL
SUB CL, AH      ; CL = BL - AH
MOV REZ, CL     ; REZ = BL - AH

PUSH AX         ; save AX on the stack
MOV CL, NUM2
MUL CL          ; AX = NUM2 * AL
ADD AL, BL      ; AL = NUM2 * AL + BL
ADD REZ, AL     ; REZ = (BL - AH) + (NUM2 * AL + BL)

POP AX          ; retrieve old AX from the stack
MOV CL, NUM1
MUL CL          ; AX = NUM1 * AL
ADD REZ, AL     ; REZ = (BL - AH) + (NUM2 * AL + BL) + (NUM1 * AL)

; your code ends here
RET
START ENDP

CODE ENDS
END START