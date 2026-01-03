#Write a program in MIPS assembly to declare an array of
#10
#integer numbers, then
#perform the following tasks:
#Calculate and print:
#count of positive numbers
#count of negative numbers
#count of numbers between
#10
#and
#50

.data
	integer_arry: .word 2,20,4,9,4,5,-7,-50,96,-78
	size: .word 10
	msgpos: .asciiz " count of positive numbers:"
	msgneg: .asciiz " count of negative numbers:"
	msg_between: .asciiz " the count number count of numbers between 10 and 50: " 
	newline:  .asciiz " \n "
.text
main:
	la $s0,integer_arry  # base arry
	la $s1,size
	li $s2,0 	# count loop
	li $s3,0	#count postive
	li $s4,0	# count negative
	li $s5,0        # count between 10 and 50
	
	
loop:
 	lw $t0,0($s0)
 	blt $t0,$zero,nega
 	addi $s3,$s3,1

 	j betw
 nega:
 	addi $s4,$s4,1
 betw:
 	li $t1,10
 	blt $t0,$t1,count
 	li $t2,50
 	bgt $t0,$t2,count # if t0>50 
 	addi $s5,$s5,1  # beteween num +=1
 count:
 	addi $s0,$s0,4
 	addi $s2,$s2,1
 	li $t3,10
 	blt $s2,$t3,loop
 end:
 	# print postive number 
 	li $v0,4
	la $a0,msgpos
	syscall
	
	li $v0,1
	move $a0,$s3
	syscall
	
	
	# print number negative
	li $v0,4
	la $a0,newline
	syscall
	
	li $v0,4
	la $a0,msgneg
	syscall
	
	li $v0,1
	move $a0,$s4
	syscall
	
	# print number between 10,50
	
	li $v0,4
	la $a0,newline
	syscall
	
	li $v0,4
	la $a0,msg_between
	syscall
	
	li $v0,1
	move $a0,$s5
	syscall
	
	li $v0,10
	syscall
 	
 	
