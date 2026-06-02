# Problem statement

Given a vector of unsigned integers, `VEC`, of at most 31 elements and a `KEY`, an unsigned integer in the range `0-9`, write an assembly program that shifts the numbers on even positions arithmetically to the right, by `KEY` times, and stores the result in a `RES` vector, also of unsigned integers of at most 31 elements.

Note: You do not need to keep track of the overflow.

# Execution example

**Example 1**
```
VEC = 20, 10, 60, 20, 80, 7, 32, 21
KEY = 2
RES = 5, 10, 15, 20, 7, 8, 21
----------------------------------------
VEC[0] = 20 -> RES[0] = 5   -> 20 shifted right arithmetically 2 times is 5
VEC[1] = 10 -> RES[1] = 10  -> don't shift, because 1 % 2 = 1
VEC[2] = 60 -> RES[2] = 15  -> 60 shifted right arithmetically 2 times is 15
VEC[3] = 20 -> RES[3] = 20  -> don't shift because 3 % 2 = 1
VEC[4] = 80 -> RES[4] = 20  -> 80 shifted right arithmetically 2 times is 20
VEC[5] = 7  -> RES[5] = 7   -> don't shift because 5 % 2 = 1
VEC[6] = 32 -> RES[6] = 8   -> 32 shifted right arithmetically 2 times is 4
VEC[7] = 21 -> RES[7] = 21  -> don't shift because 7 % 2 = 1
```

# Keyboard input/Screen output

If you choose to implement your solution using keyboard input and/or screen output, the format should be the following (i.e., after calling `main.exe`) - note that you can choose the level of verbosity:

```
What is the vector?
20,10,60,20,80,7,32,21
What is the key?
2
The resulting vector is:
5,10,15,20,7,8,21
```

# File input/output

If you choose to implement your solution using file input and/or output, the format of the input file (`in.txt`) is the following (vector VEC and the KEY, all on a separate line, in this order):

```
20,10,60,20,80,7,32,21
2
```

The format of the output file (`out.txt`) should be the following:

```
5,10,15,20,7,8,21
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
