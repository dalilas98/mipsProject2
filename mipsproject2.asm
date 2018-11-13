.data  
 
userInput: .space 16
invalidString: .asciiz "Invalid- base number"
tooLongString:	.asciiz "Input is too long." 
emptyString: .asciiz  "Input is empty."
array: .space 10 #4 characters 
newline: .asciiz "/n"


.text


 main: 
 	#getting user input
  	li $v0, 8 
  	la $a0, userInput
  	li $a1, 16
  	syscall 
  	
  	li $t0,0 #initlialize count to zero 
  	la $t0, userInput
  	
  	
  	#get string length 
  	loop:
            lbu $t1, 0($a0) #load the character into t1 register 
            
            beq $t1, 10, exit 
            
            #incremenet before going back to the top
            addi $t0, $t0, 1
            addi $a0, $a0, 1
            beq $t1,' ',loop #if it is space, the go to the top of the loop
            
            #check if the ascii value 
            blt $t1, 48, invalid
            bgt $t1, 118, invalid
            
           # blt $t1, 58, 
           # blt $t1, 80,
           # blt $t1, 87, 
           # blt $t1, 112,
           # blt $t1, 119, 
            
            j loop
            
        exit:
		j end
	#print out the count 
	li $v0, 1
	sub $t0, $t0, 1
	bgt $t0, 4, tooLong 
	move $a0, $t0
	syscall
	
	tooLong: 
		li $v0, 4
		la $a0, tooLongString 
		syscall
		j end 
  	invalid:
		li $v0, 4 
		la $a0, invalidString
		syscall 
		j end 
	empty: 
		li $v0, 4
		la $a0, emptyString
		syscall 
		j end 
	end: 
		li $v0, 10
		syscall
