// push constant 17

@17
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 17

@17
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// eq

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=D-M
@STORE_TRUE_0
D; JEQ // eq
@STORE_FALSE_0
0;JMP
(JUMP_BACK_0)

// push constant 17

@17
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 16

@16
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// eq

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=D-M
@STORE_TRUE_1
D; JEQ // eq
@STORE_FALSE_1
0;JMP
(JUMP_BACK_1)

// push constant 16

@16
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 17

@17
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// eq

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=D-M
@STORE_TRUE_2
D; JEQ // eq
@STORE_FALSE_2
0;JMP
(JUMP_BACK_2)

// push constant 892

@892
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 891

@891
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// lt

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=D-M
@STORE_TRUE_3
D; JGT // lt
@STORE_FALSE_3
0;JMP
(JUMP_BACK_3)

// push constant 891

@891
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 892

@892
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// lt

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=D-M
@STORE_TRUE_4
D; JGT // lt
@STORE_FALSE_4
0;JMP
(JUMP_BACK_4)

// push constant 891

@891
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 891

@891
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// lt

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=D-M
@STORE_TRUE_5
D; JGT // lt
@STORE_FALSE_5
0;JMP
(JUMP_BACK_5)

// push constant 32767

@32767
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 32766

@32766
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// gt

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=D-M
@STORE_TRUE_6
D; JLT // gt
@STORE_FALSE_6
0;JMP
(JUMP_BACK_6)

// push constant 32766

@32766
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 32767

@32767
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// gt

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=D-M
@STORE_TRUE_7
D; JLT // gt
@STORE_FALSE_7
0;JMP
(JUMP_BACK_7)

// push constant 32766

@32766
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 32766

@32766
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// gt

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=D-M
@STORE_TRUE_8
D; JLT // gt
@STORE_FALSE_8
0;JMP
(JUMP_BACK_8)

// push constant 57

@57
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 31

@31
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 53

@53
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
D=M+D // add D+RAM[RAM[0]] and store in D


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 112

@112
D=A


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

// neg

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D

D=-D

@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// and

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=M&D // and D&RAM[RAM[0]] and store in D


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// push constant 82

@82
D=A


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// or

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D


@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


A=M // get value from RAM[0] and store in A
D=M|D // or D|RAM[RAM[0]] and store in D


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
M=D // set value of RAM[A] as D
@SP // set M=RAM[0]
M=M+1 // increment value at RAM[0]

// not

@SP // set M=RAM[0]
M=M-1 // decrement RAM[0]


@SP // set M=RAM[0]
A=M // get value from RAM[0] and store in A
D=M // set value of RAM[RAM[0]] in D

D=!D

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

(STORE_TRUE_0)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=-1 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_0
    0;JEQ
(STORE_FALSE_0)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=0 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_0
    0;JEQ


(STORE_TRUE_1)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=-1 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_1
    0;JEQ
(STORE_FALSE_1)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=0 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_1
    0;JEQ


(STORE_TRUE_2)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=-1 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_2
    0;JEQ
(STORE_FALSE_2)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=0 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_2
    0;JEQ


(STORE_TRUE_3)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=-1 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_3
    0;JEQ
(STORE_FALSE_3)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=0 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_3
    0;JEQ


(STORE_TRUE_4)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=-1 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_4
    0;JEQ
(STORE_FALSE_4)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=0 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_4
    0;JEQ


(STORE_TRUE_5)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=-1 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_5
    0;JEQ
(STORE_FALSE_5)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=0 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_5
    0;JEQ


(STORE_TRUE_6)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=-1 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_6
    0;JEQ
(STORE_FALSE_6)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=0 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_6
    0;JEQ


(STORE_TRUE_7)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=-1 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_7
    0;JEQ
(STORE_FALSE_7)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=0 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_7
    0;JEQ


(STORE_TRUE_8)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=-1 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_8
    0;JEQ
(STORE_FALSE_8)
    @SP // set M=RAM[0]
    A=M // get value from RAM[0] and store in A
    M=0 // set value of RAM[A] as D
    @SP // set M=RAM[0]
    M=M+1 // increment value at RAM[0]
    @JUMP_BACK_8
    0;JEQ
