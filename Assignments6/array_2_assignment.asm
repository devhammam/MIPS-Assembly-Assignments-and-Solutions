#Write a program in MIPS assembly to declare an array of 6
#integer numbers, then
#perform the following tasks:
#Calculate and print:
#count of numbers divisible by 2
#count of numbers divisible by3
#count of numbers equal to zero



.data
	integer_arry: .word 2,20,4,9,4,5
	size: .word 6
	msgdiv_2: .asciiz " count of numbers divisible by 2:"
	msgdiv_3: .asciiz " count of numbers divisible by 3:"
	msg_zero: .asciiz " count of numbers equal to zero :"
	msg_equal_1: .asciiz " the count number 1: " 
	newline:  .asciiz " \n "
.text
main:
	la $s0,integer_arry  # base arry
	la $s1,size
	li $s2,0 	# count loop
	li $s3,0	#count div by 2
	li $s4,0	# count div by 3
	li $s5,0  	# count num zero 
	li $s6,0       # if num 1 
loop:
	lw $t0,0($s0)
	slti $t1,$t0,2  # if num[arry]< 2 : t1=1 else t1=0
	beq $t1,$zero,start  # if t1= 0 : start 
	beqz $t0,zero 
	addi $s6,$s6,1 # if num = 1 
	j countplus
zero:
	addi $s5,$s5,1
	j countplus
	
	
start:
	and $t2,$t0,1
	beq $t2,$zero,div2
	addi $s4,$s4,1    # s3=s3+1 div by 3
	j countplus
div2:
	addi $s3,$s3,1   # s4=s4+1 div by 2
countplus: 
	addi $s0,$s0,4  # offset arry 4 bit
	addi $s2,$s2,1  # count loop+1
	li $t3,6
	blt $s2,$t3,loop
end:
	li $v0,4
	la $a0,msgdiv_2
	syscall
	
	li $v0,1
	move $a0,$s3
	syscall
	
	
	# print number count div by 3  
	li $v0,4
	la $a0,newline
	syscall
	
	li $v0,4
	la $a0,msgdiv_3
	syscall
	
	li $v0,1
	move $a0,$s4
	syscall
	
	# print number eqal zero than zero 
	
	li $v0,4
	la $a0,newline
	syscall
	
	li $v0,4
	la $a0,msg_zero
	syscall
	
	li $v0,1
	move $a0,$s5
	syscall
	
	# print massge number less than zero 
	li $v0,4
	la $a0,newline
	syscall
	
	li $v0,4
	la $a0,msg_equal_1
	syscall
	
	li $v0,1
	move $a0,$s6
	syscall
	li $v0,4
	la $a0,newline
	syscall
	
	
	
	
