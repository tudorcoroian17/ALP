# Working with macros and libraries <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [Working with macros](#working-with-macros)
- [Macro library](#macro-library)
- [Procedure library](#procedure-library)
  - [More options for `TLIB`](#more-options-for-tlib)

## Working with macros
A macro is a pseudo-operation that allow the reuse of previously written code. They are similar to procedures, but there are also some differences.

Macros | Procedures
---|---
when called, it will **expand** *in place* with the macro body | when called, it will **modify** the instruction pointer to *jump* to the procedure body
**does not** modify the flow of instructions | **does** modify the flow of instructions
can be grouped in **macro libraries** | can be grouped in **procedure libraries**

> **Note** 
> A *macro library* contains unassambled source code and **must** be included in the program in which a macro from the library is used (with the `INCLUDE` instruction).

> **Note**
> A *procedure library* contains object code (i.e. assambled procedures) which are referred to the link-edit.

To declare and implement a macro, use the following syntax:
```assembly
MACRO_NAME  MACRO [PARAMETER LIST] ; parameters are separated by commas
    LOCAL   [LABEL LIST] ; labels are separated by commas
    ; macro body
ENDM
```
The **local label list** is optional. Macros that use labels inside them, must declare those labels in this list. These labels are then expanded with different names each time the macro is called.

## Macro library
A macro library is nothing more than multiple macros defined in the same soure (`.asm`) file. This file is the included in the main one with the `INCLUDE filename.asm` instruction. [See example below]
https://github.com/tudorcoroian17/ALP/blob/f01af4620e4d4c841b721c610b26361cb12dd586/Lab_08/eg1.asm#L1

Below is the sequence of steps used to assemble and link a macro library to the main file. (`maclib.asm` is the assembly file that contains the macro definitions and `main.asm` is the main file that calls on those macros.)

```mermaid
flowchart LR
    A[maclib.asm] -- tasm --> B[maclib.obj]
    C[main.asm] -- tasm --> D[main.obj]
    B & D -- tlink --> E[main.exe]
```
```
C:\TASM>tasm maclib.asm
C:\TASM>tasm main.asm
C:\TASM>tlink main.obj maclib.obj
C:\TASM>td main.exe
```

## Procedure library
A procedure library start as multiple procedures defined in a code segment. This file is then assembled, and the resulting object file is used with the `tlib` instruction to create a library. This library is then linked with the object generated by the main file.

In the source file of the procedure library, all procedures should be declared as `PUBLIC`, in order for them to be accesible from other modules (i.e. files). [See example below]
https://github.com/tudorcoroian17/ALP/blob/3627b482fd2bfbb5bfb649d9981c32a0698dfc3a/Lab_08/proclib.asm#L1-L4

Additionally, to be able to reference those procedure in the main file, without the assembler throwing errors, the labels of the procedures must be declared as external labels, with the `EXTRN` instruction. [See example below]
https://github.com/tudorcoroian17/ALP/blob/3627b482fd2bfbb5bfb649d9981c32a0698dfc3a/Lab_08/eg2.asm#L5-L9

Below is the sequence of steps to create, assemble and link a procedure library to the main file.

```mermaid
flowchart LR
    A[proclib.asm] -- tasm --> B[proclib.obj]
    B -- tlib --> C[mylib.lib]
    D[main.asm] -- tasm --> E[main.obj]
    C & E -- tlink --> F[main.exe] 
```
```
C:\TASM>tasm /zi proclib.asm
C:\TASM>tlib mylib.lib +proclib.obj
C:\TASM>tasm /zi main.asm
C:\TASM>tlink /v main.obj mylib.lib
C:\TASM>td main.exe
```

### More options for `TLIB`
The instruction `tlib` is called as follows:
```
tlib [library_name] {+,-,*}[module_name]
```
where:
- `+` is used to add a module (`.obj` file) to the library
- `-` is used to remove a module from the library
- `*` is used to extract a module from the library
