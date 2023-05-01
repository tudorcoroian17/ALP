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
2. `CS` is NOT modified (and is NOT saved on the stack)

> **Note**
> If `CS` is not modified, this implies that both the *calling* procedure and the *called* procedure are in the same code segment.

For procedures writen in different file modules (`.asm` files), the fact that they belong to the same code segment in marked by **the name of the code segment**. [See example below]

https://github.com/tudorcoroian17/ALP/blob/83cefbd5a1b9f241d3feb881c264fd2c581909da/Lab_08/proclib.asm#L1-L19             | https://github.com/tudorcoroian17/ALP/blob/83cefbd5a1b9f241d3feb881c264fd2c581909da/Lab_08/proclib.asm#L1-L19            
:-- | :--


### `FAR` type procedures

## Passing parameters to procedures

### Registers

### Memory

### Stack


