# Programs with multiple segments <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [Procedures in multiple segments](#procedures-in-multiple-segments)
  - [`NEAR` type procedures](#near-type-procedures)
  - [`FAR` type procedures](#far-type-procedures)
- [Passing parameters to procedures](#passing-parameters-to-procedures)
  - [Registers](#registers)
  - [Memory](#memory)
  - [Stack](#stack)

## Procedures in multiple segments
Remember that procedures can be of `FAR` or `NEAR` type, which determines the way in which the call to the procedure is made.

### `NEAR` type procedures
Calling a procedure of type `NEAR` implies:
1. `IP` is saved on the stack
2. `IP` is modified with the address of the *called* procedure
3. `CS` is NOT modified (and is NOT saved on the stack)

> **Note**
> If `CS` is not modified, this implies that both the *calling* procedure and the *called* procedure are **in the same** code segment.

For procedures writen in different file modules (`.asm` files), the fact that they belong to the same code segment in marked by **the name of the code segment**. [See example below]

<table>
<tr>
<th align="center">
<img width="441" height="1">
<p align="center">
Procedure definition
</p>
</th>
<th align="center">
<img width="441" height="1">
<p align="center">
Procedure call
</p>
</th>
</tr>
<tr>
<td>
https://github.com/tudorcoroian17/ALP/blob/83cefbd5a1b9f241d3feb881c264fd2c581909da/Lab_08/proclib.asm#L1-L19
</td>
<td>
https://github.com/tudorcoroian17/ALP/blob/03befd34e46049e90e998ae6cae6039436d6f36c/Lab_08/eg2.asm#L5-L9
</td>
</tr>
</table>

> **Note**
> In the examples above, both code segments have the name `CODE`

In order to tell the linker that procedures **called** in this module are defined in another module, the `EXTRN` directive is used. For `NEAR` type procedures, this directive is used **inside** the code segment in which the call is made, in the file that calls the procedures. [See lines 6 and 7 in the code above, in `eg2.asm`]

On the other hand, in order to tell the linker that procedures **defined** in this module can be called from other modules, the `PUBLIC` directive is used. For `NEAR` procedures, the directive is used **inside** the code segment in which the procedure is defined, in the file that defines the procedures. [See lines 2 and 3 in the code above, in `proclib.asm`] 

### `FAR` type procedures
Calling a procedure of type `FAR` implies:
1. `IP` is saved on the stack
2. `IP` is modified with the address of the *called* procedure
3. `CS` is saved on the stack
4. `CS` is modified to hold the code segment of the *called* procedure

> **Note**
> If `CS` is modified, this implies that both the *calling* procedure and the *called* procedure are **in different** code segments.

https://github.com/tudorcoroian17/ALP/blob/036919e535f640ff06bed96c1a4d598705a93be6/Lab_09/farproc.asm#L1-L19 | https://github.com/tudorcoroian17/ALP/blob/036919e535f640ff06bed96c1a4d598705a93be6/Lab_09/main.asm#L5-L9

For `FAR` type procedures, in case of multiple modules, the `EXTRN` directive is used **outside**  of the code segment in which the call is made, but in the file that calls the procedures. [See lines 6 and 7 in the code above, in `main.asm`]

The `PUBLIC` directive is used **inside** the code segment in which the procedure is defined, in the file that defines the procedures. [See lines 2 and 3 in the code above, in `farproc.asm`]

## Passing parameters to procedures

### Registers

### Memory

### Stack


