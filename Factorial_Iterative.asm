.include "./cs47_macro.asm"

.data
msg1: .asciiz "Enter a number ? "
msg2: .asciiz "Factorial of the number is "
charCR: .asciiz "\n"

.text
.globl main
main:	print_str(msg1)
	read_int($t0)
	move $a0, $t0 
	jal factorial 
	move $s0, $v0
	print_str(msg2)
	print_reg_int($s0)
	print_str(charCR)
	
	exit

factorial:
	addi	$sp, $sp, -20
	sw   	$fp, 20($sp)
	sw   	$ra, 16($sp)
	sw   	$a0, 12($sp)
	sw   	$s0,  8($sp)
	addi 	$fp, $sp, 20
	addiu $t0, $zero, 1
	blt   $a0, $t0, factorialend
	move  $s0, $a0 
	addi  $a0, $a0, -1
	jal   factorial
	mult  $s0, $v0
	mflo  $v0
	lw   	$fp, 20($sp)
	lw   	$ra, 16($sp)
	lw   	$a0, 12($sp)
	lw   	$s0,  8($sp)
	addi	$sp, $sp, 20
	jr 	$ra	

factorialend:
	addiu $v0, $zero, 1
	
factorialreturn:
	lw   	$fp, 20($sp)
	lw   	$ra, 16($sp)
	lw   	$a0, 12($sp)
	lw   	$s0,  8($sp)
	addi	$sp, $sp, 20
	jr 	$ra	
