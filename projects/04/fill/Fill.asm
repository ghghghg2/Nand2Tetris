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

    (INI)
   // check KBD
	@ KBD
	D = M
	@ BLACKEN
	D; JNE

    (WHITEN)
	@ i
	M = 0
    (LOOP_W)
	@i
	D = M
	@8192
	D = D - A
	@ INI
	D; JGE
	@ i
	D = M
	@ SCREEN
	A = D + A
	M = 0 // make it white
	@ i
	M = M + 1
	@ LOOP_W
	0; JMP

    (BLACKEN)
	@ i
	M = 0
    (LOOP_B)
	@i
	D = M
	@ 8192
	D = D - A
	@ INI
	D; JGE
	@ i
	D = M
	@ SCREEN
	A = D + A
	M = -1 // make it black
	@ i
	M = M + 1
	@ LOOP_B
	0; JMP
