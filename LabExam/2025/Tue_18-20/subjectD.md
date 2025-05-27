# Problem statement

Given a vector `VECT` of at most 15 elements (all byte-sized unsigned integers), write an assembly program that stores in a vector `CNT1`, at position `i`, the number of ones that appear in `VEC[i]`'s binary representation.

# Execution example

**Example 1**
```
VECT = [2, 6, 7, 12, 9]
--------------------- After execution
CNT1 = [1, 2, 3,  3, 2]
```

**Example 2**
```
VECT = [255, 64, 63, 16, 15]
--------------------- After execution
CNT1 = [  8,  1,  6,  1,  4]
```

# Keyboard input/Screen output

If you choose to implement your solution using keyboard input and/or screen output, the format should be the following (i.e., after calling `main.exe`):

```
Type the length of the vector:
5
Type the elements of the vector:
128 127 32 31 5
The resulting vector is:
1 7 1 5 2
```

# File input/output

If you choose to implement your solution using file input and/or output, the format of the input file (`in.txt`) is the following (lenght of the vector, the elements of the vector, all on a separate line):

```
5
128 127 32 31 5
```

The format of the output file (`out.txt`) should be the following:

```
1 7 1 5 2
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
