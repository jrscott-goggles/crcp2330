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

//R0 = black (all 1) or white (all 0) last OUTER loop
//R1 = black or white current OUTER loop
//R2 = address of KBD
//R3 = address of FLIP loop

@R1 //set R1 = 0
M=0
@KBD //set R2 = KBD address
D=A
@R2
M=D
(OUTER)
	@R1 //push back old bw
	D=M
	@R0
	M=D
	@KBD //check if keyboard is pressed
	D=M
	@NOPRESS
	D;JEQ
	@PRESS
	D;JNE
(NOPRESS)
	@R0
	D=M
	@R1
	M=0
	@CHANGE
	0;JMP
(PRESS)
	@R0
	D=M
	@R1
	M=1
(CHANGE)
	D=D-M
	@OUTER
	D;JEQ
	@SCREEN
	D=A
	@R3
	M=D
(FLIP)
	@R3 //move A to next pixel
	A=M
	M=!M //flip the pixel
	D=A+1 //update R3 for next
	@R3
	M=D
	@R2 //check if out of screen
	D=D-M
	@FLIP
	D;JNE
	@OUTER
	0;JMP