#You will write a MIPS program that reads a string of up to 1000 characters from user input. 
#The string consists of one or more substrings separated by comma. Spaces or tabs at the beginning or end or 
#around commas are ignored, those spaces or tabs should stay. For each of the substring, if it is a hexadecimal 
#string, i.e. it has only the characters from '0' to '9' and from 'a' to 'f' and from 'A' to 'F', the program 
#prints out the corresponding unsigned decimal integer. Otherwise, the program prints out the string of “NaN”. 
#The output should be separated by commas in the same way as the input.
##The program must have the following 3 subprograms.

#Subprogram 1:
#It converts a single hexadecimal character to a decimal integer. Registers must be used to pass parameters into 
#the subprogram. Values must be returned via registers.
#Subprogram 2:
#It converts a single hexadecimal string to a decimal integer. It must call Subprogram 1 to get the decimal value 
#of each of the characters in the string. Registers must be used to pass parameters into the subprogram. Values must be returned via the stack.
#Subprogram 3:
#It displays an unsigned decimal integer. The stack must be used to pass parameters into the subprogram. No values are returned.
#The main program must call Subprogram 2 for conversion and call Subprogram 3 for output.
#Other Requirements:
#• The use of registers must follow the guidelines mentioned in the slides.
#• For grading purposes, no other output (including prompt messages) should be made except those mentioned in the description. You may have extra output during
#development, but must remove that before submission.
#• Version control of the project must be done via Github.
#• The code must be commented. The comment is considered satisfactory if one can
#understand how the program works without reading the instructions.
#• Staring on November 18th, at least one significant update must be committed each day for nine days (not necessarily consecutive). If you complete the project at least 24 hours before the deadline, the number can be reduced to five days. In total there
#must be at least 9 non-trivial commits.




.data

	userInput: .space 1001
	error: .asciiz "Invalid hexadecimal number"
	
.text

	main:
		#tkes in useer input
		li $v0, 8
		la $a0, userInput
		li $a1, 1001
		syscall
		
		j loop
		
		j Subprogram2	#call conversion
		j Subprogram3	#call to output
	loop:
		lb $a0, 0($t0)
		
		#needed for the comparison at then end of the loop
		add $s0, $0, $a0
		
		#print newline
		#li $v0, 4
		#la $a0, nl
		#syscall
		
		#check if at endline and will read in next byte
		addi $t0, $t0, 1
		beq $s0, 0, main
		beq $s0, 10, main
		addi $s1, $s1, 1
		j loop
	
	Subprogram1:
	#It converts a single hexadecimal character to a decimal integer. Registers must be used to pass parameters into 
	#the subprogram. Values must be returned via registers.
	
	

	Subprogram2:
	#It converts a single hexadecimal string to a decimal integer. It must call Subprogram 1 to get the decimal value 
	#of each of the characters in the string. Registers must be used to pass parameters into the subprogram. Values must be returned via the stack.

	##whlie lnot at he end of the string call subprogram1. fro each achar
	#add the number to each other
	
	
	Subprogram3:
	#It displays an unsigned decimal integer. The stack must be used to pass parameters into the subprogram.
	# No values are returned.
		add $a0, $s2, $0
		bge $s4, 8, printDiff
		li $v0, 1
		syscall

