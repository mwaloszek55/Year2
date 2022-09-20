###############################################################################
# Learn about exceptions and interrupts handling in Mips. 
# First version by Karl Marklund <karl.marklund@it.uu.se>
###############################################################################
###############################################################################
# USER TEXT SEGMENT
# MARS start to execute at label main in the user .text segment.
###############################################################################
	.globl main
	.text
main:
	#li $s0, 0x7fffffff  # The largest 32 bit positive two's complement number.
	#addi $s1, $s0, 1  # Trigger an arithmetic overflow exception. 
	#nop
	#lw $s0, 4($zero) # Trigger a bad data address (on load) exception.
	#nop 			# note that this is a user application trying to load a kernel memory
	#teqi $zero, 0   # Trigger a trap exception. 
	#######################################################
	# >>>>>>>>>>>>>>> ASSIGNMENT PART 2 <<<<<<<<<<<<<<<<#
	#######################################################
        #ASSIGNMENT TODO 2:  Enable simulator keyboard interrupts. 	
	# Hint: Get the value of the keyboard ""control"" register and 
	# set the interrupt enable bit WITHOUT changing other bits
	
	lui $t0, 0xffff
	ori $t1, $0, 2
	sw $t1, 0($t0)
    	

infinite_loop: 		
	#######################################################
	# >>>>>>>>>>>>>>> ASSIGNMENT PART 1 <<<<<<<<<<<<<<<<#
	#######################################################
	# ASSIGNMENT TODO 1: 
	# This infinite loop simulates the CPU doing something useful
	# write down the code that would print 
	# a line of your choice every 500 iterations
		addi $t8, $t8, 1
		beq $t8, 5, printInfinite
		j infinite_loop
printInfinite:	
		addi $t9, $t9, 5
		la $a0, busy
		li $v0, 4
		syscall
		
		li $v0, 1
		move $a0, $t9
		syscall
		addi $t8, $0, 0
		
		j infinite_loop
###############################################################################
# KERNEL DATA SEGMENT
###############################################################################
		.kdata
		iterations: .word 0
		busy:	.asciiz "\nNumber of iterations: "
UNHANDLED_EXCEPTION:	.asciiz "===>      Unhandled exception       <===\n\n"
UNHANDLED_INTERRUPT: 	.asciiz "===>      Unhandled interrupt       <===\n\n"
OVERFLOW_EXCEPTION: 	.asciiz "===>      Arithmetic overflow       <===\n\n" 
TRAP_EXCEPTION: 		.asciiz "===>         Trap exception         <===\n\n"
BAD_ADRS_EXCEPTION: 	.asciiz "===>   Bad data address exception   <===\n\n"
		interrupt15String: 	.asciiz "\nInterrupt 15 is fired "
		interrupt14String: 	.asciiz "\nInterrupt 14 is fired "
		interrupt13String: 	.asciiz "\nInterrupt 13 is fired "
		interrupt12String: 	.asciiz "\nInterrupt 12 is fired "		
		interrupt11String: 	.asciiz "\nInterrupt 11 is fired "
		interrupt10String: 	.asciiz "\nInterrupt 10 is fired "
		interrupt9String: 	.asciiz "\nInterrupt 9 is fired "
		interrupt8String: 	.asciiz "\nInterrupt 8 is fired "
# Variables for save/restore of registers used in the handler
	save_v0:    .word   0
	save_a0:    .word   0
	save_at:    .word   0

###############################################################################
# KERNEL TEXT SEGMENT 
###############################################################################
# The kernel handles all exceptions and interrupts.
# 
# The registers $k0 and $k1 should never be used by user level programs and 
# can be used exclusively by the kernel. 
#
# In a real system the kernel must make sure not to alter any registers
# in usr by any of the user level programs. For all such registers, the kernel
# must make sure to save the register valued to memory before use. Later, before 
# resuming execution of a user level program the kernel must restore the 
# register values from memory. 
# 
# Note, that if the kernel uses any pseudo instruction that translates 
# to instructions using $at, this may interfere with  user level programs 
# using $at. In a real system, the kernel must  also save and restore the 
# value of $at. 
###############################################################################

   		# The exception vector address for MIPS32.
   		.ktext 0x80000180  # store this code starting at this address in kernel  part				
   		# Save ALL registers modified in this handler, except $k0 and $k1
		#  we can save registers to static variables.
		sw      $v0, save_v0   #save $v0
		sw      $a0, save_a0  #save $a0
		.set    noat     # do not use $at from here 
		sw      $at, save_at  #save $at
		.set    at       # $at can now be used  
		# starting processing the exception
		mfc0 $k0, $13   		# Get value in CAUSE register
		andi $k1, $k0, 0x00007c  	# Mask all but the exception code (bits 2 - 6) to zero.
		srl  $k1, $k1, 2	  		# Shift two bits to the right to get the exception code in $k1
		beqz $k1, __interrupt	# if exception code is zero --> it is  an interrupt
__exception:			# exceptions are processed here 
	# Practice TODO:replace OVERFLOW_CAUSE_VALUE by the corresponding number 
	beq $k1,  12, __overflow_exception 	
	beq $k1,  4, __bad_address_exception	
	beq $k1,  13, __trap_exception	
	# Practice TODO: Add needed code below to branch to label __bad_address_exception. 		
	# Practice TODO: Add code to branch to label __trap_exception 
	
__unhandled_exception: 
		# It's not really proper doing syscalls in an exception handler,
		# but this handler is just for demonstration and this keeps it short	
	li $v0, 4	  	#  Use the MARS built-in system call 4 (print string) to print error messsage.
	la $a0, UNHANDLED_EXCEPTION
	syscall 
 	j __resume_from_exception
__overflow_exception:

  	#  Use the MARS built-in system call 4 (print string) to print error messsage.	
	li $v0, 4
	la $a0, OVERFLOW_EXCEPTION
	syscall 
 	j __resume_from_exception
 	
 __bad_address_exception:
  	#  Use the MARS built-in system call 4 (print string) to print error messsage.
	li $v0, 4
	la $a0, BAD_ADRS_EXCEPTION
	syscall
 	j __resume_from_exception	
 
__trap_exception: 
  	#  Use the MARS built-in system call 4 (print string) to print error messsage.
	li $v0, 4
	la $a0, TRAP_EXCEPTION
	syscall
 	j __resume_from_exception

__interrupt: 
	#######################################################
	# >>>>>>>>>>>>>>> ASSIGNMENT PART 3 <<<<<<<<<<<<<<<#
	#######################################################
	# ASSIGNMENT TODO 3: 
	# Value of cause register should already be in $k0. 	
	# Check the pending interrupt bits 
	# for every bit  print "Interrupt x is fired", where x is the 
	# bit number 
	# If the fired interrupt is a keyboard interrupt, 
	# execute the code @ __keyboard_interrupt
interrupt15:
	andi $k1, $k0, 0xFF00
	srl  $k1, $k1, 15
	beq  $k1, 1, __interrupt_15
interrupt14:
	andi $k1, $k0, 0xFF00
	srl  $k1, $k1, 14
	beq  $k1, 1, __interrupt_14	
interrupt13:
	andi $k1, $k0, 0xFF00
	srl  $k1, $k1, 13
	beq  $k1, 1, __interrupt_13	
interrupt12:
	andi $k1, $k0, 0xFF00
	srl  $k1, $k1, 12
	beq  $k1, 1, __interrupt_12	
interrupt11:
	andi $k1, $k0, 0xFF00
	srl  $k1, $k1, 11
	beq  $k1, 1, __interrupt_11	
interrupt10:
	andi $k1, $k0, 0xFF00
	srl  $k1, $k1, 10
	beq  $k1, 1, __interrupt_10	
interrupt9:
	andi $k1, $k0, 0xFF00
	srl  $k1, $k1, 9
	beq  $k1, 1, __interrupt_9	
	
interrupt8:
	andi $k1, $k0, 0xFF00
	srl  $k1, $k1, 8
	beq  $k1, 1, __interrupt_8	
	


__unhandled_interrupt:    
  	#  Use the MARS built-in system call 4 (print string) to print error messsage.	
	li $v0, 4
	la $a0, UNHANDLED_INTERRUPT
	syscall 
 	j __resume
 	
 	#######################################################
	# >>>>>>>>>>>>>>> ASSIGNMENT PART 4 <<<<<<<<<<<<<<<#
	#######################################################
	# ASSIGNMENT TODO 4: 
 	# Get the ASCII value of pressed key from the memory mapped receiver 
 	# data register. (MMIO tool). Print char to the STDIO uisng a proper syscall. 
 	# Make any unecessary changes in ktext and kdata  to perform this task
__keyboard_interrupt:     	
	lbu 		$v0, 4($t0)
	move $a0,$v0
	li 		$t1, 1           	# ready bit MASK (least significant bit) 0x0000 0001
loop:	lw 		$t2, 8($t0)   	# Read display control register  at  xffff 0008 
	and		$t2, $t2, $t1 	# Apply deisplay ready bit  mask 
	beqz 	$t2, loop  # 0 display not ready --> busy waiting , 1 --> ready 
	                                	# delayed branch skipping [later]
	sb 		$a0,12($t0) 	# send data to transmitter register 
	j __resume
	

__resume_from_exception: 	 
	# When an exception or interrupt occurs, the value of the program counter 
	# ($pc) of the user level program is automatically stored in the exception 
	# program counter (ECP), the $14 in Coprocessor 0. 
        # Get value of EPC (Address of instruction causing the exception).   
        mfc0 $k0, $14
        
	#Practice TODO 2: Uncomment the following two instructions to avoid
	# executing  the same instruction causing the current exception again.        
        # addi $k0, $k0, 4    # Skip offending instruction by adding 4 to the value stored in EPC    
        # mtc0 $k0, $14      # Update EPC in coprocessor 0.
__resume:
		# Restore registers and reset processor state
		lw      $v0, save_v0    # Restore $v0 before returning
		lw      $a0, save_a0    # Restore $a0 before returning	
		.set    noat            # Prevent assembler from modifying $at
		lw      $at, save_at     # Restore $at before returning
		.set    at
		eret # Use the eret (Exception RETurn) instruction to set $PC to $EPC@C0 
	
__interrupt_15:
		la $a0, interrupt15String	
		li $v0, 4
		syscall
	j __resume

__interrupt_14:
		la $a0, interrupt14String	
		li $v0, 4
		syscall
	j __resume

__interrupt_13:
		la $a0, interrupt13String	
		li $v0, 4
		syscall
	j __resume

__interrupt_12:
		la $a0, interrupt12String	
		li $v0, 4
		syscall
	j __resume

__interrupt_11:
		la $a0, interrupt11String	
		li $v0, 4
		syscall
	j __resume

__interrupt_10:
		la $a0, interrupt10String	
		li $v0, 4
		syscall
	j __resume

__interrupt_9:
		la $a0, interrupt9String	
		li $v0, 4
		syscall
	j __resume

__interrupt_8:
		la $a0, interrupt8String	
		li $v0, 4
		syscall
	j __keyboard_interrupt
		
		