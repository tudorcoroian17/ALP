COMMENT * identification information for the program, 
author, program's function, utilization *

; declaration of extern variables or functions

; global public variables defined in this file

; constants definition and INCLUDE instructions

; macro definitions

; data section
DATA SEGMENT PARA PUBLIC 'DATA'
    ; define your data here
DATA ENDS

; stack section
STACK SEGMENT PARA STACK 'STACK'
    ; change 256 to the size of the stack you want to define
    DW  256  DUP(?)             ; stack will contain 256 words
    STACK_START LABEL   WORD    ; top of the stack
STACK ENDS

; code section
CODE SEGMENT PARA PUBLIC 'CODE'
START   PROC FAR ; start main procedure
    ASSUME CS:CODE, DS:DATA, SS:STACK

    ; instructions to allow the return to OS or
    ; other program
    PUSH DS
    XOR AX, AX
    PUSH AX

    ; initialize DS with the start of the data segment
    MOV AX, DATA
    MOV DS, AX

    ; main code here

    RET ; return to OS or other program
START ENDP ; end main procedure

; other procedures (i.e. functions)

CODE ENDS

END START ; end the file