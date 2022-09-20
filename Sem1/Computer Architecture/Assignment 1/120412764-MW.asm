.globl    main

.data
		askString:	.asciiz "$ Enter a two-digit integer [00-99]: "
		binaryString:	.asciiz "$ The binary representation of your integer is: "
		inputStr:	.space 20
		str2Int:	.word 0
		binary:		.word 0
		space:		.asciiz " "
		
.text  					
main:
		la $a0, askString  	
		li $v0, 4
		syscall
		
		li $v0, 8
		la $a0, inputStr
		li $a1, 20
		syscall	# inputStr Ready
		
		la $s0, inputStr
		lb $t0, 0($s0)
		lb $t1, 1($s0)
		subi $t0, $t0, 48
		subi $t1, $t1, 48
		mul $t0, $t0, 10
		add $t3, $t1, $t0
		sw $t3, str2Int # str2int Ready
		
binaryConversion:
		la $a0, binaryString
		li $v0, 4
		syscall
		lw $t5, str2Int
		add $t1, $zero, $zero
		addi $t4, $zero, 1
		sll $t4, $t4, 7
		addi $t7, $zero, 8
		addi $s1, $zero, 4
loopedyloop:
		and $t1, $t5, $t4
		beq $t1, $zero, printBinary

		add $t1, $zero, $zero
	 	addi $t1, $zero, 1
		j printBinary
		
printBinary:
		li $v0, 1
		move $a0, $t1
		syscall


		srl $t4, $t4, 1
		addi $t7, $t7, -1
		beq $t7, 4, printSpace
		bne $t7, $zero, loopedyloop
		
exit:
		li $v0, 10
		syscall
		
printSpace:
		la $a0, space	
		li $v0, 4
		syscall
		j loopedyloop
