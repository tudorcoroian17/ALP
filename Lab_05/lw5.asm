DATA SEGMENT PARA PUBLIC 'DATA'
    REZ_1       DB  0
    REZ_2       DB  0
    REZ_3       DB  0
    REZ_4       DW  0
    REZ_5       DB  0
    REZ_6       DB  0
    REZ_7       DB  0
    REZ_8       DB  0
    REZ_9       DW  0
    REZ_10      DB  0
    REZ_11      DW  0
    REZ_12      DW  0
    REZ_13      DD  0
    REZ_14      DD  0
    REZ_15      DW  0
    REZ_16      DD  0
    REZ_17      DW  0
    REZ_18      DD  0
    REZ_19      DW  0
    REZ_20_Q    DB  0
    REZ_20_R    DB  0
    REZ_21_Q    DB  0
    REZ_21_R    DB  0 
    REZ_22_Q    DB  0
    REZ_22_R    DB  0 
    REZ_23_Q    DB  0
    REZ_23_R    DB  0  
    REZ_24_Q    DB  0
    REZ_24_R    DB  0
    REZ_25      DW  0
    REZ_26      DW  0
    REZ_27      DW  0
    REZ_28      DW  0
    REZ_29      DW  0
    REZ_30      DW  0
    REZ_31      DW  0
    REZ_32      DW  0
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

; 1. Add 12 D and 31 D. The numbers will be represented in C2.
XOR AX, AX
    ; One way to add two numbers
MOV AL, 12D
ADD AL, 31D
MOV REZ_1, AL

; 2. Add 123 D and 42 D. The numbers will be represented in C2.
XOR AX, AX
XOR BX, BX
    ; Another way to add two numbers
MOV AL, 123D
MOV BL, 42D
ADD AL, BL
MOV REZ_2, AL

; 3. Add 72 D and -12 D. The numbers will be represented in C2.
    ; Yet another way to add two numbers
MOV REZ_3, 72D
ADD REZ_3, -12D

; 4. Add 12 D and 39 D. The numbers will be represented in UBCD. Correct the result of the sum after addition.
MOV AX, 0102H       ; AX = 0102
ADD AX, 0309H       ; AX = 040B
AAA                 ; AX = 0501
MOV REZ_4, AX

; 5. Add 12 D and 39 D. The numbers will be represented in PBCD. Correct the result of the sum after addition.
MOV AL, 12H
ADD AL, 39H
DAA
MOV REZ_5, AL

; 6. Subtract 12 D and 31 D. The numbers will be represented in C2.
XOR AX, AX
XOR BX, BX
MOV AL, 12D
MOV BL, 31D
SUB AL, BL
MOV REZ_6, AL

; 7. Subtract 31 D and 12 D. The numbers will be represented in C2.
XOR AX, AX
MOV AL, 31D
SUB AL, 12D
MOV REZ_7, AL

; 8. Subtract 72 D and -12 D. The numbers will be represented in C2.
MOV REZ_8, 72D
SUB REZ_8, -12D

; 9. Subtract 63 D and 14 D. The numbers will be represented in UBCD. Correct the result of the difference after subtraction.
MOV AX, 0603H
SUB AX, 0104H
AAS
MOV REZ_9, AX

; 10. Subtract 63 D and 14 D. The numbers will be represented in PBCD. Correct the result of the difference after subtraction.
XOR AX, AX
MOV AL, 63H
SUB AL, 14H
DAS
MOV REZ_10, AL

; 11. Extend 12 D to occupy a whole word. The number will be represented in C2.
MOV AL, 12D
CBW
MOV REZ_11, AX

; 12. Extend -12 D to occupy a whole word. The number will be represented in C2.
MOV AL, -12D
CBW
MOV REZ_12, AX

; 13. Extend 69 D to occupy a whole double word. The number will be represented in C2.
MOV AX, 69D
CWD
MOV WORD PTR REZ_13[0], AX  ; last half of the double word
MOV WORD PTR REZ_13[2], DX  ; first half of the double word

; 14. Extend -69 D to occupy a whole double word. The number will be represented in C2.
MOV AX, -69D
CWD
MOV WORD PTR REZ_14[0], AX  ; last half of the double word
MOV WORD PTR REZ_14[2], DX  ; first half of the double word

; 15. Multiply 12 D and 31 D. The numbers will be represented in C2.
XOR AX, AX
XOR BX, BX
MOV AL, 12D
MOV BL, 31D
MUL BL
MOV REZ_15, AX

; 16. Multiply 289 D and 310 D. The numbers will be represented in C2.
XOR AX, AX
XOR BX, BX
MOV AX, 289D
MOV BX, 310D
MUL BX
MOV WORD PTR REZ_16[0], AX
MOV WORD PTR REZ_16[2], DX

; 17. Multiply -12 D and 31 D. The numbers will be represented in C2.
XOR AX, AX
XOR BX, BX
MOV AL, -12D
MOV BL, 31D
IMUL BL
MOV REZ_17, AX

; 18. Multiply -289 D and 310 D. The numbers will be represented in C2.
XOR AX, AX
XOR BX, BX
MOV AX, -289D
MOV BX, 310D
IMUL BX
MOV WORD PTR REZ_18[0], AX
MOV WORD PTR REZ_18[2], DX

; 19. Multiply 3 D and 4 D. The numbers will be represented in UBCD.
MOV AL, 03H         ; AX = __03H
MOV BL, 04H         ; BX = __04H
MUL BL              ; AX = 000CH
AAM                 ; AX = 0102H
MOV REZ_19, AX

; 20. Divide 31 D and 12 D. The numbers will be represented in C2.
XOR AX, AX
MOV AL, 31D
MOV BL, 12D
DIV BL
MOV REZ_20_Q, AL
MOV REZ_20_R, AH

; 21. Divide 310 D and 7 D. The numbers will be represented in C2.
XOR AX, AX
MOV AX, 310D
MOV BL, 7D
DIV BL
MOV REZ_21_Q, AL
MOV REZ_21_R, AH

; 22. Divide -31 D and 31 D. The numbers will be represented in C2.
XOR AX, AX
MOV AL, -31D
MOV BL, 31D
IDIV BL
MOV REZ_22_Q, AL
MOV REZ_22_R, AH

; 23. Divide -370 D and 7 D. The numbers will be represented in C2.
XOR AX, AX
MOV AX, -370D
MOV BL, 7D
IDIV BL
MOV REZ_23_Q, AL
MOV REZ_23_R, AH

; 24. Divide 31 D and 4 D. The numbers will be represented in UBCD.
XOR AX, AX
MOV AX, 0301H
MOV BL, 04H
AAD
DIV BL
MOV REZ_24_Q, AL
MOV REZ_24_R, AH

; 25. Shift to the left one time logically 153 D. The nummber will be represented in C2.
XOR AX, AX
MOV AX, 153D
SHL AX, 1
MOV REZ_25, AX

; 26. Shift to the left one time arithmetically 153 D. The nummber will be represented in C2. 
XOR AX, AX
MOV AX, 153D
SAL AX, 1
MOV REZ_26, AX

; 27. Shift to the left 4 times logically 153 D. The nummber will be represented in C2.
XOR AX, AX
MOV AX, 153D
MOV CL, 4
SHL AX, CL
MOV REZ_27, AX

; 28. Shift to the left 4 times arithmetically 153 D. The nummber will be represented in C2. 
XOR AX, AX
MOV AX, 153D
MOV CL, 4
SAL AX, CL
MOV REZ_28, AX

; 29. Shift to the right one time logically 153 D. The nummber will be represented in C2.
XOR AX, AX
MOV AX, 153D
SHR AX, 1
MOV REZ_29, AX

; 30. Shift to the right one time arithmetically 153 D. The nummber will be represented in C2. 
XOR AX, AX
MOV AX, 153D
SAR AX, 1
MOV REZ_30, AX

; 31. Shift to the right 4 times logically 153 D. The nummber will be represented in C2.
XOR AX, AX
MOV AX, 153D
MOV CL, 4
SHR AX, CL
MOV REZ_31, AX

; 32. Shift to the right 4 times arithmetically 153 D. The nummber will be represented in C2.
XOR AX, AX
MOV AX, 153D
MOV CL, 4
SAR AX, CL
MOV REZ_32, AX

; your code ends here
RET
START ENDP

CODE ENDS
END START