# Problem statement

Given two strings, `STRING1` and `STRING2`, of at most 63 characters (all lowercase letters of the English alphabet), write an assembly program that stores in `COMMONS` the first common substring (starting with position 0). Both strings have the same length.

A common substring for two strings is composed of a continuous chain of identical letters on the same positions in the strings.

# Execution example

**Example 1**
```
STRING1 = "intrinsec"
STRING2 = "extrinsec"
--------------------- After execution
COMMONS = "trinsec"
```

**Example 2**
```
STRING1 = "ooominecraftooomineooo"
STRING2 = "uuuminecraftuuumineuuu"
--------------------- After execution
COMMONS = "minecraft"
```

**Example 3**
```
STRING1 = "blablacar"
STRING2 = "albalbcar"
--------------------- After execution
COMMONS = "l"
```

# Keyboard input/Screen output

If you choose to implement your solution using keyboard input and/or screen output, the format should be the following (i.e., after calling `main.exe`):

```
Type the first string:
tungtungsahur
Type the second string:
hahahahasahur
The first common substring is:
sahur
```

# File input/output

If you choose to implement your solution using file input and/or output, the format of the input file (`in.txt`) is the following (lenght of the strings, the first string, and the second, all on a separate line):

```
13
tungtungsahur
hahahahasahur
```

The format of the output file (`out.txt`) should be the following:

```
sahur
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
