// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

@R0
D=M
@i
M=D       //i=RAM[0]
@R1
D=M
@n
M=D       //n=RAM[1]
@sum
M=0

(LOOP)
 
@n
D=M
@STOP
D;JEQ     //if n==o goto STOP

@i
D=M
@sum
D=D+M
@sum
M=D       //sum=sum+i
@n
M=M-1     //  n=n-1

@LOOP
0;JMP

(STOP)
@sum
D=M
@R2       //RAM[2]=sum
M=D  

(END)
@END
0;JMP