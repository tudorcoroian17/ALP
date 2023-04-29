DATA SEGMENT PARA PUBLIC 'DATA'
    ; Do NOT add other variables to the data segment
    sentence    DB  255, ?, 255 DUP(?)
    letter      DB  ?
    len         DB  ?
DATA ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:CODE, DS:DATA
EXTRN PRINT_STRING:NEAR
START PROC FAR
PUSH DS
XOR AX, AX
MOV DS, AX
PUSH AX
MOV AX, DATA
MOV DS, AX
; your code starts here

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

PREP_PRINT      MACRO buffer
; Prepare the string in buffer to be printed (add '$' at the end of the string)
; buffer --defined-- DB max_size, ef_size, max_size dup (?)
    PUSH SI

    MOV SI, 1
    MOV SI, WORD PTR buffer[SI] ; load in SI the size of the input string
    AND SI, 00FFH           
    ADD SI, 2                   ; get to the end of the string
    MOV buffer[SI], '$'         ; add $ to the end

    POP SI
ENDM

READ_STRING sentence ; read the string
mov dx, ax
; Save string length and copy to string variable
       
READ_CHAR letter
mov ax, dx
; Replace letter with '#' in string
    mov cx, word ptr [sentence[1]]
replaceLoop:
    lodsb
    cmp al, [letter]
    jne skipReplace
    mov al, '#'
skipReplace:
    stosb
    loop replaceLoop

int 21h ; printing new line
mov dl, 0

PREP_PRINT sentence 
CALL PRINT_STRING


; your code ends here
RET
START ENDP

CODE ENDS
END START

