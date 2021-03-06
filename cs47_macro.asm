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
	.macro read_int($arg)
	li 	$v0, 5
	syscall
	move 	$arg, $v0
	.end_macro

	# Macro : print_reg_int
	# Usage : print_reg_int(<val>)
	.macro print_reg_int($arg)
	li 	$v0, 1
	move 	$a0, $arg
	syscall
	.end_macro