// push constant 10

@10
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// pop local 0

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@0
D=A // store offset in D
@LCL
D=D+M // Add offset to pointer base
@R13
M=D // store offset in R13


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@R13
A=M // store the offset location
M=D // store the value

// push constant 21

@21
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 22

@22
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// pop argument 2

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@2
D=A // store offset in D
@ARG
D=D+M // Add offset to pointer base
@R13
M=D // store offset in R13


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@R13
A=M // store the offset location
M=D // store the value

// pop argument 1

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@1
D=A // store offset in D
@ARG
D=D+M // Add offset to pointer base
@R13
M=D // store offset in R13


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@R13
A=M // store the offset location
M=D // store the value

// push constant 36

@36
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// pop this 6

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@6
D=A // store offset in D
@THIS
D=D+M // Add offset to pointer base
@R13
M=D // store offset in R13


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@R13
A=M // store the offset location
M=D // store the value

// push constant 42

@42
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 45

@45
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// pop that 5

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@5
D=A // store offset in D
@THAT
D=D+M // Add offset to pointer base
@R13
M=D // store offset in R13


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@R13
A=M // store the offset location
M=D // store the value

// pop that 2

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@2
D=A // store offset in D
@THAT
D=D+M // Add offset to pointer base
@R13
M=D // store offset in R13


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@R13
A=M // store the offset location
M=D // store the value

// push constant 510

@510
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// pop temp 6

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@6
D=A // store offset in D
@5
D=D+A // Add offset to pointer base
@R13
M=D // store offset in R13


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@R13
A=M // store the offset location
M=D // store the value

// push local 0

@0
D=A // store offset in D
@LCL
D=D+M // Add offset to pointer base
@R13
M=D // store offset in R13


@R13
A=M // store the offset location
D=M // store the value in offset location


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push that 5

@5
D=A // store offset in D
@THAT
D=D+M // Add offset to pointer base
@R13
M=D // store offset in R13


@R13
A=M // store the offset location
D=M // store the value in offset location


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// add

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=M+D // add D+RAM[RAM[0]] and store in D


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push argument 1

@1
D=A // store offset in D
@ARG
D=D+M // Add offset to pointer base
@R13
M=D // store offset in R13


@R13
A=M // store the offset location
D=M // store the value in offset location


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// sub

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=M-D // sub D-RAM[RAM[0]] and store in D


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push this 6

@6
D=A // store offset in D
@THIS
D=D+M // Add offset to pointer base
@R13
M=D // store offset in R13


@R13
A=M // store the offset location
D=M // store the value in offset location


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push this 6

@6
D=A // store offset in D
@THIS
D=D+M // Add offset to pointer base
@R13
M=D // store offset in R13


@R13
A=M // store the offset location
D=M // store the value in offset location


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// add

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=M+D // add D+RAM[RAM[0]] and store in D


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// sub

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=M-D // sub D-RAM[RAM[0]] and store in D


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push temp 6

@6
D=A // store offset in D
@5
D=D+A // Add offset to pointer base
@R13
M=D // store offset in R13


@R13
A=M // store the offset location
D=M // store the value in offset location


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// add

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=M+D // add D+RAM[RAM[0]] and store in D


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

@INFINITE_LOOP
0;JMP
(INFINITE_LOOP)
@INFINITE_LOOP
0;JMP
