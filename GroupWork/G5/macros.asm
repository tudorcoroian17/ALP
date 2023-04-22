COMPUTE_OP  MACRO a, op, b, res
; Compute the operation a <op> b and store the result in res
; a, b, res --defined-- DB ?
; op --only-- '+' or '-'
    LOCAL lbl1
    PUSH AX

    CMP op, '+'
    JE lbl1
    ; Compute the subtraction
    MOV AL, a
    SUB AL, b
    MOV res, AL
    
lbl1:
    ; Compute the addition
    MOV AL, a
    ADD AL, b
    MOV res, AL

    POP AX
ENDM