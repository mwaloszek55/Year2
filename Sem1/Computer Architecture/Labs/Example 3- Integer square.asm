.globl    main
#  Data Section: variable declarations [reserve memory space and possible initialize]
.data
		integerX:	.word 0
		askString:	.asciiz "Enter a number from 0-99: "
		integerY:         .word    0
		myString:  	.asciiz   "\nThe square of "
		myString2:	.asciiz	" is "
# Text/code Section [where instructions reside]
.text  					
main:
		la $a0, askString  	
		li $v0, 4
		syscall
		
		li $v0, 5
		syscall
		
		sw   $v0, integerX
		lw   $t0, integerX
		mul  $t1, $t0, $t0
		sw   $t1, integerY
		
		li $v0, 4
		la $a0, myString
		syscall	
		
PrintOut1: 	add  $a0, $zero, $t0
      		li   $v0, 1      
      		syscall   
		
		li $v0, 4
		la $a0, myString2
		syscall	
		
PrintOut2: 	add  $a0, $zero, $t1 # move integer to be printed [integerY] to $a0 
      		li   $v0, 1           	# specify Print Integer system service
      		syscall               	# call print integer service from OS 
						# Done! terminate program using system call #10
		li $v0, 10       		# call code for terminate
		syscall          		# system call (terminate)
