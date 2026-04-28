DATA SEGMENT PARA PUBLIC 'DATA'
    UINT_VAR1       DW      ?
    INPUT_BUFFER    DB      63, ?, 63 DUP (?)
    UINT_VAR2       DW      123
    OUTPUT_BUFFER   DB      'alpha$'
DATA ENDS

EXTRN READ_STRING_P:FAR
EXTRN PRINT_STRING_P:FAR

CODE SEGMENT PARA PUBLIC 'CODE'
EXTRN READ_UINT:NEAR
EXTRN PRINT_UINT:NEAR
ASSUME CS:CODE, DS:DATA
START PROC FAR
PUSH DS
XOR AX, AX
MOV DS, AX
PUSH AX
MOV AX, DATA
MOV DS, AX
; your code starts here
PUSH OFFSET UINT_VAR1
CALL READ_UINT

PUSH OFFSET INPUT_BUFFER
CALL READ_STRING_P

; Testing the printing functionality does not work good with turbo debugger.
; If you wwant to test the following two procedure calls, you should just execute
; the main file (i.e., write main.exe in the console after assemble and link).
; You should also run the program through the turbo debugger to see how the values
; of the registers and the memory change.

PUSH OFFSET UINT_VAR2
CALL PRINT_UINT

PUSH OFFSET OUTPUT_BUFFER
CALL PRINT_STRING_P
; your code ends here
RET
START ENDP

CODE ENDS
END START