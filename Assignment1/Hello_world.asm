.data 
    msg: .asciiz "Hello mars"

.text
main:
	li	$v0, 4
	la	$a0,msg
	syscall 

