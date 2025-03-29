DATA SEGMENT PARA PUBLIC 'DATA'
   ; changed DB to DW
   VEC     DW      1, 2, 3, 4

   ; LEN remains DB -> length doesn't increase with the size of the element
   ; since VEC has WORD sized elements, $ will return 8 (the number of bytes) instead of 4
   ; -> divide the number of bytes of VEC by its type (TYPE VEC will return 2)
   LEN     DB      ($-VEC)/(TYPE VEC)
   ; other valid, but not so elegant options for LEN are:
   ;     1. LEN DB ($-VEC)/2
   ;     2. LEN DB $-VEC -> don't change anything, but you need to decrement CX twice
   ;                        (once implicitly, with the LOOP instruction, and once explicitly
   ;                        with DEC CX) to account for this

   ; changed DB to DW        
   SUM     DW      0 
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
   ; LEN is still a byte so clean the CX register and move LEN
   XOR CX, CX
   MOV CL, LEN

   ; use AX to hold the partial sum, since the elements of the vector are now WORD sized
   MOV AX, 0

   ; initialize SI to be used as indexing register
   MOV SI, 0

ITER:
   ; add current element to AX, since the elements are now WORD sized
   ADD AX, VEC[SI]

   ; you need to get SI to index the next element in VEC, in this case, the next element is 2 bytes over
   ; as such, you should either:
   ;     1. add 2 to SI -> ADD SI, 2
   ;     2. increment SI twice -> INC SI
   ;                              INC SI
   ;     3. the most elegant option below, add the type of VEC (which is going to be 2)
   ADD SI, TYPE VEC

   ; in case you chose to leave LEN = $-VEC, this is where you should explicitly decrement CX
   ; DEC CX

   ; the LOOP instruction automatically decrements CX once and checks if it's 0
   ; if not, loop back to ITER
   ; if yes, exit the loop and continue the execution
   LOOP ITER

   ; move the resulting sum (which is currently in AX) to the SUM variable, defined as a WORD
   MOV SUM, AX
   
; your code ends here
RET
START ENDP

CODE ENDS
END START