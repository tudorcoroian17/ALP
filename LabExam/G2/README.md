# Laboratory exam - Group 2 <!-- omit in toc -->
Submit your solution via Teams, in a `.zip` file, with the following file structure:
```
└── G2_Coroian_Tudor.zip
    ├── p1.asm
    ├── p2.asm
    ├── p3.asm
    └── p4.asm
```
## Table of contents <!-- omit in toc -->
- [Problem 1 - *Shifting sands* (2pts)](#problem-1---shifting-sands-2pts)
- [Problem 2 - *Whirlpool* (2pts)](#problem-2---whirlpool-2pts)
- [Problem 3 - *We don't talk about Bruno* (2pts)](#problem-3---we-dont-talk-about-bruno-2pts)
- [Problem 4 - *Mean* (3pts)](#problem-4---mean-3pts)

## Problem 1 - *Shifting sands* (2pts)
Write a `NEAR` type procedure called `SHIFTING` that changes the contents of `AX` and `CX` as follows:
- shift `AX` four bits to the left
- shift `CX` four bits to the right
- apply an `AND` mask on `AX` so that you are left with only the middle nibbles (e.g. `AX = 0560H`)
- apply an `AND` mask on `CX` so that you are left with only the edge nibbles (e.g. `CX = 7008H`)
- store the sum of `AX` and `CX` in `CX`
- store the difference of `AX` and `CX` in `AX`

Test your procedure for the following two cases:
1. `AX = 4567H` and `CX = 0ABCDH`
2. `AX = 0FAAFH` and `CX = 2020H`

## Problem 2 - *Whirlpool* (2pts)
Write a macro called `WHIRLPOOL`, that takes in a parameter `ammount` (byte-sized) and calls the `SHIFTING` procedure implemented previously for an `ammount` number of times.

Test your macro for the following two cases:
1. `AX = 4567H` and `CX = 0ABCDH` and `ammount = 2`
2. `AX = 0FAAFH` and `CX = 2020H` and `ammount = 4`

## Problem 3 - *We don't talk about Bruno* (2pts)
Write a `FAR` type procedure (max. 2pts.) or a `NEAR` type procedure (max. 1 pt.) called `SHUSH`, that replaces the letters as follows:
- any `b` (lowercase or uppercase) will be replaced by the character `!`
- any `r` (lowercase or uppercase) will be replaced by the character `^`
- any `u` (lowercase or uppercase) will be replaced by the character `&`
- any `n` (lowercase or uppercase) will be replaced by the character `=`
- any `o` (lowercase or uppercase) will be replaced by the character `+`

The address of the string to be processed will be loaded in `AX`, before calling the procedure. A small penalty (0.25 pts.) is applied if the procedure works with the variable directly, instead of loading it's address in `AX`. (Consider this the secret known by Bruno™ :D)

Print the string before and after processing it, with a blank row in between them.

Use the following data segment to test your solution (you can choose any number of variables):
https://github.com/tudorcoroian17/ALP/blob/882da79dcc6c77b99728db4287232ce1c3ba8844/LabExam/G2/dataseg.asm#L1-L6

All strings in this data segment are `$` terminated.

> **Note**
> Don't forget to print new lines where necessary.

## Problem 4 - *Mean* (3pts)
Consider the following procedure:
https://github.com/tudorcoroian17/ALP/blob/503b1c45d696c9497ec472c62d5bfc9314d1fcf2/LabExam/G2/mean.asm#L1-L6

Your task is to implement the three called procedures (`READ`, `PROCESS`, `PRINT`), all of them of type `NEAR`.
1. The `READ` procedure reads a string from the keyboard, composed of numbers (byte-sized) separated by commas, until the `ENTER` key is pressed, and stores it `BUFFER`.
2. The `PROCESS` procedure computes the average value (**quotient** and **remainder**) of the numbers stored in `BUFFER`, and stores it in `AVG_Q` (`DB`) and `AVG_R` (`DB`).
3. The `PRINT` procedure prints the value of `AVG_Q` and `AVG_R` to the console, in base 10, separated by a `SPACE`.

Each implemented procedure will earn you points, as follows
- `READ`    - max 0.5pts
- `PROCESS` - max 1.5pts
- `PRINT`   - max 1pt

Example:
```
C:\TASM> p4.exe
24,47,1,4,10
17 1
```
Explanation:
```
sum = 24 + 47 + 1 + 4 + 10
sum = 86
avg = 86 / 5
avg_q = 17
avg_r = 1
```