DATA SEGMENT PARA PUBLIC 'DATA'

DATA ENDS

; Macro declaration zone

; End of macro declaration zone

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

PUSH 09ACH
PUSH 3FFFH
PUSH 1A2BH

MOV DX, BP          ; Save BP to be able to restore it after the logic is finished

MOV BP, SP          ; Move SP into BP to be able to index into the stack
SUB SP, 6           ; Subtract 6 from SP (simulate three natural PUSH onto the stack)

; From now on, we "pretend" that the top of the stack is in the right position as if we already duplicated the entries

MOV AX, [BP]        ; Move into AX the last item added onto the stack (in this case 1A2BH) relative to the old top of the stack
MOV [BP - 6], AX    ; Move the value of AX into the first position relative to the old top of the stack
MOV [BP - 4], AX    ; Move the value of AX into the second position relative to the old top of the stack

MOV AX, [BP + 2]    ; Move into AX the second to last item added onto the stack (in this case 3FFFH) relative to the old top of the stack
MOV [BP - 2], AX    ; Move the value of AX into the third position relative to the old top of the stack
MOV [BP], AX        ; Move the value of AX into the fourth position relative to the old top of the stack

MOV AX, [BP + 4]    ; Move into AX the first item added onto the stack (in this case 09ACH) relative to the old top of the stack
MOV [BP + 2], AX    ; Move the value of AX into the fifth position relative to the old top of the stack
                    ; No need to duplicate again, the first value added on the stack is also the first value onto the new stack

MOV BP, DX          ; Restore BP

; your code ends here
RET
START ENDP

; Near procedures declaration zone

; End of near procedures declaration zone

CODE ENDS
END START