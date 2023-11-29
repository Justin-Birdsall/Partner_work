.globl wackySum combineFour

wackySum:
    #--Stack allocation-- 
    #remember the stack grows down
    addi $sp, $sp, -8 # <- r

    #we have to promise that we don't mess with the $s registers put their original values on the stack
    sw $s0, 0($sp)
    sw $s1, -4($sp)
    sw $s2, -8($sp)


    #the t0 register is our our incrementor (i)
    addi $t0, $a0, 0
    #initalize our return register to be 0 
    addi $v0, $0, 0


    
    #don't need? it should just continue down the lines and enter startloop.
    #j startloop
    
    #^^^ true but for convention

startloop:
 #Assembly uses loops kind of weird. so while this is i > $b0 it should be equivlent to i <= to 
  bgt $t0, $a1, endloop
  #use a0, a1, a2, a3

  addi $s0, $0, 2   #var to hold 2 for division
  addi $s1, $a1, 1  #intermediate var for future division on 2nd arg
  addi $s2, $a2, 2  #^ but for 3rd arg

  div $s1, $s0      #division for second arg
  mflo $s1          #storing quotient in $s1
  addi $a1, $s1, 0  #second arg

  div $s2, $s0      #division for third arg
  mflo $s2          #storing quotient in $s2
  addi $a2, $s2, 0  #third arg
  
  addi $a3, $0, 3   #fourth arg


    #func call does the iterating < no
    #

  
  j combineFour

    #think this is off
  add $v0, $t1 #ah this is uhh
  add $t0, $a2
  j startloop


endloop:
#--deallocating our stack pointer --
#have to do it in reverse order ALSO remember that it grows down so +4 to move up
    lw $s2, 0($sp)
    lw $s1, +4($sp)
    lw $s0 +8($sp)
    #resetting the pointer to 0 
    addi $sp, $0, +8
    addi $t0, $t0, 1
    jr $ra


combineFour: #should still store $s registers here and load them at the end
#one of the questions is about removing the first func so this needs to be able to 
#survive standalone             #stop include heve is before Combine 4
                                #i didn't check but it could have been combinefour doesn't matter tho
    addi $sp, $sp, -8               #not sure what that means

    sw $s0 -0($sp)
    sw $s1 -4($sp)
    sw $s2 -8($sp)

    #first lets do a + b and store into $t1
    addi $t1, $a0, $a1 
    #take the previous value of $t1 and add c to it
    addi $t1, $t1, $a2
    #again add the previous value of $t1 and add D to it. 
    addi $t1, $t1, $a3
    #now sum of all four should be added together

#now that we should have our math calculations correct we now have to check if even or odd
    #remembering back to even and  odd from our cpu projects, we can look at the last bit to
    #check if it is even or odd. 0 == even 1 == odd. 
    #use the $t2 register to hold the result even or odd 
    andi $t2, $t1, 1
    beq $t2, 0, ExitOutCombineFour
    #since we branch if even then we can /2 for odd so if even it should never hit /2
    #looking at problem three helped with this
    #by shifting 1 to the right should be the same as /2
    sra $v0, $t1, 1 
ExitOutCombineFour:
    #this feels weird to me not sure why
    lw $s2, 0($sp)
    lw $s1, +4($sp)
    lw $s0 +8($sp)
    jr $ra 


