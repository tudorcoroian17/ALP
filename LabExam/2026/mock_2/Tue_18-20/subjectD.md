# Problem statement

Given a string, `MSG`, of at most 63 characters, all lower case letters of the English alphabet, an unsigned integer `KEY`, in the range of 0-9, and a letter `FND` (a single character), write an assembly program that adds `KEY` to all occurences of the letter `FND` in the string `MSG`, and stores the result in the `RES` string, also of at most 63 characters.

# Execution example

**Example 1**
```
MSG = assembly
KEY = 4
FND = s
RES = awwembly
----------------------------------------
Add 4 to the ASCII code of 's', resulting in the character 'w'
```

# Keyboard input/Screen output

If you choose to implement your solution using keyboard input and/or screen output, the format should be the following (i.e., after calling `main.exe`) - note that you can choose the level of verbosity:

```
What is the string?
abecede
What is the key?
5
What is the character to be encoded?
e
The encoded string is:
abjcjdj
```

# File input/output

If you choose to implement your solution using file input and/or output, the format of the input file (`in.txt`) is the following (`MSG`, `KEY`, and `FND`, all on a separate line, in this order):

```
abecede
5
e
```

The format of the output file (`out.txt`) should be the following (the `RES` string):

```
abjcjdj
```


# Grading

Points | Condition
| - | - |
1 p | Solution assembles and links without any errors.
4 p | Solution contains only one file (`main.asm`) without any macros or procedures and performs the requiered task.
1 p | Solution implements at least one macro, written in `main.asm`.
2 p | Solution implements at least one macro, written in a macro library, `maclib.asm`.
1 p | Solution implements at least one prodecure, written in `main.asm`.
2 p | Solution implements at least one procedure, written in a procedure library `proclib.asm`.
0.5 p | Solution reads input from the keyboard.
0.5 p | Solution writes output on the screen.
0.5 p | Solution reads input from the input file `in.txt`.
0.5 p | Solution writes output to the output file `out.txt`.
