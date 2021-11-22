// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.


// SET R2=0


@2
M=0		//Load 0 into R2
@1
D=M		// Load R1 into D
@END
D;JEQ	// If R1 was 0, we're done
		// otherwise we can proceed
(beginLoop)
@2
D=M		// Load the accumulated value from R2
@0
D=D+M	// Add R0 to D
@2
M=D		// Copy the new D to R2
@1
M=M-1	// Decrement R1 by 1
@1
D=M		// Load R1 to D for comparing
@beginLoop
D; JNE	// if D (R1) is not 0, go back to beginLoop
		// else, we're done
(END)
