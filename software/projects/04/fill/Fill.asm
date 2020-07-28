// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(CHECKKEYPRESS)
    @KBD
    D=M
    @BLACK
    D;JGT
    @WHITE
    D;JEQ

(BLACK)
    @color
    M=-1
    @DRAW
    0;JMP

(WHITE)
    @color
    M=0
    @DRAW
    0;JMP

(DRAW)
    @SCREEN
    D=A
    @addr
    M=D //sets addr to screen value

    @8192
    D=A
    @n  
    M=D //sets n to the max screen pixel
    
    @i
    M=0

    @DRAWLOOP
    0;JMP

(DRAWLOOP)
    @i
    D=M
    @n
    D=D-M
    @CHECKKEYPRESS
    D;JGE

    @color
    D=M
    @addr
    A=M
    M=D

    @i
    M=M+1
    @addr
    M=M+1

    @DRAWLOOP
    0;JMP