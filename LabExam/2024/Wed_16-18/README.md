# Problem statement

Given **a string** (*STRINGY*) of at most 63 characters, all of them lower case letters of the English alphabet (*a-z*) or *spaces*, **two lower case letters** (*L1* and *L2*) of the English alphabet, and **three symbols** (*S1*, *S2*, and *S3*), write a program in *assembly* code that will replace the letters in the string with the symbols, as follows:

- all letters that are before *L1* in the English alphabet will be replaced by the symbol *S1*
- all letters between *L1* and *L2* in the English alphabet will be replaced by the symbol *S2*
- all letters that are after *L2* in the English alphabet will be replaced by the symbol *S3*

Spaces will be ignored by this rule, and they will remain spaces after the modification. Additionally, the two letters should also not be modified.

E.g.:

```
STRINGY = "the quick fox jumped over the big brown fence"
L1 = "g"
L2 = "o"
S1 = "#"
S2 = "*"
S3 = "^"

// After modifications
STRINGY = "^*# ^^*#* #o^ *^*^## o^#^ ^*# #*g #^o^* ##*##"

// Disambiguation
"t" is after "o" -> S3 = "^"
"h" is between "g" and "o" -> S2 = "*"
"e" is before "g" -> S1 = "#"
...
```

# Grading

As discussed during the laboratory hours, the laboratory exam is graded based on an incremental scale, as follows:

### Grade 5
For the program to be marked with at most 5, the code should comply to the following characteristics:

- data is declared statically, in the data segment
- no input or output operations
- all code is written in one file `le24wed.asm`
- all code is written in one procedure `START`

### Grade 7
For the program to be marked with at most 7, the code should comply to the following characteristics:

- data is declared statically, in the data segment
- no input or output operations
- all code is written in one file `le24wed.asm`
- the code contains at least one macro (e.g.: for checking if a letter is before L1)
- the code contains at least two procedures, one `NEAR` and one `FAR` (e.g.: one procedure for placing S1 [`PLACE_S1 VECTOR, POSITION`] and another procedure for placing S2 [`PLACE_S2 VECTOR, POSITION`])
- for both procedures, the addresses of the parameters should be sent via the stack

### Grade 8
For the program to be marked with at most 8, the code should comply to the following characteristics:

- data is declared statically, in the data segment
- no input or output operations
- the code is written in three files:
    - `le24wed.asm` which contains calls to the procedures/macros
    - `maclib.asm` which contains the implementation of the macros
    - `proclib.asm` which contains the implementation of the procedures
- the code contains at least one macro (e.g.: for checking if a letter is before L1)
- the code contains at least two procedures, one `NEAR` and one `FAR` (e.g.: one procedure for placing S1 [`PLACE_S1 VECTOR, POSITION`] and another procedure for placing S2 [`PLACE_S2 VECTOR, POSITION`])
- for both procedures, the addresses of the parameters should be sent via the stack

### Grade 10
For the program to be marked with at most 10, the code should comply to the following characteristics:

- data is declared dynamically, by initializing the memory locations with zeros
- the data is read from the keyboard
- the resulting string is written on the screen
- the code is written in three files:
    - `le24wed.asm` which contains calls to the procedures/macros
    - `maclib.asm` which contains the implementation of the macros
    - `proclib.asm` which contains the implementation of the procedures
- the code contains at least one macro (e.g.: placing S1/S2/S3 based on the letter position within the L1-L2 interval)
- the code contains at least two procedures, one `NEAR` and one `FAR` (e.g.: one procedure for reading a string and another procedure for printing a string)
- for both procedures, the addresses of the parameters should be sent via the stack

#### Input/Output scenario
Below is an example of an input and output scenario. Mind the new lines!

```
Enter the string:
the quick fox jumped over the big brown fence

Enter the first letter: g
Enter the second letter: o

Enter the first symbol: #
Enter the second symbol: *
Enter the third symbol: ^

The modified string is:
^*# ^^*#* #o^ *^*^## o^#^ ^*# #*g #^o^* ##*##
```

### Grade 10.5
For the program to be marked with at most 10 (and a 0.5 bonus), the code should comply to the following characteristics:

- data is declared dynamically, by initializing the memory locations with zeros
- the data is read from the input file `in.txt`
- the resulting string is written in the output file `out.txt`
- the code is written in three files:
    - `le24wed.asm` which contains calls to the procedures/macros
    - `maclib.asm` which contains the implementation of the macros
    - `proclib.asm` which contains the implementation of the procedures
- the code contains at least one macro (e.g.: placing S1/S2/S3 based on the letter position within the L1-L2 interval)
- the code contains at least two procedures, one `NEAR` and one `FAR` (e.g.: one procedure for reading a string and another procedure for printing a string)
- for both procedures, the addresses of the parameters should be sent via the stack

#### `in.txt` file structure
The content of the input file is described below:

```
the quick fox jumped over the big brown fence
g o
# * ^
```

#### `out.txt` file structure
The content of the output file is described below:

```
Result string:
^*# ^^*#* #o^ *^*^## o^#^ ^*# #*g #^o^* ##*##
```