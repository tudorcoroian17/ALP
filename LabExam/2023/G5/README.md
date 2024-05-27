# Laboratory exam - Group 5 <!-- omit in toc -->
Submit your solution via Teams, in a `.zip` file, with the following file structure:
```
└── G5_Coroian_Tudor.zip
    ├── p1.asm
    ├── p2.asm
    ├── p3.asm
    └── p4.asm
```
## Table of contents <!-- omit in toc -->
- [Problem 1 - *Twisting once* (2pts)](#problem-1---twisting-once-2pts)
- [Problem 2 - *Twisting twice... SOLD!* (2pts)](#problem-2---twisting-twice-sold-2pts)
- [Problem 3 - *The cheese tax* (2pts)](#problem-3---the-cheese-tax-2pts)
- [Problem 4 - *Hexing game* (3pts)](#problem-4---hexing-game-3pts)

## Problem 1 - *Twisting once* (2pts)
Write a `NEAR` type procedure called `TWIST` that changes the contents of `AX` and `BX` as follows:
- apply an `AND` bit mask on `AX`, with the mask `0AFFAH`
- apply an `OR` bit mask on `BX`, with the mask `0202H`
- `AL` ← `BH`, `BH` ← `AL`
- `AH` ← `BL`, `BL`	← `AH`

Test your procedure for the following two cases:
1. `AX = 4567H` and `BX = 0ABCDH`
2. `AX = 0FAAFH` and `BX = 2020H`

## Problem 2 - *Twisting twice... SOLD!* (2pts)
Write a macro called `MULTITWIST`, that takes in a parameter `ammount` (byte-sized) and performes the `TWIST` procedure implemented previously for an `ammount` number of times.

Test your macro for the following two cases:
1. `AX = 4567H` and `BX = 0ABCDH` and `ammount = 2`
2. `AX = 0FAAFH` and `BX = 2020H` and `ammount = 4`

## Problem 3 - *The cheese tax* (2pts)
Write a `FAR` type procedure (max. 2 pts.) or a `NEAR` type procedure (max. 1 pt.) called `TAXING`, that replaces the letters as follows:
- any `c` (lowercase or uppercase) will be replaced by the character `#`
- any `h` (lowercase or uppercase) will be replaced by the character `@`
- any `e` (lowercase or uppercase) will be replaced by the character `*`
- any `s` (lowercase or uppercase) will be replaced by the character `%`

The address of the string to be processed will be loaded in `BX`, before calling the procedure. A small penalty (0.25 pts.) is applied if the procedure works with the variable directly, instead of loading it's address in `BX`. (Consider this the cheese tax™ :D)

Print the string before and after processing it.

Use the following data segment to test your solution:
https://github.com/tudorcoroian17/ALP/blob/acdfefa65b9e925da2eb665b00c904da001a5e0b/LabExam/G5/dataseg.asm#L1-L8

All strings in this data segment are `$` terminated.

> **Note**
> Don't forget to print new lines where necessary.

## Problem 4 - *Hexing game* (3pts)
Consider the following procedure:
https://github.com/tudorcoroian17/ALP/blob/be772c0ef8c9f01e7d77c5ce80fea272cdeaa3ff/LabExam/G5/hexing.asm#L1-L6

Your task is to implement the three called procedures (`READ`, `PROCESS`, `PRINT`), all of them of type `NEAR`.
1. The `READ` procedure reads a string from the keyboard, until the `ENTER` key is pressed, and stores it in `BUFFER`
2. The `PROCESS` procedure computes the hex value of the string stored in `BUFFER`, and stores it in `SUM` (`DW`). Computing the hex value means adding the ASCII codes for all the characters in the string.
3. The `PRINT` procedure prints the value of `SUM` to the console.

Each implemented procedure will earn you points, as follows:
- `READ`    - max 0.5pts
- `PROCESS` - max 1pt
- `PRINT`   - max 1.5pts, if sum is printed in base 10 / max 1.25pts if sum is printed in base 16

Example:
```
C:\TASM> p4.exe
gAme5%
468
```
Explanation:
```
sum = 'g' + 'A' + 'm' + 'e' + '5' + '%'
sum = 103 + 65  + 109 + 101 + 53  + 37
sum = 468
```

Test your solution with the string `gAme5%`.