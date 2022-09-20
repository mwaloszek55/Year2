.globl    main
#  Data Section: variable declarations [reserve memory space and possible initialize]
.data
		integerX:         .word    4
		integerY:         .word    0
		myString:  	.ascii   "The square of  integerX is  "
# Text/code Section [where instructions reside]
.text  					
main:
		lw   $t0, integerX  	#  Load integerX from memory  into registers
		mul  $t1, $t0, $t0   	# calculate integerX square 
		sw   $t1, integerY   	#store the result in integerY [memory]
PrintStr: 	li $v0, 4 	              	# load $v0 with System call code 4 (print_string).
		la $a0, myString	# Address of string to print.
		syscall                    	# call print string service from OS
PrintOut: 	add  $a0, $zero, $t1 # move integer to be printed [integerY] to $a0 
      		li   $v0, 1           	# specify Print Integer system service
      		syscall               	# call print integer service from OS 
						# Done! terminate program using system call #10
		li $v0, 10       		# call code for terminate
		syscall          		# system call (terminate)
