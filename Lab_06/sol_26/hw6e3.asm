DATA SEGMENT PARA PUBLIC 'DATA'
    MY_TABLE    DB    '0123456789ABCDEF'
    NUMBER      DD    12AB34CDH
    NB_STR      DB    8 DUP (0)
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

MOV CX, SIZE NUMBER                 ; Load the size (in bytes) of NUMBER in CX to use LOOP
XOR DI, DI                          ; Make sure that DI = 0
MOV BX, OFFSET MY_TABLE             ; Load the address (offset) of MY_TABLE in BX to use XLAT

iteration:                          ; Iteration label - LOOP will jump here if CX != 0
    MOV SI, CX                      ; Move the current iteration step in SI to index into NUMBER
    DEC SI                          ; Decrement SI since indexation starts from 0

    MOV AL, BYTE PTR NUMBER[SI]     ; Move the SI-th byte from NUMBER into AL (for SI=3, NUMBER[SI] would be the first byte - 12H)
    SHR AL, 4                       ; Shift the byte to the right by 4 bits to isolate the first nibble (for SI=3, AL=01H)
    XLAT                            ; Translate the byte using MY_TABLE (AL=01H becomes AL=31H after executing XLAT - the ASCII code of '1')
    MOV NB_STR[DI], AL              ; Move the translated byte into the DI-th position of NB_STR (for DI=0, NB_STR[DI] would be the first byte)
    INC DI                          ; Increment DI to get to the next byte of NB_STR

    MOV AL, BYTE PTR NUMBER[SI]     ; Move the SI-th byte from NUMBER into AL (for SI=3, NUMBER[SI] would be the first byte - 12H)
    AND AL, 0FH                     ; Use an AND-mask to isolate the last nibble of the byte (for SI=3, AL=02H)
    XLAT                            ; Translate the byte using MY_TABLE (AL=02H becomes AL=32H after executing XLAT - the ASCII code of '2')
    MOV NB_STR[DI], AL              ; Move the translated byte into the DI-th position of NB_STR (for DI=1, NB_STR[DI] would be the second byte)
    INC DI                          ; Increment DI to get to the next byte of NB_STR

    LOOP iteration                  ; Decrement CX and if CX != 0 jump back to iteration
; your code ends here
RET
START ENDP

; Near procedures declaration zone

; End of near procedures declaration zone

CODE ENDS
END START