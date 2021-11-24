      inp r1, 2 // get first number and validates it
	  ldr r5, min //loads minimum value
	  ldr r6, max //loads maximum value
	  cmp r1, r5 //compares the value of r1 and r5
	  BLT error
	  cmp r1, r6 /compares the value of r1 and r6
	  BGT error
      inp r2, 2 // get second number and validates it
	  cmp r2, r5
	  BLT error //branches to the error label if it evaluates as true
	  cmp r2, r6
	  BGT error
      // do comparison and branch (jump) to handler
      cmp r2, r1
      BLT lower
      BGT greater
      BEQ equal
      // Point to the correct output string below
	  
greater:
      // handle greater than case
      mov r0, #greaterstring
      mov r3, #cardletters //Moves the value of cardletters into R3 for the array indexing
	  add r3, r2, r3
	  mov r4, #cardletters //Moves the value of cardletters into R4 for the array indexing
	  add r4, r1, r4
      out r3, 8
      out r0, 8
      out r4, 8
      b stop
	  
lower:
      // handle lower than case
      mov r0, #lowerstring
	  mov r3, #cardletters 
	  add r3, r2, r3
	  mov r4, #cardletters
	  add r4, r1, r4
      out r3, 8
      out r0, 8
      out r4, 8
      b stop
	  
equal:
      // handle when equal 
      mov r0, #equalstring
      mov r3, #cardletters 
	  add r3, r2, r3
	  mov r4, #cardletters 
	  add r4, r1, r4
      out r3, 8
      out r0, 8
      out r4, 8
      b stop
	  
stop:
      halt //terminates program. 
      // DATA
      // Make sure strings terminate with 0x00
	  
greaterstring:
      // define the greater than output string here
      dat 0x20736920 //is 
      dat 0x61657267 //greater
      dat 0x20726574 //than
      dat 0x6e616874
      dat 0x0020 //null termination
	  
lowerstring:
      // define the less than output string here
      dat 0x20736920 //is 
      dat 0x7373656c //less
      dat 0x61687420 //than
      dat 0x00206e //null termination
	  
equalstring:
      // define the equals than output string here
      dat 0x20736920 //is 
      dat 0x61757165 //equal
      dat 0x6f74206c //to
      dat 0x0020 //null termination
	  
cardletters:
      // this is an array of all of the letters corresponding to the card values
      dat 0x00// this should never be referenced
      dat 0x41 // A
      dat 0x32 // 2
      dat 0x33 // 3
      dat 0x34 // 4
      dat 0x35 // 5
      dat 0x36 // 6
      dat 0x37 // 7
      dat 0x38 // 8
      dat 0x39 // 9
      dat 0x3031 // 10
      dat 0x4A // J
      dat 0x51 // Q
      dat 0x4B // K
	  
space:
      dat 0x20 // space char
	  
error: 
mov r7, #errormessage
out r7, 8

errormessage: 
      dat 0x6f727245 //Error
	  dat 0x202d2072 // - value
	  dat 0x756c6176 //outside
	  dat 0x756f2065 //of
	  dat 0x64697374 //range!
	  dat 0x666f2065
	  dat 0x6e617220
	  dat 0x00216567
	  halt
	  
      // minimum and maximum card values
min:  dat 1 // min value of card, A
max:  dat 13 // max value of card, K

// Register Usage 
// -----------------------------------------------------
// r0 = stores output string (i.e. greaterstring, etc)
// r1 = inputted number 1
// r2 = inputted number 2
// r3 = stores the ASCII for input 2
// r4 = stores the ASCII for input 1
// r5 = stores the minimum value for checking (1)
// r6 = stores the maximum value for checking (13)
// r7 = stores error message
// -----------------------------------------------------