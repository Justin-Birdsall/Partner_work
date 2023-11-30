.globl wackySum combineFour
#someone would store the t registers before calling wackySum

#addi $a0, $0, 4
#addi $a1, $0, 3
#addi $a2, $0, 2
wackySum:
    #--Stack allocation-- 
    #remember the stack grows down
    addi $sp, $sp, -16

    #we have to promise that we don't mess with the $s registers put their original values on the stack
    #sw $s0, 0($sp)
    #sw $s1, 4($sp)
    #sw $s2, 8($sp)
    sw $ra, 12($sp)
    sw $s0, 8($sp)
    sw $s1, 4($sp)
    sw $s2, 0($sp)
    
    addi $s0, $a0, 0  #preserving a0 
    addi $s1, $a1, 0  #preserving a1
    addi $s2, $a2, 0  #preserving a2

    #the t0 register is our our incrementor (i) we have to set i = a like in the java code 
    addi $t0, $a0, 0    #t0 is our i
    addi $t1, $0, 0     #t1 is our sum

startloop:
 #Assembly uses loops kind of weird. so while this is i > $b0 it should be equivlent to i <= to 
  bgt $t0, $a1, endloop

  addi $a0, $t0, 0  #first arg done
  addi $a1, $t0, 1  #second arg pre div
  addi $a2, $t0, 2  #third arg pre div

  srl $a1, $a1, 1   #second arg post div
  srl $a2, $a2, 1   #third arg post div

  addi $a3, $t0, 3  #fourth arg done
  #all args are done
  
  addi $sp, $sp, -12
  #sw $t0, 0($sp)
  #sw $t1, 4($sp)
  #sw $t2, 8($sp)
  #sw $ra, 12($sp)
  sw $t0, 8($sp)
  sw $t1, 4($sp)
  sw $t2, 0($sp)

  jal combineFour

  #lw $ra, 12($sp)
  #lw $t2, 8($sp)
  #lw $t1, 4($sp)
  #lw $t0, 0($sp)
  lw $t2, 0($sp)
  lw $t1, 4($sp)
  lw $t0, 8($sp)
  addi $sp, $sp, 12


#
  add $t1, $t1, $v0   #adds combinefour return val to sum
  addi $v0, $t1, 0    #places sum val in v0 in case the loop ends on next bgt
  addi $t0, $s1, 0    #increments i by c (2nd arg)
  j startloop


endloop:
#--deallocating our stack pointer --
#have to do it in reverse order ALSO remember that it grows down so +4 to move up
    #lw $s2, 8($sp)
    #lw $s1, 4($sp)
    #lw $s0  0($sp)
    lw $s2, 0($sp)
    lw $s1, 4($sp)
    lw $s0  8($sp)
    lw $ra, 12($sp)
    #resetting the pointer to 0 
    addi $sp, $0, 16
    #addi $t0, $t0, 1
    #add $t0, $t0, $a2
    jr $ra


combineFour: 
#should still store $s registers here and load them at the end

    addi $sp, $sp, -12           

    #sw $s0  0($sp)
    #sw $s1  4($sp)
    #sw $s2  8($sp)
    sw $s0  8($sp)
    sw $s1  4($sp)
    sw $s2  0($sp)

    #first lets do a + b and store into $t1
    add $t1, $a0, $a1 
    #take the previous value of $t1 and add c to it
    add $t1, $t1, $a2
    #again add the previous value of $t1 and add D to it. 
    add $t1, $t1, $a3
    #now sum of all four should be added together

#now that we should have our math calculations correct we now have to check if even or odd
    #remembering back to even and  odd from our cpu projects, we can look at the last bit to
    #check if it is even or odd. 0 == even 1 == odd. 
    #use the $t2 register to hold the result even or odd 
    andi $t2, $t1, 1
    addi $v0, $t1, 0
    beq $t2, 0, ExitOutCombineFour
    #since we branch if even then we can /2 for odd so if even it should never hit /2
    #looking at problem three helped with this
    #by shifting 1 to the right should be the same as /2
    srl $v0, $t1, 1 

ExitOutCombineFour:
    #lw $s2, 8($sp)
    #lw $s1, 4($sp)
    #lw $s0  0($sp)
    lw $s2, 0($sp)
    lw $s1, 4($sp)
    lw $s0  8($sp)
    addi $sp, $sp, 12

    jr $ra 

