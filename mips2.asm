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

# $s0 where you read in char
# $s1 - character count
# $s2 - space count
# $s3 - final answer
# $s4 = where you read in second char
# $a0, $t0 - userInput
# $a1 
# $t1 - space mark
# $t2 - value for loop 
# t3 - holds entire string

.data
	
	userInput: .space 1001
	error: .asciiz "Invalid hexadecimal number"
	error2: .asciiz "good hexadecimal number"
	
.text

	main:
		#takes in user input
		li $v0, 8
		la $a0, userInput
		li $a1, 1001
		syscall
		
		#substring chracter count
		li $s1, 0
		#space counter
		li $s2, 0
		#space mark
		li $t1, 0
		#userInput
		la $t0, userInput
		#char counter
		li $t2, 0
		
		#initalize another redister that holds user input
		lb $t3, userInput
		j loop #get the length
		
		#j Subprogram2	#call conversion
		#j Subprogram3	#call to output
		
	loop:	#loop to get the length and possible spaces count and check to see if the string is valid
		lb $a0, 0($t0)
		#replicates the current length
		add $t2, $0, $s1
		
		#needed for the comparison at then end of the loop
		add $s0, $0, $a0
	
		#check if at endline 
		beq $s0, 0, exit2
		beq $s0, 10, exit2
		
		beq $s0, 32, countSpaces
		beq $s0, 44, Suprogram2
		bne $s0, 32, notSpace
		
		
		
	countSpaces:	beq $t1, 0, mark
			bgt $s1, 0, mark
			#moves to next char
			addi $t0, $t0, 1
			j loop
	mark:		#marks fisrt and second occurences of strings
			add $t1, $t1, 1
			#moves to next char
			addi $t0, $t0, 1
			j loop
	notSpace: 	#increments length
			beq $t1, 2, exit
			addi $s1, $s1, 1
			#moves to next char
			addi $t0, $t0, 1
			j loop 
	
	comma:
			#this will get the decimal values for all char before comma
			
	
	Subprogram1:
	#It converts a single hexadecimal character to a decimal integer. Registers must be used to pass parameters into 
	#the subprogram. Values must be returned via registers.
	
	#may be able to check to see if valid string here
	#if branch is less than 47, invalide string NAN
	# if branch is less than 58, 0-10
	#if branch is less than 65, invalid strind NaN
	#if branch is less than  71, go to AF
	#if branch is less than 97, invalid string
	#if branch is less than 103, got to a-f
		#make current char in substring equal to comma and return to
		# Subprogram 2 
	#if none of the above invalid
	
	j Subprogram 2
	
	j Sub
	Subprogram2:
	# set all markers fro valid string back to zero
	# char counter
	li $s1, 0
	#space counter
	li $s2, 0
	#space mark
	li $t1, 0
	
	#It converts a single hexadecimal string to a decimal integer. It must call Subprogram 1 to get the decimal value 
	#of each of the characters in the string. Registers must be used to pass parameters into the subprogram. Values must be returned via the stack.
	
	lb $a1, 0($t3)
	##whlie not at the end of the string call subprogram1. for each achar
	#add the number to each other
	
	#gets current char assigns it to $s4
	add $s4, $0, $a1

	
	addi $t0, $t0, 1
	beq $s4, $s0, loop
	bne $s4, 32, Subprogram1
	
	j Subprogram2
	
	
	
	Subprogram3:
	#It displays an unsigned decimal integer. The stack must be used to pass parameters into the subprogram.
	# No values are returned.
		#add $a0, $s2, $0
		#bge $s4, 8, printDiff
		#li $v0, 1
		#syscall
		
	exit:	#invalid string
		li $v0, 4
		la $a0, error
		syscall
		li $v0,10 
		syscall
		
	exit2:	#good string
		li $v0, 4
		la $a0, error2
		syscall
		
		li $v0,10 
		syscall
		
	 
	

