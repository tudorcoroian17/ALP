DATA SEGMENT PARA PUBLIC 'DATA'
    STRING1     DB  "Once upon a midnight dreary, where I pondered weak and weary,"
    LEN1        DB  $ - STRING1
    REPL        DB  '#'
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
PUSH OFFSET STRING1
PUSH OFFSET LEN1
PUSH OFFSET REPL
CALL REPLACE_VOWELS
; your code ends here
RET
START ENDP

REPLACE_VOWELS PROC FAR
    PUSH BP

    MOV BP, SP
    MOV SI, [BP + 6]            ; Address of character to replace with (REPL)
    MOV DL, [SI]                ; Value of character to replace wiht (REPL)
    MOV SI, [BP + 8]            ; Address of the length of the string (LEN1)
    XOR CX, CX
    MOV CL, [SI]                ; Move length of the string in CX
    MOV SI, [BP + 10]           ; Address of the start of the string (STRING1)

    replace:
        MOV AL, [SI]

        ; Change all uppercase letter to lower case
        ; This way you don't have to write another 5 CMP instructions (one for each upper case vowel)
        ; You can replace these lines with 5 checks (CMP) for each uppercase vowel, but you need to be mindful that conditional jumps are always short
        CMP AL, 'A'
        JB lower_case
        CMP AL, 'Z'
        JA lower_case
        ADD AL, 20H

        lower_case:
            ; Find a vowel to replace
            CMP AL, 'a'
            JE replace_vowel

            CMP AL, 'e'
            JE replace_vowel

            CMP AL, 'i'
            JE replace_vowel

            CMP AL, 'o'
            JE replace_vowel

            CMP AL, 'u'
            JE replace_vowel

            ; No vowel found -> skip replacing
            JMP skip

            replace_vowel:
                MOV [SI], DL
            skip:
                INC SI
    LOOP replace

    POP BP
RET 6
REPLACE_VOWELS ENDP

CODE ENDS
END START