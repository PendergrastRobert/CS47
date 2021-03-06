#<------------------ MACRO DEFINITIONS ---------------------->#
        # Macro : print_str
        # Usage: print_str(<address of the string>)
        .macro print_str($arg)
	li	$v0, 4     # System call code for print_str  
	la	$a0, $arg   # Address of the string to print
	syscall            # Print the string        
	.end_macro
	
	# Macro : print_int
        # Usage: print_int(<val>)
        .macro print_int($arg)
	li 	$v0, 1     # System call code for print_int
	li	$a0, $arg  # Integer to print
	syscall            # Print the integer
	.end_macro
	
	# Macro : exit
        # Usage: exit
        .macro exit
	li 	$v0, 10 
	syscall
	.end_macro
	
	# Macro : read_int
	# Usage : read_int(<val>)
	.macro read_int($reg)
	li 	$v0, 5
	syscall
	move 	$reg, $v0
	.end_macro

	# Macro : print_reg_int
	# Usage : print_reg_int(<val>)
	.macro print_reg_int($reg)
	li 	$v0, 1
	move 	$a0, $reg
	syscall
	.end_macro

	# Macro : swap_hi_lo
	# Usage : swap_hi_lo(<val>, <val>)
	.macro swap_hi_lo ($temp1, $temp2)
	mthi	$t1
	mtlo	$t2
	mfhi	$temp2
	mflo	$temp1
	syscall
	.end_macro
	
	# Macro : print_hi_lo
	# Usage : prin_hi_lo(<val>, <val>, <val>, <val>)
	.macro print_hi_lo ($strHi, $strEqual, $strComma, $strLo) 
	print_str($strHi)
	print_str($strEqual)
	mfhi	$t2
	print_reg_int($t2)
	print_str($strComma)
	print_str($strLo)
	print_str($strEqual)
	mflo	$t1
	print_reg_int($t1)
	.end_macro

	# Macro: lwi
	# Usage: lwi (<reg>, <upper>, <lower>)
	.macro lwi ($reg, $ui, $li)
	lui $reg, $ui
	ori $reg, $reg, $li
	.end_macro