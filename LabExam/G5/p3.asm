DATA SEGMENT PARA PUBLIC 'DATA'
CHEESE  DB  "The cheese tax! The cheese tax!$"
VERSE1  DB  "You've got to pay the cheese tax", 0AH, 0DH, "Every time you're cooking", 0AH, 0DH, "When the cheese comes out", 0AH, 0DH, "This puppy comes looking$"
VERSE2  DB  "The rules are the rules", 0AH, 0DH, "And the facts are the facts", 0AH, 0DH, "And when the cheese drawer opens", 0AH, 0DH, "You've got to pay the tax$"
VERSE3  DB  "Hand it over quick", 0AH, 0DH, "Or things might get ugly", 0AH, 0DH, "I can get really loud", 0AH, 0DH, "I'm a really barky puppy$"
VERSE4  DB  "I'm not just asking", 0AH, 0DH, "Because I'm looking for snacks", 0AH, 0DH, "This is real important business", 0AH, 0DH, "And you've got to pay the tax$"
VERSE5  DB  "Cheddar is acceptable, and Parmesan is fine", 0AH, 0DH, "But a little bit of Gouda would really blow my mind", 0AH, 0DH, "There's no escaping, so don't try to dodge", 0AH, 0DH, "Pay the dairy tarriff! The collection of fromage!$"
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

RET
START ENDP
CODE ENDS

_CODE SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:_CODE

_CODE ENDS
END START