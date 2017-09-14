.text
#-------------------------------------------
# Procedure: insertion_sort
# Argument: 
#	$a0: Base address of the array
#       $a1: Number of array element
# Return:
#       None
# Notes: Implement insertion sort, base array 
#        at $a0 will be sorted after the routine
#	 is done.
#-------------------------------------------
insertion_sort:
	# Caller RTE store (TBD)
	addi $sp, $sp, -20 
	sw $fp, 20($sp)
	sw $ra, 16($sp)
	sw $a0, 12($sp)
	sw $a1, 8($sp)
	addi $fp, $sp, 20

	# Implement insertion sort (TBD)
	li $t0, 1
	li $t2, 0
	li $t3, 0

for_sort_loop: #runs from j=i to length of array A
	bge $t0, $a1, insertion_sort_end 
	move $t1, $t0
	
while_sort_loop: #runs inside for loop while j>0 and A[j-1] > A[j]
	#swaps A[j] and A[j-1] in array when condition is met
	bge  $zero, $t1, loop_sort_end
	mul $t3, $t1, 4			
	add $t3, $a0,$t3
	
	lw $t4, -4($t3)		
	lw $t5, 0($t3)
	bge $t5, $t4, loop_sort_end
	
	sw $t4, 0($t3)
	sw $t5,-4($t3)
	addi $t1, $t1, -1
	jal while_sort_loop
	
loop_sort_end: 
	#increments i through array
	addi $t0, $t0 , 1
	jal for_sort_loop

insertion_sort_end:
	# Caller RTE restore (TBD)
	lw $fp, 20($sp)
	lw $ra, 16($sp)
	lw $a0, 12($sp)
	lw $a1, 8($sp)
	addi $fp, $sp, 20

	# Return to Caller
	jr	$ra
