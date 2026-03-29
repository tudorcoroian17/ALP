# Laboratory tasks

Write a program in assembly code to perform the following operations. Store the result of each operation in a variable of appropiate size in memory. The name of the variables should follow the pattern `REZ_X`, where `X` will be replaced with the number of the exercise. Additionally, for each instruction perfomed, check the value of the flags.

Start your implementation from the followin code below. Submit a solution at the end of the laboratory with the exercises you managed to implement.

```
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

; your code ends here
RET
START ENDP

CODE ENDS
END START
```

Don't forget to initialize the necessary registers with the appropiate values before performing each operation.

1. Add 12 D and 31 D. The numbers will be represented in C2.
2. Add 123 D and 42 D. The numbers will be represented in C2.
3. Add 72 D and -12 D. The numbers will be represented in C2.
4. Add 12 D and 31 D. The numbers will be represented in UBCD. Correct the result of the sum after addition.
5. Add 12 D and 31 D. The numbers will be represented in PBCD. Correct the result of the sum after addition.
6. Subtract 12 D and 31 D. The numbers will be represented in C2.
7. Subtract 31 D and 12 D. The numbers will be represented in C2.
8. Subtract 72 D and -12 D. The numbers will be represented in C2.
9. Subtract 63 D and 14 D. The numbers will be represented in UBCD. Correct the result of the difference after subtraction.
10. Subtract 63 D and 14 D. The numbers will be represented in PBCD. Correct the result of the difference after subtraction.
11. Extend 12 D to occupy a whole word. The number will be represented in C2.
12. Extend -12 D to occupy a whole word. The number will be represented in C2.
13. Extend 69 D to occupy a whole double word. The number will be represented in C2.
14. Extend -69 D to occupy a whole double word. The number will be represented in C2.
15. Multiply 12 D and 31 D. The numbers will be represented in C2.
16. Multiply 289 D and 310 D. The numbers will be represented in C2.
17. Multiply -12 D and 31 D. The numbers will be represented in C2.
18. Multiply -289 D and 310 D. The numbers will be represented in C2.
19. Multiply 12 D and 31 D. The numbers will be represented in UBCD.
20. Divide 31 D and 12 D. The numbers will be represented in C2.
21. Divide 310 D and 7 D. The numbers will be represented in C2.
22. Divide -31 D and 31 D. The numbers will be represented in C2.
23. Divide -370 D and 7 D. The numbers will be represented in C2.
24. Divide 31 D and 4 D. The numbers will be represented in UBCD.
25. Shift to the left one time logically 153 D. The nummber will be represented in C2.
26. Shift to the left one time arithmetically 153 D. The nummber will be represented in C2. 
27. Shift to the left 4 times logically 153 D. The nummber will be represented in C2.
28. Shift to the left 4 times arithmetically 153 D. The nummber will be represented in C2. 
29. Shift to the right one time logically 153 D. The nummber will be represented in C2.
30. Shift to the right one time arithmetically 153 D. The nummber will be represented in C2. 
31. Shift to the right 4 times logically 153 D. The nummber will be represented in C2.
32. Shift to the right 4 times arithmetically 153 D. The nummber will be represented in C2.

