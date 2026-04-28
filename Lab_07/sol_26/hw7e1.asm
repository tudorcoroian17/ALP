DATA SEGMENT PARA PUBLIC 'DATA'
    VEC     DB  8, 12, 9, 0, 11, 7, 29, 34, 2
    ; VEC[0] -> holds the length of the vector
    ; VEC[1] - VEC[8] -> the elements of the vector
DATA ENDS

SWAPM MACRO p1, p2
    ; Macro to swap two values passed through p1 and p2
    PUSH DX         ; Good practice to save the registers used in a macro on the stack
                    ; to not lose their values

    MOV DL, p1
    MOV DH, p2
    MOV p1, DH
    MOV p2, DL

    POP DX
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
PUSH OFFSET VEC
CALL SORT_DESC
ADD SP, 2
; your code ends here
RET
START ENDP

SORT_DESC PROC FAR
    PUSH BP         ; Save BP on the stack

    MOV BP, SP                          ; Obtain SP to index into the stack memory
    MOV SI, [BP + 6]                    ; Move in SI the start of the vector (VEC[0])
                                        ; BP+6 because we have BP, IP, and CS on the stack (in this order) before OFFSET VEC
    XOR CX, CX                          ; Clear CX
    MOV CL, [SI]                        ; Move in CL the length of the vector (VEC[0]) to use the LOOP instruction
    MOV BX, CX                          ; Save the length on the vector in a separate register
    INC SI                              ; Increment SI to get to the next element in the vector (VEC[1])
    MOV DI, SI                          ; Save the address of the first element of the vector in DI (VEC[1])

    ; Basic bubble sort

    outer_loop:                         ; for (i = 1; i <= length; i++;)
        PUSH CX                         ; Save the iteration value to the stack because CX will be destroyed by the inner loop
        MOV CX, BX                      ; Run the inner loop length times (BX contains the length)
        MOV SI, DI                      ; Restart the inner loop counter from VEC[1]
        inner_loop:                     ; for (j = 1; j <= length; j++;)
            ; Obtain the next two elements in the vector to compare
            MOV AL, [SI]
            MOV AH, [SI + 1]

            CMP AL, AH                  ; Compare two consecutive elements of the vector
            JA no_swap                  ; If AL > AH (first element is greater than the second) skip swap
            SWAPM <[SI]>, <[SI + 1]>    ; Use a macro to swap values
                                        ; When sending parameters between square brackets to a macro, you need to wrap them between <>

            no_swap:
            INC SI                      ; Get to the next element in the vector
        LOOP inner_loop
        POP CX                          ; Restore last iteration number from the stack
    LOOP outer_loop

    POP BP                              ; Restore BP from the stack
RET
SORT_DESC ENDP

CODE ENDS
END START