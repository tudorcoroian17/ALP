DATA SEGMENT PARA PUBLIC 'DATA'
    STRING    DB    "Quoth the Raven <<Nevermore.>>$"
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
PUSH OFFSET STRING
CALL UPPER
; your code ends here
RET
START ENDP

UPPER PROC FAR
    PUSH BP

    MOV BP, SP
    MOV SI, [BP + 6]        ; Move the start of the string into SI

    continue:
        MOV AL, [SI]        ; Move the element of the string into a register to perform operations on it

        CMP AL, '$'         ; Check if we reached the end of the string and stop
        JE stop

        ; Check if the character is in the ['a'-'z'] interval (based on the ASCII code)

        CMP AL, 'a'         ; Check if the character is "below" 'a' in ASCII code and skip if yes
        JB skip

        CMP AL, 'z'         ; Check if the character is "above" 'z' in ASCII code and skip if yes
        JA skip

        SUB AL, 20H         ; Subtract 32 (20H) to change from lower case to upper case
        MOV [SI], AL        ; Move the modified character back in the string

        skip:
            INC SI          ; Go to the next character
    JMP continue

    stop:
    POP BP
RET 2
UPPER ENDP

CODE ENDS
END START