# Problem statement

Given a vector of **unsigned integers** in the range of `0-255` (`VEC`), with at most 63 elements, and a number `KEY`, also an **unsigned integer** in the range of `0-255`, write an assembly program that multiplies all even numbers by `KEY` and stores the result in a separate vector, `RES` (a vector of unsigned integers, in the range of `0-65025`, i.e., `0x0000 - 0xFFFF`).

# Execution example

**Example 1**
```
VEC = 10, 11, 15, 29, 8, 31, 100
KEY = 6
RES = 60, 66, 90, 174, 186, 600
```

# Keyboard input/Screen output

If you choose to implement your solution using keyboard input and/or screen output, the format should be the following (i.e., after calling `main.exe`) - note that you can choose the level of verbosity:

```
What are the numbers of the vector?
10,11,15,29,8,31,100
What is the key?
6
The resulting vector is:
60,66,90,174,186,600
```

# File input/output

If you choose to implement your solution using file input and/or output, the format of the input file (`in.txt`) is the following (`VEC`, and `KEY`, all on a separate line, in this order):

```
10,11,15,29,8,31,100
6
```

The format of the output file (`out.txt`) should be the following (the `RES` vector):

```
60,66,90,174,186,600
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
