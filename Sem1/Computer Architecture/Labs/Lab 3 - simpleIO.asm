.text 
main:
		li $s0,0  # s0 represents the number of processed characters 
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
