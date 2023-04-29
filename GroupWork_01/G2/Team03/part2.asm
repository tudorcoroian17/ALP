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


SWAP    MACRO x, y
; Swap the values of x and y
    PUSH AX         ; Save contents of AX and BX
    PUSH BX

    MOV AX, x
    MOV BX, y
    MOV x, BX
    MOV y, AX

    POP BX          ; Restore contents of AX and BX
    POP AX
ENDM

DATA SEGMENT PARA PUBLIC 'DATA'
    ; Do NOT add other variables to the data segment
    sentence    DB  255, ?, 255 DUP(?)
    letter      DB  ?
    len         DB  5
DATA ENDS

;MACROS

CODE SEGMENT PARA PUBLIC 'CODE'
PUBLIC  PRINT_STRING
ASSUME CS:CODE, DS:DATA
START PROC FAR
PUSH DS
XOR AX, AX
MOV DS, AX
PUSH AX
MOV AX, DATA
MOV DS, AX
; your code starts here

READ_STRING sentence

READ_CHAR letter

PREP_PRINT sentence

MOV CX, WORD PTR len ; length of the string
MOV SI, 0 ; register for indexing in vectors
lbl:
    CALL SWITCH
    LOOP lbl

LEA DX, sentence

CALL PRINT_STRING
ret
START ENDP

SWITCH PROC NEAR

    MOV DL, sentence[SI]  ; load letter in DL
    CMP DL, letter         ; compare with 'a'
    JE  make            ; return if < 'a'

	
    INC SI              ; increment index
	ret
make:
    MOV DL, 23H
	MOV sentence[SI], DL  ; store letter in memory
	INC SI              ; increment index
	RET
SWITCH ENDP



PRINT_STRING    PROC NEAR
; Print a string with its effective address loaded in DX
    MOV AH, 09H
    ADD DX, 2
    INT 21H  
    RET
PRINT_STRING ENDP
;CALL PRINT_STRING

; your code ends here

;RET
;START ENDP
;

 ;   MOV DL, string[SI]  ; load letter in DL
  ;  CMP DL, 41H         ; compare with 'a'
   ; JB  exit            ; return if < 'a'
 ;   CMP DL, 7AH         ; compare with 'z'
  ;  JA  exit            ; return if > 'z'
;
;	CMP DL, letter
;	JA 
 ;;   SUB DL, 20H         ; make upper case
   ; MOV string[SI], DL  ; store letter in memory
    ;INC SI              ; increment index
;exit:
 ;   RET
;UPPER   ENDP
CODE ENDS
END START