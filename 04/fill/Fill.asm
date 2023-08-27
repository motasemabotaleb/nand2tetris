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
(LOOP)    // An infinte loop for control in screen when key is  pressed or not

@SCREEN
D=A
@addr
M=D       // addr=16384 (screen's base address)      

@KBD
D=M
@LOOPOFF
D;JEQ     // if D==0 goto loop to make screen with White 

@LOOPON
D;JGT     // if D>0 goto loop to make screen with Black 

@LOOP
0;JMP


(LOOPON)

@addr
A=M     
M=-1       // To draw the first 16 pixel -#BLACK -(16 col) in the ROW 

@addr
M=M+1      // addr=addr+1 (To draw the next 16 pixel till end of the ROW)

@24576     // (16384 + 32*256 [ROW])
D=A
@addr
D=M-D
@LOOP
D;JEQ

@LOOPON
0;JMP   




(LOOPOFF)

@addr
A=M     
M=0         // To draw the first 16 pixel -#WHITE - (16 col) in the ROW 

@addr
M=M+1       // addr=addr+1 (To draw the next 16 pixel till end of the ROW)

@24576      // (16384 + 32*256 [ROW])
D=A
@addr
D=M-D
@LOOP