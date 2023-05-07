# System functions in assembly language <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [System functions](#system-functions)
- [BIOS system functions](#bios-system-functions)
- [DOS system functions](#dos-system-functions)

## System functions
The **system functions** are a collection of procedures (routines) that use the system's resources efficiently. These routines are called using the instruction `INT` followed by the code of the routine. Additionally, *subroutines* can be specified by placing the code of the subroutine in `AH` and then calling the `INT` instruction with the code corresponding to the routine.

There are two types of system functions, namely [BIOS](#bios-system-functions) and [DOS](#dos-system-functions).

## BIOS system functions
The **BIOS** system functions grant the user access to the hardware resources of the system. (e.g. video terminal, RAM, HDD, serial interface, RTC, and so on).

The main group of BIOS functions available for the user are:

Interrupt code | Meaning
:-:|---
`INT 10H` | use the video terminal
`INT 11H` | determine system's configuration
`INT 12H` | determine RAM's capacity
`INT 13H` | access the HDD and FDD (Floppy Disk Drive)
`INT 14H` | use the serial interface
`INT 15H` | APM (Advanced Power Management)
`INT 16h` | use the keyboard
`INT 17h` | use the parallel interface
`INT 19h` | loader of resident system on disk
`INT 1Ah` | real time clock controller (RTC) 

> **Note**
> Remember that each of these routines may allow the call of subroutines, by placing the subroutine code in `AH` and then calling the `INT` instruction with the code corresponding to the routine.

## DOS system functions
The **DOS** system functions is actually a collection of subroutines that are called with the instructions `INT 21H`, after loading the appropiate code in the `AH` register. These subroutines operate on the file system, thus allowing the user access to files, without knowing about the hardware configurations.

Some DOS functions which are frequently used are:

`AH` | Meaning | Input | Output
:-: | --- | --- | ---
`01H` | Read a character from the keyboard and send it in echo to the screen | | `AL` = the read character
`02H` | Show a character on the screen | `DL` = the character to print | 
`09H` | Show a string from memory ending in `$` | `DS:DX` = the address of the string in memory | 
`0AH` | Read a string from the keyboard until `ENTER` is pressed and store it into a memory buffer | `DS:DX` = the address of the buffer in memory | 
`2AH` | Read system date | | `AL` = the day of the week (0-6) <br> `CX` = year (1980 - 2099) <br> `DH` = month (1-12) <br> `DL` = the day of the month (1-31)
`2BH` | Set system date | `AL` = the day of the week (0-6) <br> `CX` = year (1980 - 2099) <br> `DH` = month (1-12) <br> `DL` = the day of the month (1-31) | `AL` = status (0 - Success, FF - Error)
`2CH` | Read system time | | `CH` = hour (0-23) <br> `CL` = minutes (1-59) <br> `DH` = seconds (0-59) <br> `DL` = milliseconds (0-99)
`2DH` | Set system time | `CH` = hour (0-23) <br> `CL` = minutes (1-59) <br> `DH` = seconds (0-59) <br> `DL` = milliseconds (0-99) | `AL` = status (0 - Success, FF - Error)

> **Note**
> For the `0AH` subroutine, the structure of the buffer is: `READ_BUF DB max, ?, max DUP (?)`, where `max` is the maximum number of characters to be read, includin the `ENTER`. <br>
> On entry, `DS:DX` specifies the address of a keyboard input buffer structure. <br> 
> Location 0 of this structure specifies the maximum number of characters to return. <br>
> Location 1 will be filled in by DOS with the actual number of characters returned. <br>
> Locations 2-N ofthe structure will contain the characters returned. <br>
> Characters are read from standard input and placed into the buffer starting at the third byte until a carriage return (`0DH`) character is read. When the number of characters in the buffer reaches one fewer than the maximum, additional characters are ignored and DOS will beep for each character typed until a carriage return character is seen.
