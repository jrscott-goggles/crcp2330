// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

	@R1 //set counter (R3) = R1
	D=M
	@R3
	M=D
	@R2 //set R2 = 0
	M=0
(MUL_LOOP)
	@R1
	D=M
	@END
	D;JEQ
	
	@R0 //add R0 to R2
	D=M
	@R2
	M=D+M

	@R3 //decrement counter
	MD=M-1
	@MUL_LOOP
	D;JNE

(END)
	@END
	0;JMP