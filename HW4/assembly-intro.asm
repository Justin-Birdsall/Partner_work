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
	addi $a2, $0, 1
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
#def monkey_trouble(a_smile, b_smile):
#  trouble = False
#  if a_smile == True and b_smile == True:
#    trouble = True
#  if a_smile == False and b_smile == False:
#    trouble = True
#  return trouble
	addi $v0, $0, 0
	bne $a0, $a1, noTrouble
	addi $v0, $0, 1
	jr $ra
noTrouble:
	jr $ra

sleepIn:
#def sleep_in(weekday, vacation):
#  retvar = False
#  if vacation == True or weekday == False:
#    retvar = True
#  return retvar
	addi $v0, $0, 1
	bgtz $a1, sleep
	bgtz $a0, noSleep
	jr $ra
sleep:
	jr $ra
noSleep:
	addi $v0, $0, 0
	jr $ra
	
posNeg:
#def pos_neg(a, b, negative):
#  retvar = False
#  if negative == True:
#    if a < 0 and b < 0:
#      retvar = True
#  if a < 0 ^ b < 0:
#    retvar = True
#  return retvar
	
#Given 2 int values, return True if one is negative and one is positive. 
#Except if the parameter "negative" is True, then return True only if both are negative.
	addi $v0, $0, 0
	bgtz $a2, negTrue
	bgtz $a0, firstPos
	bltz $a0, firstNeg
negTrue:
	bgtz $a0 posNegFalse
	bgtz $a1 posNegFalse
	b posNegTrue
posNegTrue:
	addi $v0, $0, 1
	jr $ra
posNegFalse:
	addi $v0, $0, 0
	jr $ra
firstPos:
	bltz $a1, posNegTrue
	b posNegFalse
firstNeg:
	bgtz $a1, posNegTrue
	b posNegFalse