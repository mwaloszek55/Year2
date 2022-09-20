## Simple Program in MIPS Assembly to read and print a string
# Registers used:
# $v0 - syscall parameter and return value.
# $a0 - gets syscall first parameter 
# $a1 - get the syscall second parameter .
.data
	userInput: .space 20                  # reserve 20 bytes in the memory to be used for taking user input 
	askString: .asciiz "Enter a word: "   # store a program messages (ask string) in the memory 
	responseString: .asciiz "\nYou Entered: "   # store another program messages in the memory 
.text
.globl main
main:
	la $a0, askString		# tell print string syscall what to display --> the ask string
	li $v0, 4			# Sets $v0 to 4 to indicate print_string syscall (function)
	syscall			# execute print string syscall #4 by sending the ask string to the stdout (terminal)
	
	li $v0, 8			# load syscall read_string into $v0.
	la $a0, userInput     # syscall 8 needs to know where to put input user string by getting the buffer memory location in $a0
	li $a1, 20			#  syscall 8 needs to know the size of its buffer
	syscall			# execute syscall 8 to get user input. 
					#The focus is turned to the terminal until the user completes input and presss enter
	
	li $v0, 4			# load syscall print_string (#4) into $v0.
	la $a0, responseString	# tell print string syscall what to display -->  the response string
	syscall				# execute print string syscall.
	# now let's print the user input as we received it. 
	la $a0, userInput	#  guess what is this instruction used for
	li $v0, 4			# guess what is this instruction used for
	syscall				
	
	li $v0, 10			# load syscall exit into $v0.
	syscall				# make the syscall.
