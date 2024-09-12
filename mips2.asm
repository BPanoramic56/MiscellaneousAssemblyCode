# Bruno Pascotto
# University of Utah, CS 3810 - Fall 2024
# Assignment 3
# Converting x += a - 5 + b to MIPS

#	a will hold the value of 10
#	a will hold the value of 30
#	x will initally hold the value of 100, expecting a final result of 135

# All values will be printed prior, during and after operations to ensure good process

.data
	prompt1:
		.asciiz "\nValue of a: "
	
	prompt2:
		.asciiz "\nValue of b: "
		
	prompt3:
		.asciiz "\nValue of x: "
		
	prompt4:
		.asciiz "\nFinal value of x: "
	
	a:
		.word 10
	b:
		.word 30
	x:
		.word 100
		
.text
# -----------------------------------------------------------------------
	# Printing all values first
	# Prompt 1 and a		
	li $v0, 4 		# moving print string service to $v0
	la $a0, prompt1 	# moving prompt1 to $a0
	syscall			# print prompt1
					
	li $v0,1		# moving print integer service to $v0
	lw $t0, a		# getting the value of a
	move $a0, $t0 		# move $t0 value
	syscall         	# print $t0 value
	
	# Prompt 2 and b		
	li $v0, 4 		# moving print string service to $v0
	la $a0, prompt2 	# moving prompt1 to $a0
	syscall			# print prompt1
					
	li $v0,1		# moving print integer service to $v0
	lw $t0, b		# getting the value of b
	move $a0, $t0 		# move $t0 value
	syscall         	# print $t0 value
	
	# Prompt 3 and $t2
	li $v0, 4 		# moving print string service to $v0
	la $a0, prompt3 	# moving prompt3 to $a0
	syscall			# print prompt3
				
	li $v0,1		# moving print integer service to $v0
	lw $t0, x		# getting the value of x into $t0
	move $a0, $t0 		# move $t0 value
	syscall         	# print t0 value
# -----------------------------------------------------------------------
	# making a - 5 ($t0 - %t1)
	
	lw $t0, a
	sub $t0, $t0, 5
	sw $t0, a
# -------------------------------
	# making (a-5) + b ($t0 + $t2)

	lw $t0, a
	lw $t1, b
	add $t0, $t0, $t1
	sw $t0, a
# -------------------------------
	# making x += (a-5+b) $t3 = $t3 + $t0
	
	lw $t0, a
	lw $t1, x
	add $t1, $t1, $t0
	sw $t1, x
# -------------------------------
	# printing the new x value 
	li $v0, 4 		# moving print string service to $v0
	la $a0, prompt4 	# moving prompt4 to $a0
	syscall			# print prompt4
					
	li $v0,1		# moving print integer service to $v0
	lw $t0, x		# getting the value of x into $t0
	move $a0, $t0 		# move $t0 value
	syscall         	# print t0 value
# The program does finish with the expected result: x = 135

# ------------
# Resetting values:
	li $t0, 10
	li $t1, 30
	li $t2, 100
	sw $t0, a
	sw $t1, b
	sw $t2, x
# --------
# Shorter version, without, not as verbose:
# --------
	lw $t0, a
	lw $t1, b
	lw $t2, x
	sub $t0, $t0, 5
	add $t0, $t0, $t1
	add $t2, $t2, $t0
	sw $t2, x
# Printing x
	li $v0, 4 		# moving print string service to $v0
	la $a0, prompt4 	# moving prompt4 to $a0
	syscall			# print prompt4
					
	li $v0,1		# moving print integer service to $v0
	lw $t0, x		# getting the value of x into $t0
	move $a0, $t0 		# move $t0 value
	syscall         	# print t0 value
	