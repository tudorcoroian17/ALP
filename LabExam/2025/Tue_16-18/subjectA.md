# Problem statement

Given a string `STRINGY` of at most 63 characters (all lowercase letter of the English alphabet) and another string `SYMS` containing a exactly 7 symbols, write an assembly program that, starting from both ends of the string, replaces identical letters with the next symbol in the string `SYMS`. When the execution reaches the last symbols of the `SYMS` string, it should continue from the first symbol.

# Execution example

**Example 1**
```
STRINGY = "racecar"
SYMS = "#$%^&*@"
--------------------- After execution
STRINGY = "#$%e%$#"
```

**Example 2**
```
STRINGY = "foolproof"
SYMS = "*&@%$^~"
--------------------- After execution
STRINGY = "*&@lpr@&*"
```

# Keyboard input/Screen output

If you choose to implement your solution using keyboard input and/or screen output, the format should be the following (i.e., after calling `main.exe`):

```
Type the string to modify:
level
Type the list of symbols (exactly 7):
@#$%^&*
The modified string is:
@#v#@
```

# File input/output

If you choose to implement your solution using file input and/or output, the format of the input file (`in.txt`) is the following (lenght of the string, the string, and the symbol list, all on a separate line):

```
5
level
@#$%^&*
```

The format of the output file (`out.txt`) should be the following:

```
@#v#@
```


# Grading

Points | Condition
| - | - |
1 p | Solution assembles and links without any errors.
4 p | Solution contains only one file (`main.asm`) without any macros or procedures.
1 p | Solution implements at least one macro, written in `main.asm`.
2 p | Solution implements at least one macro, written in a macro library, `maclib.asm`.
1 p | Solution implements at least one prodecure, written in `main.asm`.
2 p | Solution implements at least one procedure, written in a procedure library `proclib.asm`.
0.5 p | Solution reads input from the keyboard.
0.5 p | Solution writes output on the screen.
0.5 p | Solution reads input from the input file `in.txt`.
0.5 p | Solution writes output to the output file `out.txt`.
