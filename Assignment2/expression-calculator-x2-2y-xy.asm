# Program: Compute X^2 + 2Y - XY
# Inputs: X, Y from user
# Output: Result value





.data 
	prompt1: .asciiz "Please Enter the X:"
	prompt2: .asciiz "Please Enter the Y:"
  output: .asciiz "The result of X^2 + 2Y - XY = "


.text 
	li $v0, 4    
	la $a0, prompt1
	syscall
	
	
	
	li $v0 , 5
	syscall
	move $t0,$v0
	
	
	li $v0 ,4
	la $a0,prompt2
	syscall
	li $v0 ,5 
	syscall
	
	
	move $t1,$v0

# t0 = X
# t1 = Y

mulu $t2,$t0,$t0     # t2 = X^2
mulu $t3,$t1,2       # t3 = 2Y
mulu $t4,$t0,$t1     # t4 = XY

addu $t5,$t2,$t3     # t5 = X^2 + 2Y
subu $t6,$t5,$t4     # t6 = X^2 + 2Y - XY


	
	
	li $v0,4     # print massge output
	la $a0, output
	syscall
	
	
	
	li $v0,1
	move $a0, $t6
	syscall
	
	
	

