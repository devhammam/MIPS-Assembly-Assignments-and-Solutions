.data
	msg: .asciiz "enter the number :"
	msg2: .asciiz "odd"
	msg3: .asciiz "even"
	
.text
.globl main
	main:
		li $v0,4
		la $a0,msg
		syscall
		
		li $v0,5
		syscall
		move $s0,$v0
		
		
		
		
		# نستخدرج اخر بت اذا كان 0 زوجي واذا كان ليس صفر قردي
		andi $t0,$s0,1
		beq $t0,$zero,even 
		
		j odd 
		
	even:
		li $v0,4
		la $a0,msg3
		syscall 
		
		j  end
		
	odd:
		li $v0,4
		la $a0,msg2
		syscall 
		
		
	end:
	
		li $v0,10
		syscall
		

