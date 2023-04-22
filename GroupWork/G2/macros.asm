READ_STRING     MACRO buffer
; Read a string from the keyboard
; buffer --defined-- DB max_size, ef_size, max_size dup (?)
    PUSH AX
    PUSH DX

    MOV AH, 0AH
    LEA DX, buffer
    INT 21H

    POP DX
    POP AX
ENDM

READ_CHAR       MACRO character
; Read a character from the keyboard
; character --defined-- DB ?
    PUSH AX

    MOV AH, 01H
    INT 21H
    MOV character, AL

    POP AX
ENDM
END

PREP_PRINT      MACRO buffer
; Prepare the string in buffer to be printed (add '$' at the end of the string)
; buffer --defined-- DB max_size, ef_size, max_size dup (?)
    PUSH SI

    MOV SI, 1
    MOV SI, WORD PTR buffer[SI]   ; load in SI the size of the input string
    AND SI, 00FFH           
    ADD SI, 2                   ; get to the end of the string
    MOV buffer[SI], '$'           ; add $ to the end

    POP SI
ENDM