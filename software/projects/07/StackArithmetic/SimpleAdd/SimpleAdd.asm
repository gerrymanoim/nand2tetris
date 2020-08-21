// push constant 7

@7
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 8

@8
D=A


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
D=D+M // add D+RAM[RAM[0]] and store in D


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]
