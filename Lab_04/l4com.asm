CODE SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODE, DS:CODE
    ORG 100H
    
START: JMP ENTRY
    VEC     DB      1, 2, 3, 4
    LEN     DB      $-VEC
    SUM     DB      0 

ENTRY:
    ; initialize CX as counter register
    MOV CH, 0
    MOV CL, LEN
    ; initialie AL (lower part of AX) as sum
    MOV AL, 0
    ; initialize SI for indexing through the vector
    MOV SI, 0
ITER:
    ; add to sum (AL) the element of VEC at position SI
    ADD AL, VEC[SI]
    ; increment SI
    INC SI
    ; decrement counter (CX) register
    ; check if value of the counter register is greater than 0
    ; if yes, jump back to the ITER label
    ; if not, move past the LOOP instruction
    LOOP ITER

    ; move the sum from the register to the variable
    MOV SUM, AL

    ; end program
    MOV AX, 4C00H
    INT 21H

CODE ENDS

END START