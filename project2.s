.data 
emptyInput: .asciiz "Input is empty." 
inputTooLong: .asciiz "Input is too long." 
userInput: .space 2000
invalidNum: .asciiz "Invalid base-27 number."
storage: .space 4

.text 
main: 
	la $a0, userInput
	li $v0, 8 
	li $a1, 2000
	syscall 
	
	li $t0, 0 #updated for non 0 numbers 
	li $s0, 1 
	li $t3, 3 
	li $s1, 27 # my base number 
	
	loop: 
	lb $t1, 0($a0)
	beq $t1,10, exit
	
	addi $a0, $a0, 1
	beq $t1,' ', loop 
	
	blt $t1, 48, printInvalidNum
	bgt $t1, 118, exit
	#beqz $t0, exit 
	
	j loop
	
	exit:
	
	
	li $v0, 1 
	bgt $t0, 4, printTooLong
	move $a0, $t0
	syscall 
	j end 
	
	
	

	#after reading  thru string 	
   	 printEmpty:
    	la $a0, emptyInput                  
    	li $v0, 4                                   
    	syscall
    	j end

    	printInvalidNum:
    	la $a0, invalidNum                    
    	li $v0, 4                                   
    	syscall
    	j end

    	printTooLong:
    	la $a0, inputTooLong                  
    	li $v0, 4                                   # load code to print string
    	syscall 
    	j end 

    	end:
    	li $v0, 10                                  # load code to exit the program
    	syscall
	
	
