# Problem statement

Given a string `SRC` of at most 63 characters, all lower case letters of the English alphabet, and an unsigned integer `ITR`, in the range 0-9, write an assembly program that rotates the `SRC` string to the right, by `ITR` amount of times and stores the result in the `RES` variable (also a string of at most 63 characters).

# Execution example

**Example 1**
```
SRC = abcdefg
ITR = 3
RES = defgabc
----------------------------------------
we perform 3 rotations to get from SRC to RES

Rotation 1: SRC = bcdefga
Rotation 2: SRC = cdefgab
Rotation 3: SRC = defgabc
```

**Example 2**
```
SRC = repost
IRT = 2
RES = postre
----------------------------------------
we perfom 2 rotations to get from SRC to RES

Rotation 1: SRC = epostr
Rotation 2: SRC = postre
```

# Keyboard input/Screen output

If you choose to implement your solution using keyboard input and/or screen output, the format should be the following (i.e., after calling `main.exe`) - note that you can choose the level of verbosity:

```
What is the SRC string?
repost
What is the number of rotations?
2
The resulting string is:
postre
```

# File input/output

If you choose to implement your solution using file input and/or output, the format of the input file (`in.txt`) is the following (SRC string, and the number of iterations, all on a separate line, in this order):

```
repost
2
```

The format of the output file (`out.txt`) should be the following:

```
postre
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
