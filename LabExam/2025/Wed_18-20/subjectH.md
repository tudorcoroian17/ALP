# Problem statement

Given a vector `VECTOR` of at most 15 elements (all byte-sized unsigned integers), write an assembly program that stores in a vector `PW2REM`, at position `i`, how much is missing from `VECTOR[i]` until the next power of 2.

# Execution example

**Example 1**
```
VECTOR = [10, 25, 45, 127, 1]
--------------------- After execution
PW2REM = [ 6,  7, 19,   1, 1]

--------------------- Details
PW2REM[0] = 6 because 16-10=6 (next power of 2 greater than VECTOR[0] = 10)
```

**Example 2**
```
VECTOR = [255, 63, 31, 32, 64, 128]
--------------------- After execution
PW2REM = [  1,  1,  1,  0,  0,   0]
```

# Keyboard input/Screen output

If you choose to implement your solution using keyboard input and/or screen output, the format should be the following (i.e., after calling `main.exe`):

```
Type the length of the vector:
6
Type the elements of the vector:
255 63 31 32 64 128
The resulting vector is:
1 1 1 0 0 0
```

# File input/output

If you choose to implement your solution using file input and/or output, the format of the input file (`in.txt`) is the following (lenght of the vector, the elements of the vector, all on a separate line):

```
6
255 63 31 32 64 128
```

The format of the output file (`out.txt`) should be the following:

```
1 1 1 0 0 0
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
