.globl    main

.data
		inputStr:	.space 20
		askString:	.asciiz "$ Enter a real number [xxx.yyy]: "
		str2float:	.word 0
		int1:	.word 0
		int2:	.word 0
		floatDiv: .float 1000
		
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
        	
        	

exit:
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