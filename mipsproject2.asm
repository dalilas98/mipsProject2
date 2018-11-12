.data
 str: 
 	.space 16
 str1:  
 	.asciiz "Input is too short" 
.text
 main: 
  	li $v0, 8 
  	la $a0, str
  	li $a1, 16 
  	syscall 
  	
  	li $v0, 4
  	la $a0, str
  	syscall 
  
	slt $t1, $t2, $t3
	beq $t1, -100, label 
	li $str1
	syscall 