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
(loopStart)

// check the keyboard status and set R0 accordingly
// then FillScreen will use the R0 register to fill the whole screen
// once the screen has been painted, go back to loopStart

@KBD
D=M // load M[KBD] into D

@color
M=0

@FillScreen
D;JEQ // if D == 0, jump to fillscreen
// otherwise, we should paint black

//we should paint black
@color
M=-1;	// load "black on D
@FillScreen 
0;JMP  // jump to Fillscreen

(FillScreen)
@SCREEN // Load start position into R1
D=A
@R1
M=D

(PaintLoop)

@color
D=M

// load the position to be painted
@R1
A=M
// paint the current pixel
M=D
A=A+1 // Increment the pointer

// use R1 to save the current position
D=A
@R1
M=D

@24576 // latest position we will check
D=A-D
@PaintLoop
D;JGT // if we haven't reach the end, jump to paintloop again 

@loopStart
0;JMP // back to the start
