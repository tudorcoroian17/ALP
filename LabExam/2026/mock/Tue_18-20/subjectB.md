# Problem statement

Given a vector of **unsigned integers** in the range of `0-65025`, i.e., `0x0000 - 0xFFFF`, (`VEC`), with at most 63 elements, and a number `KEY`, also an **unsigned integer** in the range of `0-255`, write an assembly program that divides all odd numbers by `KEY` and stores the result (the remainder of the division) in a separate vector, `RES` (a vector of unsigned integers, in the range of `0-255`).

# Execution example

**Example 1**
```
VEC = 60, 67, 92, 174, 186, 605
KEY = 6
RES = 0, 1, 2, 0, 0, 5
```

# Keyboard input/Screen output

If you choose to implement your solution using keyboard input and/or screen output, the format should be the following (i.e., after calling `main.exe`) - note that you can choose the level of verbosity:

```
What are the numbers of the vector?
60,67,92,174,186,605
What is the key?
6
The resulting vector is:
0,1,2,0,0,5
```

# File input/output

If you choose to implement your solution using file input and/or output, the format of the input file (`in.txt`) is the following (`VEC`, and `KEY`, all on a separate line, in this order):

```
60,67,92,174,186,605
6
```

The format of the output file (`out.txt`) should be the following (the `RES` vector):

```
0,1,2,0,0,5
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
