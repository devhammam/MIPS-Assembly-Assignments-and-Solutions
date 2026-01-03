# Write a program in MIPS assembly to declare an array of
#8 integer numbers, then
#perform the following tasks:
#Calculate and print:
#count of even numbers
#count of odd numbers
#count of numbers greater than zero
#count of numbers less than zero









.data
	arry: .word 11,7,55,-4,5,6,7,8
	size: .word 8
	msgeven: .asciiz " count of even numbers:"
	msgodd: .asciiz "count of odd numbers:"
	msgbig: .asciiz "count of numbers greater than zero:"
	msgsmall: .asciiz "count of numbers less than zero:"
	newline: .asciiz "\n"
	


.text
main:
	la $s0,arry   # base array
	li $s1,0 	#conter loop

	li $s2,8  # size arry
	li $s3,0  # integer from even 
	li $s4,0
	li $s5,0
	li $s6,0
	li $s7,0
	
loop:
	lw  $s5,0($s0)
	beq $s2,$s1,end



	andi $t3,$s5,1
	beq $t3,$zero,even
	add $s4,$s4,1
	j odd
even:
	addi $s3,$s3,1
					
odd:
	bge $s5,$zero,big
	addi $s7,$s7,1
	j counter	
big:
	addi $s6,$s6,1
	
counter:
	addi $s0,$s0,4
	addi $s1,$s1,1
	addi $t1,$zero,7  # size of arry 
	ble $s1,$t1,loop  # if arry[]<7 : loop 
			
end:
	
	li $v0,4
	la $a0,msgeven
	syscall
	
	li $v0,1
	move $a0,$s3
	syscall
	
	
	# print odd 
	li $v0,4
	la $a0,newline
	syscall
	
	li $v0,4
	la $a0,msgodd
	syscall
	
	li $v0,1
	move $a0,$s4
	syscall
	
	# print number greater than zero 
	
	li $v0,4
	la $a0,newline
	syscall
	
	li $v0,4
	la $a0,msgbig
	syscall
	
	li $v0,1
	move $a0,$s6
	syscall
	
	# print massge number less than zero 
	li $v0,4
	la $a0,newline
	syscall
	
	li $v0,4
	la $a0,msgodd
	syscall
	
	li $v0,1
	move $a0,$s4
	syscall
	
	
	li $v0,10
	syscall
	
