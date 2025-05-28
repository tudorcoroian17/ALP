# Problem statement

Given two strings, `STRING1` and `STRING2`, of at most 63 characters (all lowercase letters of the English alphabet), and a symbol `REPL`, write an assembly program that constructs a new string `IDEN`, where on position `i` is the `STRING1[i]` if both string have the same letter on that position, or `REPL` otherwise. Both strings have the same length.

# Execution example

**Example 1**
```
STRING1 = "intrinsec"
STRING2 = "extrinsec"
REPL    = "*"
--------------------- After execution
IDEN    = "**trinsec"
```

**Example 2**
```
STRING1 = "tungtungsahur"
STRING2 = "tatatatasahur"
REPL    = "#"
--------------------- After execution
IDEN    = "t###t###sahur
```

# Keyboard input/Screen output

If you choose to implement your solution using keyboard input and/or screen output, the format should be the following (i.e., after calling `main.exe`):

```
Type the first string:
blablacar
Type the second string:
albalbcar
The symbol is:
^
The result is:
^l^^l^car
```

# File input/output

If you choose to implement your solution using file input and/or output, the format of the input file (`in.txt`) is the following (lenght of the strings, the first string, the second string, and the symbol, all on a separate line):

```
9
blablacar
albalbcar
^
```

The format of the output file (`out.txt`) should be the following:

```
^l^^l^car
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
