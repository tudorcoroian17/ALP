# Theoretical considerations <!-- omit in toc -->

Jumping is the most direct method of modifying the instruction flow. The jump instructions change the value of the `IP` register and sometimes of the `CS` register (*for intersegment jump*), so the `IP` and `CS` registers will be loaded with the address of the target.

## Table of contents <!-- omit in toc -->
- [The unconditional jump](#the-unconditional-jump)
- [The conditional jumps](#the-conditional-jumps)
  - [Jump conditions](#jump-conditions)
- [The `LOOP` instruction](#the-loop-instruction)
  - [Types of loop instructions](#types-of-loop-instructions)
- [Procedures](#procedures)
  - [Syntax](#syntax)

## The unconditional jump
**Syntax**: `JMP label`

### Types of jumps <!-- omit in toc -->
|Type | Meaning |
|:--: | :--- |
short (relative) | The destination address (*label*) is **between** -126 and 129 bytes away from the `JMP` instruction, **in the same code segment**.
near | The destination address (*label*) is **over** -126 or 129 bytes away from the `JMP` instruction, **in the same code segment**.
far | The destination address (*label*) is **in a different code segment**.

> **Note** 
> Remember that instructions in assembly are *encoded*. 
> <br>
> e.g. `MOV AX, 48B5H` is encoded to `0xB8B548`

|Syntax | Type | Label position | Encoding |
| :--  | :-: | :-: | :-- |
`ALFA:` <br> `;instructions` <br> `JMP ALFA`  | short | before `JMP` | It is encoded as a **short** jump. (i.e. the *target address* is encoded on 1 byte)
`JMP BETA` <br> `;instructions` <br> `BETA:` | short | after `JMP` | It is encoded as a **near** jump. (i.e. the *target address* is encoded on 2 bytes)
`JMP SHORT BETA` <br> `;instructions` <br> `BETA:` | short | after `JMP` | It is encoded as a **short** jump. (i.e. the *target address* is encoded on 1 byte)
`GAMA:` <br> `;instructions` <br> `JMP GAMA`  | far | before `JMP` | It is encoded as a **far** jump. (i.e. the *target address* is encoded on 4 bytes [seg:offset])
`JMP GAMA` <br> `;instructions` <br> `GAMA:` | far | after `JMP` | It is encoded as a **near** jump. (i.e. the *target address* is encoded on 2 bytes)
`JMP FAR PTR GAMA` <br> `;instructions` <br> `GAMA:` | far | after `JMP` | It is encoded as a **far** jump. (i.e. the *target address* is encoded on 4 bytes [seg:offset])
`JMP VAR` | far (indirect) | variable (word or dword) defined after `JMP` | It is encoded as a **near** jump. (i.e. the *target address* is encoded on 2 bytes)
`JMP DWORD PTR VAR` | far (indirect) | variable (word or dword) defined after `JMP` | It is encoded as a **far** jump. (i.e. the *target address* is encoded on 4 bytes [seg:offset])

> **Warning** 
> Using the SHORT operator in an improper situation will generate an assembly error. Use it **ONLY** if the target address is within 129 bytes after the `JMP` call.

## The conditional jumps
Conditional jumps consist of a process in two steps. 
- the condition is tested (`CMP` or `TEST`)
- the jump is done if the condition is true **or** the next instruction in executed if the condition is false

> **Note**
> All conditional jumps are of short type.

If the target of the conditional jump is out of range, it must be replaced with a conditional jump with the reverse condition (e.g. `JE` is replaced by `JNE`) followed by an unconditional jump.

### Jump conditions
| Jump condition | Compare with sign | Flags | Compare wihtout sign | Flags
| :-- | :-: | :-: | :-: | :-: | 
Equal | `JE` | `ZF = 1` | `JE` | `ZF = 1` |
Not equal | `JNE` | `ZF = 0` | `JNE` | `ZF = 0` |
Greater than | `JG` or `JNLE` | `ZF = 0` and `SF = OF` | `JA` or `JNBE` | `ZF = 0` and `CF = 0`|
Less than | `JL` or `JNGE` | `SF != OF` | `JB` or `JNAE` | `CF = 1`|
Greater than or equal to | `JGE` or `JNL` | `SF = OF` | `JAE` or `JNB` | `CF = 0`|
Less than or equal to | `JLE` or `JNG` | `ZF = 1` and `SF = OF` | `JBE` or `JNA` | `ZF = 1` or `CF = 1`|

> **Note**
> Conditional jumps can also be performed testing particular flags (`JO`, `JNO` a.s.o.) or by testing the `CX` register (`JCXZ` - jump if content of `CX` is 0).

## The `LOOP` instruction
All the loop instructions decrement the content of the `CX` register and if
the jump condition is fulfilled, the loop back is performed. The distance between the looping instruction and the destination address must be between -126 and 129 bytes.

### Types of loop instructions
| Syntax | Meaning |
| :-: | :-- |
`LOOP label` | Decrement `CX` and jump back if `CX != 0`
`LOOPE label` <br> `LOOPZ label` | Decrement `CX` and jump back if `CX != 0` **and** `ZF = 1`
`LOOPNE label` <br> `LOOPNZ label` | Decrement `CX` and jump back if `CX != 0` **and** `ZF = 0`

## Procedures
The procedures are code units that fulfill specific functions. They represent a way of dividing the code in functional parts or blocks so that a specific function can be executed from any other point in the program without having to insert the same code again. They are similar to functions in C/C++.

The following instructions are used along with procedures:
- `PROC` and `ENDP`, which mark the begining and end of the procedure body
- `CALL`, which is used to call the defined procedure (push return address to stack, then jump to procedure body)
- `RET`, which is used to return from the procedure (pop return address from stack, then jump to that address)

> **Note**
> Procedures can be of type `NEAR` (call made in the same segment as the procedure label) or `FAR` (call made from a different segment as the procedure label), with `NEAR` being the implicit type.

### Syntax
```
LABEL   PROC [NEAR or FAR]
    ; procedure body
    RET [immediate]
LABEL   ENDP
```
The value after the return can be used to automatically perform aditional pops from the stack, if parameters were need and were pushed onto the stack.