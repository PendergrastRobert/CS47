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
	addi	$sp, $sp, -20
	sw	$fp, 28($sp)
	sw	$ra, 24($sp)
	sw	$a0, 20($sp)
	sw	$a1, 16($sp)
	sw	$t1, 12($sp)
	sw	$t2, 8($sp)
	addi	$fp, $sp, 20
	# Implement insertion sort (TBD)
	lw $t1, ($a0)
	addi $t2, $a0 -4
loop:
	blt $t2, $a0, insert_done
        lw $t3, ($t2)
        blt $t3, $t1, insert_done
        sw $t3, 4 ($t2)
        addi $t2, $t2, -4
        j loop
insert_done: 
	sw $t1, 4 ($t2)
        jr $ra
insertion: 
	beq $a0, $a1, insertion_sort_end
       	addi $sp, $sp, -8
       	sw   $ra, 4 ($sp)
       	sw   $a1, ($sp)
	addi $a1, $a1, -4
       	jal insertion
       	lw  $a1, ($sp)
       	jal insertion_sort
       	lw $ra, 4 ($sp)
       	lw $a1, ($sp)
       	addi $sp, $sp, 8
insertion_sort_end:
	# Caller RTE restore (TBD)
	lw	$fp, 28($sp)
	lw	$ra, 24($sp)
	lw	$a0, 20($sp)
	lw	$a1, 16($sp)
	lw	$t1, 12($sp)
	lw	$t2, 8($sp)
	addi	$sp, $sp, 28
	# Return to Caller
	jr	$ra
