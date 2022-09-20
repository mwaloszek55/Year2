#######################################################
# >>>>>>>>>>>>>>> ASSIGNMENT PART 1 <<<<<<<<<<<<<<<<#
#######################################################
# ASSIGNMENT TODO 1:
# This infinite loop simulates the CPU doing something useful
# write down the code that would print
# a line of your choice every 500 iterations including the number of iterations
.globl    main


.data
		busy:	.asciiz "\nNumber of iterations: "	
		loopedy:	.word 0
		busyLoop:	.asciiz "\nNumber of loops: "
.text
main:
		li $s0,0  # s0 represents the number of processed characters 
busywork:
		addi $t0, $t0, 1
		beq $t0, 500, printbusy
		j busywork
printbusy:	
		la $a0, busy	
		li $v0, 4
		syscall
		
		li $v0, 1
		move $a0, $t7
		syscall
		addi $t7, $7, 0
		
		la $a0, busyLoop	
		li $v0, 4
		syscall
		
		
		li $v0, 1
		lw $a0, loopedy
		syscall
		addi $t1, $t1, 1
		sw $t1, loopedy
		j busywork
#######################################################
# >>>>>>>>>>>>>>> ASSIGNMENT PART 2 <<<<<<<<<<<<<<<<#
#######################################################
#ASSIGNMENT TODO 2: Enable simulator keyboard interrupts.
# Hint: Get the value of the keyboard ""control"" register and
# set the interrupt enable bit WITHOUT changing other bits


repeat: 	
		jal getChar 
		move $a0,$v0 
		jal dispChar		
		addi $s0,$s0, 1  
		ble $s0,5,repeat   # loop until processing 6 characters 

		#  The program is finished. Exit.
 		li   $v0, 10          # system call for exit
 		syscall               # Exit!
getChar:
	lui 		$t0, 0xffff      	# t0 = address of Keyboard control register  0xffff 0000
	li 		$t1, 1            	# ready bit MASK (least significant bit) 0x0000 0001
key_wait:
	lbu 		$t2, ($t0)      	# Read keyboard control register  at  xffff 0000
	and		$t2, $t2, $t1 	# Apply ready bit  mask 
	beqz 	$t2, key_wait  	# 0 no key press --> busy waiting , 1 a key is pressed	
	lbu 		$v0, 4($t0)      	# load RECEIVER_DATA to $a0 
	jr 		$ra
	
	
dispChar:
	lui 		$t0, 0xffff    	# t0 = base address  0xffff 0000
	li 		$t1, 1           	# ready bit MASK (least significant bit) 0x0000 0001
loop:	lw 		$t2, 8($t0)   	# Read display control register  at  xffff 0008 
	and		$t2, $t2, $t1 	# Apply deisplay ready bit  mask 
	beqz 	$t2, loop  # 0 display not ready --> busy waiting , 1 --> ready 
	nop                                	# delayed branch skipping [later]
	sb 		$a0,12($t0) 	# send data to transmitter register 
	jr 		$ra	              	# return  




 #######################################################
# >>>>>>>>>>>>>>> ASSIGNMENT PART 3 <<<<<<<<<<<<<<<#
#######################################################
# ASSIGNMENT TODO 3:
# Value of cause register should already be in $k0.
# Check the pending interrupt bits
# for every bit print "Interrupt x is fired", where x is the
# bit number
# If the fired interrupt is a keyboard interrupt,
# execute the code @ __keyboard_interrupt


#######################################################
# >>>>>>>>>>>>>>> ASSIGNMENT PART 4 <<<<<<<<<<<<<<<#
#######################################################
# ASSIGNMENT TODO 4:
# Get the ASCII value of pressed key from the memory mapped receiver
# data register. (MMIO tool). Print char to the STDIO uisng a proper syscall.
# Make any necessary changes in ktext and kdata to perform this task