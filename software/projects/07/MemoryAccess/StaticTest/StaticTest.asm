// push constant 111

@111
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 333

@333
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 888

@888
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// pop static 8

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@StaticTest.vm.8
M=D // store the value

// pop static 3

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@StaticTest.vm.3
M=D // store the value

// pop static 1

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@StaticTest.vm.1
M=D // store the value

// push static 3

@StaticTest.vm.3
D=M // store the value in offset location


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push static 1

@StaticTest.vm.1
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

// push static 8

@StaticTest.vm.8
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
