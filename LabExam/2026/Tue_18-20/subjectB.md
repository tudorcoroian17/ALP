# Problem 

You are given a message, `MSG` of at most 63 characters, all lowercase letters of the English alphabet, and an unsigned integer, `KEY`, in the range of 0-9. Write and assembly program that adds the `KEY` to all characters on even positions in the string (encrypts the message), and stores the result in a separate variable, `ENC`, of at most 63 characters.

# Execution example

**Example 1**
```
Encryption: done by the rule ch + KEY
MSG = testz
KEY = 3
----------------------------------------
ENC = wevt{

ENC[0] = MSG[0] + 3 = t + 3 = w -> meaning that 'w' is 3 characters after 't' in ASCII -> performed, because 0 % 2 = 0
ENC[1] = MSG[1] = e -> skiped, because 1 % 2 = 1
ENC[2] = MSG[2] + 3 = s + 3 = v -> meaning that 'v' is 3 characters after 's' in ASCII -> performed, because 2 % 2 = 0
ENC[3] = MSG[3] = t -> skipped, because 3 % 2 = 1
ENC[4] = MSG[4] + 3 = z + 3 = { -> meaning that '{' is 3 characters after 'z' in ASCII -> performed, because 4 % 2 = 0
```

# Keyboard input/Screen output

If you choose to implement your solution using keyboard input and/or screen output, the format should be the following (i.e., after calling `main.exe`) - note that you can choose the level of verbosity:

```
What is the message?
assembly
What is the encryption key?
9
The encrypted message is
jsxepioy
```

# File input/output

If you choose to implement your solution using file input and/or output, the format of the input file (`in.txt`) is the following (message, and encryption key, all on a separate line, in this order):

```
assembly
9
```

The format of the output file (`out.txt`) should be the following:

```
jsxepioy
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
