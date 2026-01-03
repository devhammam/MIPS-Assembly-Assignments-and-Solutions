.data
	 msg1: .asciiz "enter numbers ("
	loopcountnumber: .asciiz "/10): "  # هذا من اجل يضهر للمستخدم عداد ادخال الارقام 
	msg2: .asciiz "\n" 
	msgpos: .asciiz "count of postive:"
	msgnega: .asciiz "count of negative :"
	msgzer: .asciiz "count of zero :"
	msgcoun: .asciiz"count of numbers :"
	
.text
.globl main
	main:	
		#العدد حق الدواره
		li $t0,1
		
		li $s1,0 #من اجل الاعداد المودبه 
		
		
		li $s2,0 # من اجل الاعداد السالبه 
		
		li $s3,0  #من اجل عدد الاصفار 
		
		li $s4,0  # من اجل كم عدد الارقام 
		
		
	
	
	
	
	
	
	loop:
		
		bgt $t0,10,end  # يتخقق من العداد اذا كان اكبر من عشره ينتقل لداله النهايه
		
		
		
		
		#طباعه الرساله التي تخبر المستخدم لكي يدخل عدد
		li $v0,4 
		la $a0,msg1
		syscall
		
		 #هاذا من اجل طباعه الرقم كي يضهر كم ادخل المستخدم
		li $v0,1
		move $a0,$t0
		syscall
		
		
		
		li $v0,4
		la $a0,loopcountnumber
		syscall
		
		
		#الاستقبال من المستخدم
		li $v0,5
		syscall
		move $t6,$v0
		
		# زياده العداد بواجد 
		addi $t0,$t0,1
		
		
		

		bgt $t6, $zero, pos # بتحقق اذا كان اكبر من الصفر يعني موجب 
		
		
    		blt $t6, $zero, nega # يتحقق اذا كان اصعر من الصفر يعني سالب
    		
    		
    		beq $t6, $zero, zer # يتحقق اذا كان يساوي الصفر موجب 
    		
    		
    		
    		
    		
		
	#اذا كان موجب العدد ينتقل لهذه الداله ويزيد الريجيستير بمقدار واجد والا ينبقل لداله الدواره 	
	pos:
		addi $s1,$s1,1
		j counterloop
	
	
	
	
	
	
	
#ادا كان سالب      
	nega:
		addi $s2,$s2,1
		j counterloop
	
	
	
	
	
	
	#ادا كان صفر 	
	zer:
		addi $s3,$s3,1
		j counterloop
	
	
	
	
	
	
	
	
	
	
	# يعود الى اللوب ويزيد 1من اجل معرفه كم عدد العناصر 
	counterloop:
		addi $s4,$s4,1
		j loop 
	
			
	end:
	
		li $v0,4
		la $a0,msg2
		syscall
		
		li $v0,4
		la $a0,msgpos
		syscall
		
		li $v0,1
		move $a0,$s1 # طباعه الاعداد الموجبه 
		syscall
		
		
		li $v0,4
		la $a0,msg2
		syscall
		
		
		
		
		
		#########
		
		
		li $v0,4
		la $a0,msgnega
		syscall
		
		li $v0,1
		move $a0,$s2
		syscall
		
		
		li $v0,4
		la $a0,msg2
		syscall
		##############
		
		
		li $v0,4
		la $a0,msgzer
		syscall
		
		li $v0,1
		move $a0,$s3
		syscall
		
		
		li $v0,4
		la $a0,msg2
		syscall
		###########
		
		
		li $v0,4
		la $a0,msgcoun
		syscall
		
		li $v0,1
		move $a0,$s4
		syscall
		
		
		li $v0,4
		la $a0,msg2
		syscall
		###########
		
		
		
		
		li $v0, 10             
    		syscall 
		
		
		
		

