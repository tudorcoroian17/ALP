# Problem statement

Given two vectors, `COUNT` and `ITEMS` of exactly 9 elements (representing Steve's hotbar), where:

- `ITEMS` contains single digit numbers (0-5) that correspond to Minecraft items
- `COUNT` contains byte sized unsigned integers, representing the number of each item in the inventory slot (e.g. Steve has `COUNT[i]` `ITEMS[i]` in slot `i`)

Depending on the item, there is a maximum ammount of that item that you can hold in a single inventory slot. The table below describes the item corresponding to each number (0-5) and the ammount that can be held in one inventory slot (or stack up to).

Item | Number | Max Count
| - | - | - |
Diamond Pickaxe | 0 | 1
Egg | 1 | 16
Ender Pearl | 2 | 16
Oak Fence | 3 | 64
Clay | 4 | 64
Netherite Sword | 5 | 1

Write an assembly program that constructs a `VFULL` vector (of the same size as `ITEMS` and `COUNT`), where each element in the vector is the remaining number of items that can be placed in that slot (up to the max count, based on item type) or max count for that item, in case the `COUNT` vector contains more that the allowed limit.


# Execution example

**Example 1**
```
ITEMS = [ 0,  1,  2,  3,  4,  5, 2,  3,  1]
COUNT = [ 1,  5, 12, 40, 28,  0, 8, 63, 10]
--------------------- After execution
VFULL = [ 0, 11,  4, 24, 26,  1, 8,  1,  6]

--------------------- Details
VFULL[0] = 0, because ITEMS[0] = 0 (Diamond Pickaxe) and Steve can have at most 1 in a single slot (which he already does since COUNT[0] = 1)
VFULL[1] = 11, because ITEMS[1] = 1 (Egg) and Steve can have at most 16 in a single slot (and he already has COUNT[1] = 5)
```


**Example 2**
```
ITEMS = [ 0,  1,  2,  3,  4,  5, 2,  3,  1]
COUNT = [ 1, 19, 12, 67, 28,  2, 8, 63, 10]
--------------------- After execution
VFULL = [ 0, 16,  4, 64, 26,  1, 8,  1,  6]

--------------------- Detail
[...]
VFULL[1] = 16, because ITEMS[1] = 1 (Egg) and Steve can have at most 16 in a single slot, but he has COUNT[1] = 19, which is greater -> put max count for Egg in that slot (16)
[...]
VFULL[3] = 64, because ITEMS[3] = 3 (Oak Fence) and Steve can have at most 64 in a single slot, but he has COUNT[3] = 67, which is greater -> put max count for Oak Fence in that slot (64)
```

# Keyboard input/Screen output

If you choose to implement your solution using keyboard input and/or screen output, the format should be the following (i.e., after calling `main.exe`):

```
Type the ITEMS vector:
0 1 2 3 4 5 2 3 1
Type the COUNT vector:
1 19 12 67 28 2 8 63 10
The VFULL vector is:
0 16 4 64 26 1 8 1 6
```

# File input/output

If you choose to implement your solution using file input and/or output, the format of the input file (`in.txt`) is the following (ITEMS vector, and COUNT vector, each on a separate line):

```
0 1 2 3 4 5 2 3 1
1 19 12 67 28 2 8 63 10
```

The format of the output file (`out.txt`) should be the following:

```
0 16 4 64 26 1 8 1 6
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
