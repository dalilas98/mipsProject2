.data
 userInput: 
 	.space 16
 str1:  
 	.asciiz "Input is too short" 
.text
 main: 
 	#getting user input
  	li $v0, 8 
  	la $a0, userInput
  	li $a1, 16 
  	syscall 
  	
  	#displyas user input 
  	li $v0, 4
  	la $a0, userInput
  	syscall
  	
 	#syscall to end program 
  	li $v0, 10 
  	syscall 
 
  	
 
  