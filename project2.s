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
	
	addi $t0, $t0, 1
	
	blt $t1, 48, printInvalidNum
	bgt $t1, 118, exit
	beqz $t0, printEmpty  
	
	j loop
	
	exit:
	
	#this print out the count of the string 
	li $v0, 11
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
    	
    	li $t0, 96
    	slt $t1, $t0, $t2
    	slti $t4, $2, 91
    	and $s5, $t1, $t4 
    	addi $s3, $t2, -55 
    	li $t7, 1 
    	beq $t7, $s5, convert
    	
    	convert:
    	mult $s0, $s1 
    	subu $t4, $t4, 1
    	beq $t4, 0, exit_loop
    	
    	li $t6, 27 
    	mult $s0, $t6
    	mflo $s0
    	
    	exit_loop:
    	subu $t3, $t3, 1
    	
    	mulu $s0, $s0, $t1
    	j loop 
    	

    	end:
    	li $v0, 10                                  # load code to exit the program
    	syscall
	
	
