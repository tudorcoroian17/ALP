DATA SEGMENT PARA PUBLIC 'DATA'
    ; Do NOT add other variables to the data segment
    sentence    DB  255, ?, 255 DUP(?)
    letter      DB  ?
    len         DB  ?
DATA ENDS

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
READ_STRING sentence
READ_CHAR letter
MOV DL, letter
READ_CHAR letter
MOV DH, letter
CMP DH, 0DH 
JE here
RET
here:
MOV letter, DL
PREP_PRINT sentence
CALL LNG
CALL SOLVE
XOR DX, DX
LEA DX, sentence
CALL PRINT_STRING
; your code ends here
RET
START ENDP

PRINT_STRING    PROC NEAR
; Print a string with its effective address loaded in DX
    MOV AH, 09H
    ADD DX, 2
    INT 21H  
    RET
ENDP

LNG PROC NEAR
MOV SI, 2
MOV len, 0	
	L:	
	CMP sentence[SI], '$'
	JE ENT
	INC len
	INC SI
	JMP L
	
	ENT:
		RET
LNG ENDP

SOLVE PROC NEAR
	MOV SI, 2
	XOR CX, CX
	MOV CL, len
	NEXT :
		MOV AL, letter
		CMP sentence[SI], AL
		JE change
		SUB AL, 32
		CMP sentence[SI], AL
		JE change
		INC SI
		LOOP NEXT
	RET
	change : MOV sentence[SI], '#'
			 INC SI
			 LOOP NEXT
	exit : RET
	
SOLVE ENDP

;INCOMPLETE SOLUTION FOR THE SECOND STATEMENT

;SOLVE2 PROC NEAR
;	XOR CX, CX
;	XOR AX, AX
;	MOV CL, len
;	NXT:
;		MOV AL, letter
;		CMP sentence[CX], AL
;		MOV AH, CL
;		JE del
;	LOOP NEXT
;	RET
;	del : 
;		MOV SI, CL
;		SUB len, CL
;		MOV CL, len
;		lp:
;			MOV DL, SI
;			INC SI
;			MOV sentence[DL], sentence[SI]
;			DEC len
;		LOOP lp
;	JMP NXT
;SOLVE2 ENDP

CODE ENDS
END START