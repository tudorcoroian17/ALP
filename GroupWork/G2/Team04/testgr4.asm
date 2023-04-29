DATA SEGMENT PARA PUBLIC 'DATA'
    sentence   DB  255, ?, 255 DUP (?)
	letter    DB ?
	len       DB ?
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
CALL READS
CALL READC
CALL READC
CALL SOLVE
CALL PRINTS
;CALL PRINTS
; your code ends here
RET
START ENDP
 
 
READS   PROC NEAR
    MOV AH, 0AH
    LEA DX, sentence
    INT 21H
    RET
READS   ENDP
 
READC   PROC NEAR
    MOV AH, 01H
    INT 21H
	CMP AL, 0DH
	JE exit1
	MOV letter, AL
	exit1: RET
READC   ENDP
 
PRINTS  PROC NEAR
    MOV SI, 1
    MOV SI, WORD PTR sentence[SI]  ; load in SI the size of the input string
    AND SI, 00FFH
    ADD SI, 2
    MOV sentence[SI], '$'          ; add the $ to the end of the string
    MOV AH, 09H
    LEA DX, sentence
    ADD DX, 2                       ; skip over the first 2 bytes in sentence
    INT 21H
    RET
PRINTS  ENDP
  
SOLVE PROC NEAR
	MOV SI, 2
	XOR CX, CX
	MOV CL, sentence[1]
	;SUB CL, 2
	;ADD SI, 2
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

;SOLVE_DEL PROC NEAR
;	MOV SI, 2
;	XOR CX, CX
;	MOV CL, sentence[1]
;	L :
;		MOV AL, letter
;		CMP sentence[SI], AL
;		JE del
;		INC SI
;		LOOP L
;	del :
;		MOV DI, SI
;		PUSH CX
;		NXT:
;			MOV AL, [DI+1]
;			MOV [DI], AL
;			INC DI
;		LOOP NXT
;		POP CX
;		DEC CX
;		LOOP L
;SOLVE_DEL ENDP

CODE ENDS
END START
