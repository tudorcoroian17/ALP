DATA SEGMENT PARA PUBLIC 'DATA'
    BASE                DB  10D

    IN_FILENAME         DB  'in.txt', 0
    OUT_FILENAME        DB  'out.txt', 0
    TXT_LEN             DW  ?
    LETTER              DB  ?
    SYMBOL              DB  ?
    READ_CHAR           DB  ?
    TEXT_BUFFER         DB  255 DUP (?)
    FILEHANDLE          DW  ?
    ADR_IN_FN           DW  IN_FILENAME
    ADR_OUT_FN          DW  OUT_FILENAME
    ADR_TXT_LEN         DW  TXT_LEN
    ADR_LETTER          DW  LETTER
    ADR_SYMBOL          DW  SYMBOL
    ADR_READ_CHAR       DW  READ_CHAR
    ADR_TEXT_BUFFER     DW  TEXT_BUFFER
    ADR_FILEHANDLE      DW  FILEHANDLE

    ATTR_NORMAL         DW  0000H
    READ_ONLY           DB  00H
    WRITE_ONLY          DB  01H
DATA ENDS

; Macro declaration zone
READ_CHAR_FROM_FILE MACRO ADR_FH, ADR_RC
    LOCAL read_ok
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI

    ; Read one byte (char) from the file with the filehandle
    ; at the address ARD_FN and store it at the address ARD_RC 
    XOR AX, AX
    MOV AH, 3FH
    MOV SI, ADR_FH
    MOV BX, [SI]
    MOV DX, ADR_RC
    MOV CX, 1
    INT 21H
    
    ; In case of error, put 0FFH at the address ADR_RC
    JNC read_ok
    MOV ADR_RC, 0FFH

read_ok:
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
ENDM
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

    ; Open input file
    MOV AH, 3DH
    MOV AL, 0
    OR AL, READ_ONLY
    MOV DX, ADR_IN_FN
    INT 21H

    JNC step2
    JMP stop

    ; Read length of the text
step2:
    MOV FILEHANDLE, AX
    PUSH ADR_FILEHANDLE
    PUSH ADR_TXT_LEN
    PUSH ADR_READ_CHAR
    CALL READ_TEXT_LEN

    CMP TXT_LEN, 0
    JNE step3
    JMP stop

    ; Read letter to replace
step3:
    PUSH ADR_FILEHANDLE
    PUSH ADR_LETTER
    PUSH ADR_READ_CHAR
    CALL READ_CHAR_TO_REPLACE

    CMP LETTER, 0
    JNE step4
    JMP stop

step4:
    PUSH ADR_FILEHANDLE
    PUSH ADR_SYMBOL
    PUSH ADR_READ_CHAR
    CALL READ_SYMBOL

    CMP SYMBOL, 0
    JNE step5
    JMP stop

step5:
    PUSH ADR_FILEHANDLE
    PUSH ADR_TEXT_BUFFER
    PUSH ADR_TXT_LEN
    CALL READ_TEXT

    JC stop

    PUSH ADR_TEXT_BUFFER
    PUSH ADR_LETTER
    PUSH ADR_SYMBOL
    PUSH ADR_TXT_LEN
    CALL REPLACE_LETTER

    ; Create output file
    MOV AH, 3CH
    XOR CX, CX
    OR CX, ATTR_NORMAL
    MOV DX, ADR_OUT_FN
    INT 21H

    JC stop

    ; Write result to file
    MOV BX, AX      ; Get filehandle from AX
    MOV AH, 40H
    MOV CX, TXT_LEN
    MOV DX, ADR_TEXT_BUFFER
    INT 21H

    stop:

; your code ends here
RET
START ENDP

; Near procedures declaration zone

; End of near procedures declaration zone

CODE ENDS

CODE1 SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:CODE1

READ_TEXT_LEN PROC FAR
    MOV BP, SP

read_another_char:
    MOV SI, [BP + 8]    ; Filehandle address
    MOV DI, [BP + 4]    ; Read char address
    READ_CHAR_FROM_FILE SI, DI

    CMP BYTE PTR [DI], 0FFH
    JNE read_byte_of_len_ok
    JMP stop_read_len

read_byte_of_len_ok:
    MOV DI, [BP + 4]        ; Read char address
    MOV BL, BYTE PTR [DI]

    ; Started reading the \n
    CMP BL, 0DH
    JE read_another_char

    ; Finished reading the \n and the number
    CMP BL, 0AH
    JE read_len_good

    ; Character has to be a digit
    CMP BL, '0'
    JB stop_read_len
    CMP BL, '9'
    JA stop_read_len

    ; Construct number
    SUB BL, '0'
    MOV DI, [BP + 6]    ; Text length address
    MOV AX, [DI]
    MUL BASE
    ADD AL, BL
    MOV [DI], AX        ; Put the length read so far back in memory

    JMP read_another_char

stop_read_len:
    ; In case of error, set the len to 0
    MOV DI, [BP + 6]    ; Text length address
    MOV BYTE PTR [DI], 0

read_len_good:

RET 6
READ_TEXT_LEN ENDP

READ_CHAR_TO_REPLACE PROC FAR
    MOV BP, SP

    MOV SI, [BP + 8]    ; Filehandle address
    MOV DI, [BP + 4]    ; Read char address
    READ_CHAR_FROM_FILE SI, DI

    CMP BYTE PTR [DI], 0FFH
    JNE read_letter_ok
    JMP read_letter_error

read_letter_ok:
    ; Place letter in variable
    MOV SI, [BP + 6]    ; Address of letter
    MOV DL, BYTE PTR [DI]
    MOV BYTE PTR [SI], DL

    ; Read the empty space
    MOV SI, [BP + 8]    ; Filehandle address
    MOV DI, [BP + 4]    ; Read char address
    READ_CHAR_FROM_FILE SI, DI

    CMP BYTE PTR [DI], 0FFH
    JNE read_letter_good
    JMP read_letter_error


read_letter_error:
    MOV DI, [BP + 6]
    MOV BYTE PTR [DI], 0

read_letter_good:

RET 6
READ_CHAR_TO_REPLACE ENDP

READ_SYMBOL PROC FAR
    MOV BP, SP

    MOV SI, [BP + 8]    ; Filehandle address
    MOV DI, [BP + 4]    ; Read char address
    READ_CHAR_FROM_FILE SI, DI

    CMP BYTE PTR [DI], 0FFH
    JNE read_symbol_ok
    JMP read_symbol_error

read_symbol_ok:
    ; Place symbol in variable
    MOV SI, [BP + 6]    ; Address of symbol
    MOV DL, BYTE PTR [DI]
    MOV BYTE PTR [SI], DL

    ; Read the first byte of '\n'
    MOV SI, [BP + 8]    ; Filehandle address
    MOV DI, [BP + 4]    ; Read char address
    READ_CHAR_FROM_FILE SI, DI
        
    CMP BYTE PTR [DI], 0FFH
    JNE read_symbol_next
    JMP read_symbol_error

read_symbol_next:
    ; Read the second byte of '\n'
    MOV SI, [BP + 8]    ; Filehandle address
    MOV DI, [BP + 4]    ; Read char address
    READ_CHAR_FROM_FILE SI, DI

    CMP BYTE PTR [DI], 0FFH
    JNE read_symbol_good
    JMP read_symbol_error

read_symbol_error:
    MOV DI, [BP + 6]
    MOV BYTE PTR [DI], 0

read_symbol_good:

RET 6
READ_SYMBOL ENDP

READ_TEXT PROC FAR
    MOV BP, SP

    MOV SI, [BP + 8]    ; Filehandle address
    MOV BX, [SI]

    MOV DX, [BP + 6]    ; Text buffer address

    MOV SI, [BP + 4]    ; Length address
    MOV CX, [SI]

    MOV AH, 3FH
    INT 21H

RET 6
READ_TEXT ENDP

REPLACE_LETTER PROC FAR
    MOV BP, SP

    XOR CX, CX
    MOV SI, [BP + 4]    ; Legnth address
    MOV CX, [SI]

    MOV SI, [BP + 8]    ; Letter address
    MOV AL, BYTE PTR [SI]
    MOV SI, [BP + 6]    ; Symbol address
    MOV AH, BYTE PTR [SI]

    MOV SI, [BP + 10]   ; Text buffer address

    repl_loop:
        CMP BYTE PTR [SI], AL
        JNE skip_not_a
        MOV BYTE PTR [SI], AH
        
        skip_not_a:
            INC SI
            LOOP repl_loop

RET 6
REPLACE_LETTER ENDP

CODE1 ENDS
END START