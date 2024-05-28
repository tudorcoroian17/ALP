# Problem statement

Given two vectors (*vec1* and *vec2*) of **byte-sized unsigned integers**, of at most **15 elements**, write a program in _assembly_ code that creates another vector which contains on the i-th position:

- `0`, if both **vec1[i]** and **vec2[i]** are even
- `1`, if both **vec1[i]** and **vec2[i]** are odd
- `2`, if **vec1[i]** and **vec2[i]** are of different parities (one is even, one is odd)

All three vectors have the same size. E.g.:

```
VEC1 = {8, 6, 5, 7}
VEC2 = {1, 2, 3, 4}
REZ  = {2, 0, 1, 2}

REZ[0] = 2, because VEC1[0] is even and VEC2[0] is odd
REZ[1] = 0, because both VEC1[1] and VEC2[1] are even
REZ[2] = 1, because both VEC1[2] and VEC2[2] are odd
REZ[3] = 2, because VEC1[3] is odd and VEC2[3] is even
```

# Grading
As discussed during the laboratory hours, the laboratory exam is graded based on an incremental scale, as follows:

### Grade 5
For the program to be marked with at most 5, the code should comply to the following characteristics:

- data is declared statically, in the data segment
- no input or output operations
- all code is written in one file `le24tue.asm`
- all code is written in one procedure `START`

### Grade 7
For the program to be marked with at most 7, the code should comply to the following characteristics:

- data is declared statically, in the data segment
- no input or output operations
- all code is written in one file `le24tue.asm`
- the code contains at least one macro (e.g.: for checking the parity)
- the code contains at least two procedures, one `NEAR` and one `FAR` (e.g.: one procedure for placing zeros [`PLACE_ZERO VECTOR, POSITION`] and another procedure for placing ones [`PLACE_ONE VECTOR, POSITION`])
- for both procedures, the addresses of the parameters should be sent via the stack

### Grade 8
For the program to be marked with at most 8, the code should comply to the following characteristics:

- data is declared statically, in the data segment
- no input or output operations
- the code is written in three files:
    - `le24tue.asm` which contains calls to the procedures/macros
    - `maclib.asm` which contains the implementation of the macros
    - `proclib.asm` which contains the implementation of the procedures
- the code contains at least one macro (e.g.: for checking the parity)
- the code contains at least two procedures, one `NEAR` and one `FAR` (e.g.: one procedure for placing zeros [`PLACE_ZERO VECTOR, POSITION`] and another procedure for placing ones [`PLACE_ONE VECTOR, POSITION`])
- for both procedures, the addresses of the parameters should be sent via the stack

### Grade 10
For the program to be marked with at most 10, the code should comply to the following characteristics:

- data is declared dynamically, by initializing the memory locations with zeros
- the two vectors and the length are read from the keyboard
- the resulting vector is written on the screen
- the code is written in three files:
    - `le24tue.asm` which contains calls to the procedures/macros
    - `maclib.asm` which contains the implementation of the macros
    - `proclib.asm` which contains the implementation of the procedures
- the code contains at least one macro (e.g.: placing 0/1/2 based on parity)
- the code contains at least two procedures, one `NEAR` and one `FAR` (e.g.: one procedure for reading a vector and another procedure for printing a vector)
- for both procedures, the addresses of the parameters should be sent via the stack

#### Input/Output scenario
Below is an example of an input and output scenario. Mind the new lines!

```
Enter the length of the vectors: 4
Enter the elements of the first vector:
8,6,5,7
Enter the elements of the second vector:
1,2,3,4
The resulting vector is:
2,0,1,2
```

### Grade 10.5
For the program to be marked with at most 10 (and a 0.5 bonus), the code should comply to the following characteristics:

- data is declared dynamically, by initializing the memory locations with zeros
- the two vectors and the length are read from the input file `in.txt`
- the resulting vector is written in the output file `out.txt`
- the code is written in three files:
    - `le24tue.asm` which contains calls to the procedures/macros
    - `maclib.asm` which contains the implementation of the macros
    - `proclib.asm` which contains the implementation of the procedures
- the code contains at least one macro (e.g.: placing 0/1/2 based on parity)
- the code contains at least two procedures, one `NEAR` and one `FAR` (e.g.: one procedure for reading a vector and another procedure for printing a vector)
- for both procedures, the addresses of the parameters should be sent via the stack

#### `in.txt` file structure
The content of the input file is described below:

```
4
8,6,5,7
1,2,3,4
```

#### `out.txt` file structure
The content of the output file is described below:

```
Result vector:
2,0,1,2
```