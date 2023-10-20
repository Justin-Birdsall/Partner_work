	.globl monkeyTrouble sleepIn posNeg
	.text

# You can use these lines to run your program directly in MARS for
# troubleshooting. Change the values of $a0 and $a1 to try out your
# function with different arguments.
# As the code is written now, it will run all three functions. You can
# comment out a `jal` call if you do not want the function to run.
# ----------------------------------------------------------------------------
	addi $a0, $0, 1		# $a0 and $a1 are used to store function arguments
	addi $a1, $0, 1
	jal monkeyTrouble	# functions are called using `jal`

	addi $a0, $0, 1
	addi $a1, $0, 1
	jal sleepIn

	addi $a0, $0, 1
	addi $a1, $0, 1
	jal posNeg

	addi $v0, $0, 10	# syscall calls the operating system to perform various tasks
	syscall			# It looks in $v0 to determine what to do
				# In the case of $v0 == 10, syscall exits the program
				# Without this, MARS would keep running with the next line
				# of code
# ----------------------------------------------------------------------------
#
# Lines below here are where you will write your functions.
#
monkeyTrouble:
	jr $ra

sleepIn:
	jr $ra

posNeg:
	jr $ra