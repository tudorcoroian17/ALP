# Problem statement

Given **a string** (*STRINGY*) of at most 63 characters, all of them lower case letters of the English alphabet (*a-z*) or *spaces*, **a byte-sized unsigned integer**, which represents a position in the string (*4 < position < length(string) / 3*), and **a symbol**, write a program in *assembly* code that modifies the string as follows:

- each i-th character of the string will be replaced with the symbol, namely, when *i % pos = 0*
- each lower case letter around the i-th character will be replaced with the upper case letter, namely, when *i % pos = pos - 1* and *i % pos = 1*

Spaces will be ignored by this rule, and they will remain spaces after the modification.

E.g.:

```
STRINGY = "the quick fox jumped over the big brown fence"
POS = 5
SYMBOL = "^"

// After modifications
STRINGY = "^He Q^Ick ^Ox J^MpeD OveR The ^Ig B^Own ^Ence"

// Disambiguation
STRINGY[0] = "^"    because 0 % 5 = 0
STRINGY[1] = "H"    because 1 % 5 = 1
STRINGY[2] = "e"    
STRINGY[3] = " "    
STRINGY[4] = "Q"    because 4 % 5 = 4
STRINGY[5] = "^"    because 5 % 5 = 0
STRINGY[6] = "I"    because 6 % 5 = 0
STRINGY[7] = "c"
STRINGY[8] = "k"
STRINGY[9] = " "    here, 9 % 5 = 4, but the character is a space -> don't modify it
STRINGY[10] = "^"   because 10 % 5 = 0
STRINGY[11] = "O"   because 11 % 5 = 1
STRINGY[12] = "x"
...
STRINGY[18] = "e"
STRINGY[19] = "D"   because 19 % 5 = 4
STRINGY[20] = " "   here, 20 % 5 = 0, but the character is a space -> don't modify it
STRINGY[21] = "O"   because 21 % 5 = 1
STRINGY[22] = "v"
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
- the code contains at least one macro (e.g.: for checking if an index is divisible by the position)
- the code contains at least two procedures, one `NEAR` and one `FAR` (e.g.: one procedure for converting a letter to upper case [`UPPC ADR_LETTER`] and another procedure for placing the symbol [`PLACE_SYM VECTOR, POSITION`])
- for both procedures, the addresses of the parameters should be sent via the stack

### Grade 8
For the program to be marked with at most 8, the code should comply to the following characteristics:

- data is declared statically, in the data segment
- no input or output operations
- the code is written in three files:
    - `le24wed.asm` which contains calls to the procedures/macros
    - `maclib.asm` which contains the implementation of the macros
    - `proclib.asm` which contains the implementation of the procedures
- the code contains at least one macro (e.g.: for checking if an index is divisible by the position)
- the code contains at least two procedures, one `NEAR` and one `FAR` (e.g.: one procedure for converting a letter to upper case [`UPPC ADR_LETTER`] and another procedure for placing the symbol [`PLACE_SYM VECTOR, POSITION`])
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
- the code contains at least one macro (e.g.: for checking if an index is divisible by the position)
- the code contains at least two procedures, one `NEAR` and one `FAR` (e.g.: one procedure for reading a string and another procedure for printing a string)
- for both procedures, the addresses of the parameters should be sent via the stack

#### Input/Output scenario
Below is an example of an input and output scenario. Mind the new lines!

```
Enter the string:
the quick fox jumped over the big brown fence

Enter the position: 5 
Enter the symbol: ^

The modified string is:
^He Q^Ick ^Ox J^MpeD OveR The ^Ig B^Own ^Ence
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
- the code contains at least one macro (e.g.: for checking if an index is divisible by the position)
- the code contains at least two procedures, one `NEAR` and one `FAR` (e.g.: one procedure for reading a string and another procedure for printing a string)
- for both procedures, the addresses of the parameters should be sent via the stack

#### `in.txt` file structure
The content of the input file is described below:

```
the quick fox jumped over the big brown fence
5
^
```

#### `out.txt` file structure
The content of the output file is described below:

```
Result string:
^He Q^Ick ^Ox J^MpeD OveR The ^Ig B^Own ^Ence
```