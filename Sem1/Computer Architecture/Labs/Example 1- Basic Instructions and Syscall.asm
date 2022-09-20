# A demonstration of some simple MIPS instructions
	# Declare main as a global function
	.globl main 

	.text  	# .text is an assembler directive to indicate user code follows
main:                # The label 'main' is "optionally"  used to indicate the program start
	li $t2, 25		# Load immediate value (25)   
	lw $t3, demoData      # Load word (memory content) from the address labelled "demoData"
	la $t1, demoData	# Load the memory address pointed to by label "demoData"
	add $t4, $t2, $t3	# Add instruction t4=t2+t3
	sub $t5, $t2, $t3	# Subtract instruction t5=t2-t3 
	sw $t5, Z		#Store the answer in Z (declared at the bottom)  

	# Exit the program by means of a syscall.
	# There are many syscalls - pick the desired one
	# by placing its code in $v0. The code for exit is "10"
	li $v0, 10 # Sets $v0 to "10" to select exit syscall
	syscall # Exit 

	# All memory structures are placed after the
	
	.data   # .data assembler directive that indicates allocated memory space 

	# The .word assembler directive reserves space
	# in memory for a single 4-byte word (or multiple 4-byte words)
	# and assigns that memory location an initial value
	# (or a comma separated list of initial values)
demoData:	.word   12 # storing a word in the memory by its decimal value 
Z:	.word 0x0a0b0c0d   # Storing a word by passing its hex value 
