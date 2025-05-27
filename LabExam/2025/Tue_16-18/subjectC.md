# Problem statement

Given two vectors, `VEC1` and `VEC2`, of at most 15 elements (all single digit numbers in base 10), each representing a decimal number (when read from left to right). Write an assembly program that computes the sum of elements on each position and stores the results in another vector `VSUM`. Both vectors have the same length.

Note that in case a sum (on position `i`) gives a result greater than 10, you have to carry over 1 to the previous (`i-1`) element in the vector.

# Execution example

**Example 1**
```
VEC1 = [1, 0, 9, 2, 8, 7]
VEC2 = [2, 1, 2, 4, 0, 1]
--------------------- After execution
VSUM = [3, 2, 1, 6, 8, 8]
```

**Example 2**
```
VEC1 =    [9, 8, 7, 6]
VEC2 =    [2, 5, 3, 4]
--------------------- After execution
VSUM = [1, 2, 4, 1, 0]
```
Note that in this example, the resulting vector (`VSUM`) has one more element than the input vectors (`VEC1` and `VEC2`).

# Keyboard input/Screen output

If you choose to implement your solution using keyboard input and/or screen output, the format should be the following (i.e., after calling `main.exe`):

```
Type the length of the vectors:
5
Type the elements of the first vector:
1 2 3 4 5
Type the elements of the second vector:
1 2 3 1 1
The resulting sum vector is:
2 4 6 5 6
```

# File input/output

If you choose to implement your solution using file input and/or output, the format of the input file (`in.txt`) is the following (lenght of the vectors, the first vector, and the second, all on a separate line):

```
5
1 2 3 4 5
1 2 3 1 1
```

The format of the output file (`out.txt`) should be the following:

```
2 4 6 5 6
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
