## Perform vector multiplication of vector A and matrix B, and store the result into vector C
#  s1: holds vector A
#  s2: holds matrix B
#  s3: holds vector C
#  t1: holds i
#  t2: holds j
#  t3: holds sum
#  t4: holds A[j]
#  t5: holds B[i][j]
#  t6: holds LO
#  t7: holds 4
# t8 : holds the array size in elements 

			.data 0x10010000  
Vector_C:		.space 256     # space up to 64 integer numbers

			.data 0x10010100 
Vector_A:		.word 1, 7, 1, 4, 6, 8, 1, 8, 6, 5, 6, 2, 8, 7, 4, 3

			.data 0x10010200 
Matrix_B:		.word 0, 7, 4, 6, 3, 5, 0, 6, 1, 6, 7, 2, 6, 3, 4, 5
       			.word 5, 3, 1, 0, 4, 8, 3, 3, 2, 5, 0, 8, 0, 5, 7, 4
       			.word 0, 6, 6, 3, 4, 7, 7, 4, 8, 1, 8, 4, 6, 8, 5, 1
       			.word 5, 2, 3, 4, 0, 5, 4, 3, 0, 4, 6, 4, 1, 4, 1, 5
       			.word 2, 7, 3, 8, 0, 7, 6, 5, 5, 2, 1, 0, 7, 6, 8, 5
       			.word 6, 8, 3, 1, 0, 4, 0, 7, 3, 1, 1, 1, 5, 2, 6, 6
       			.word 8, 4, 3, 2, 5, 5, 2, 5, 5, 7, 0, 3, 2, 0, 2, 6
       			.word 5, 8, 1, 4, 1, 6, 6, 3, 3, 8, 0, 7, 4, 5, 8, 4
       			.word 7, 3, 8, 2, 7, 0, 3, 3, 8, 8, 6, 6, 6, 6, 3, 6
       			.word 8, 5, 1, 0, 6, 8, 2, 6, 8, 4, 5, 0, 1, 4, 5, 1
       			.word 6, 7, 5, 4, 8, 4, 4, 4, 6, 6, 4, 0, 7, 7, 2, 0
       			.word 4, 4, 0, 6, 4, 1, 3, 1, 2, 1, 1, 4, 3, 3, 6, 6
       			.word 5, 7, 0, 5, 4, 0, 1, 4, 6, 3, 0, 5, 7, 5, 0, 0
       			.word 7, 3, 4, 4, 8, 2, 0, 1, 3, 8, 7, 7, 4, 6, 4, 4
       			.word 5, 0, 2, 7, 4, 1, 7, 0, 5, 4, 6, 4, 5, 1, 7, 2
       			.word 4, 6, 8, 0, 7, 0, 5, 3, 4, 2, 0, 5, 1, 4, 5, 8
			

comma:
			.asciiz ", "

.text 0x00400000
.globl main # main program starts in the next line
main:
	li $t8, 16			# you may change this value for testing
	la $s3, Vector_C	# s3 holds Vector_C
	li $t1, 0 			# i = 0
	li $t7, 4			# t7 = 4
	loopi:
		la $s1, Vector_A
		la $s2, Matrix_B
		mult $t1, $t8		# LO = i * array size
		mflo $t6	
		sll $t6, $t6, 2			# matrix offset of the current row
		add $s2, $s2, $t6	# start of row i of B[]
		li $t3, 0 			# sum = 0
		li $t2, 0 			# j = 0
		loopj:
			lw $t4, 0($s1)		# t4 = A[j]
			lw $t5, 0($s2)		# t5 = B[i][j]
			mult $t4, $t5		# LO = B[i][j]*A[j]
			mflo $t6			# t6 = LO
			add $t3, $t3, $t6	# sum = sum+ LO
			addi $s1, $s1, 0x4	# go to next index in A
			addi $s2, $s2, 0x4	# go to next index in B
			addi $t2, $t2, 1 		# j++
			beq $t2, $t8, breakj	# if j == 16, go to breakj 
			j loopj
		breakj:                  # end of inner loop
			sw $t3, 0($s3)		# store sum into C[i]
			addi $s3, $s3, 0x4	# go to next index in C
			move $a0, $t3		# load C[i]
			li $v0, 1			# load print_int
			syscall			
			
			addi $t1, $t1, 1		# i++
			beq $t1, $t8, breaki	# if i == 64, exit outer loop
			la $a0, comma	# load comma
			li $v0, 4		# load print_string
			syscall					
			j loopi
			
	breaki:	
		li $v0, 10	# exit
		syscall
