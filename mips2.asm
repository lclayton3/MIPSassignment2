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

	userInput: .space 9
	error: .asciiz "Invalid hexadecimal number"
	
.text

	main:
		j Subprogram2	#call conversion
		j Subprogram3	#call to output
		li $v0, 8
		la $a0, userInput
		li $a1, 9
		syscall




