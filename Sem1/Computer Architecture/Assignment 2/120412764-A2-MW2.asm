.globl    main

.data
		inputStr:	.space 20
		askString:	.asciiz "$ Enter a real number [xxx.yyy]: "
		str2float:	.word 0
		int1:	.word 0
		int2:	.word 0
		floatDiv: .float 1000
		signString:	.asciiz "\n$ The sign bit of your number is: "
		exponentString:	.asciiz "\n$ The exponent of your number is: "
		fractionString:	.asciiz "\n$ The fraction of your number is: "
		exp:	.space 20
		fract: .space 20

		
.text  		

			
									
main:
		la $a0, askString  	
		li $v0, 4
		syscall
		
		la $a0, inputStr
		li $v0, 8
		li $a1, 20
		syscall
		
		

Int1:		
		
		la $s0, inputStr
		
		lb $t0, 0($s0)
		beq $t0, 45, Int1negative
		lb $t1, 1($s0)
		lb $t2, 2($s0)
		
		subi $t0, $t0, 48
		subi $t1, $t1, 48
		subi $t2, $t2, 48
		
		mul $t0, $t0, 100
		mul $t1, $t1, 10
		add $t3, $t1, $t0
		add $t3, $t3, $t2
		sw $t3, int1 
		
		
		
		
		
Int2:

		la $s0, inputStr
		
		lb $t0, 4($s0)
		lb $t1, 5($s0)
		lb $t2, 6($s0)
		
		subi $t0, $t0, 48
		subi $t1, $t1, 48
		subi $t2, $t2, 48
		
		mul $t0, $t0, 100
		mul $t1, $t1, 10
		add $t3, $t1, $t0
		add $t3, $t3, $t2
		sw $t3, int2
int2float:	
		
		lwc1 $f3, floatDiv
		lw $t1, int1
        	mtc1 $t1, $f1
        	cvt.s.w $f1, $f1
        	lw $t1, int2
        	mtc1 $t1, $f2        	
        	cvt.s.w $f2, $f2
        	div.s $f2, $f2, $f3
        	add.s $f0, $f1, $f2
        	swc1 $f0, str2float
        	
        	mov.s $f12, $f0
        	li $v0, 2
		syscall	
		
signConversion:
		la $a0, signString
		li $v0, 4
		syscall
		lw $t5, str2float
		add $t1, $zero, $zero
		addi $t4, $zero, 1
		sll $t4, $t4, 31
		and $t1, $t5, $t4
		beq $t1, $zero, printSign

		add $t1, $zero, $zero
	 	addi $t1, $zero, 1
		
printSign:
		li $v0, 1
		move $a0, $t1
		syscall

		

hexConversionExp:
		la $a0, exponentString
		li $v0, 4
		syscall
        	lw $t5, str2float
		li $t1, 0x7F800000
		and $t2, $t5, $t1
		srl $t2, $t2, 23
		li $t0, 8
		la $t9, exp
        	
loopedyloop:
		beqz $t0, conversionFract
		rol $t2, $t2, 4
		and $t4, $t2, 0xf
		ble $t4, 9, ascii
		addi $t4, $t4, 55 #getting letters if above 9
		
	b endExp
		
	ascii:
		addi $t4, $t4, 48

endExp:
		addi $t0, $t0, -1
		bgt $t0, 1, loopedyloop
		sb $t4, 0($t9)
		addi $t9, $t9, 1

j loopedyloop

conversionFract:
		la $a0, exp
		li $v0, 4
		syscall
		la $a0, fractionString
		li $v0, 4
		syscall
        	lw $t5, str2float
		li $t1, 0x7FFFFF
		and $t2, $t5, $t1
		li $t0, 8
		la $t8, fract
        	
loopedyloop2:	
		beqz $t0, exit
		rol $t2, $t2, 4
		and $t4, $t2, 0xf
		ble $t4, 9, ascii2
		addi $t4, $t4, 55 #getting letters if above 9
		
	b endFract
		
	ascii2:
		addi $t4, $t4, 48

endFract:
		
		addi $t0, $t0, -1
		bgt $t0, 5, loopedyloop2
		sb $t4, 0($t8)
		addi $t8, $t8, 1
		beq $t0, 4, printSpace
		beq $t0, 2, printSpace
j loopedyloop2

		
exit:		
		la $a0, fract
		li $v0, 4
		syscall
		li $v0, 10
		syscall
		
		
		
		
Int1negative:	
		lb $t1, 1($s0)
		lb $t2, 2($s0)
		lb $t3, 3($s0)
		
		subi $t1, $t1, 48
		subi $t2, $t2, 48
		subi $t3, $t3, 48
		
		mul $t1, $t1, 100
		mul $t2, $t2, 10
		add $t4, $t2, $t1
		add $t4, $t4, $t3
		mul $t4, $t4, -1
		sw $t4, int1 


	j Int2negative



Int2negative:
		lb $t1, 5($s0)
		lb $t2, 6($s0)
		lb $t3, 7($s0)
		
		subi $t1, $t1, 48
		subi $t2, $t2, 48
		subi $t3, $t3, 48
		
		mul $t1, $t1, 100
		mul $t2, $t2, 10
		add $t4, $t2, $t1
		add $t4, $t4, $t3
		mul $t4, $t4, -1
		sw $t4, int2


	j int2float	
printSpace:
		li $t7, 32
		sb $t7, 0($t8)
		addi $t8, $t8, 1
j loopedyloop2
