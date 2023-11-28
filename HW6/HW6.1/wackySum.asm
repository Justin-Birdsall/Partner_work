.globl wackySum combineFour


#--Stack allocation-- 
#addi $sp, $sp, -12
addi $sp, $sp, -28

sw $s0, 0($sp)
sw $s1, 4($sp)
sw $s2, 8($sp)
sw $v0, 12($sp)

wackySum:
    #the t0 register is our our incrementor (i)
    addi $t0, $a0, 0
    #initalize our return register to be 0 
    addi $v0, $0, 0
    j startloop

startloop:
 #Assembly uses loops kind of weird. so while this is i > $b0
  bgt $t0, $a1, endloop
  #this is where we use stack
  #combinefour call gets set to $t1
  #then that is added to ret val
  #
  #use a0, a1, a2, a3
  #$t0 is our i, which does not need to be stored
  
  addi $a0, $t0, 0  #first arg
  addi $s0, $0, 2   #var to hold 2 for division
  addi $s1, $a1, 1  #intermediate var for future division on 2nd arg
  addi $s2, $a2, 2  #^ but for 3rd arg
  div $s1, $s0      #division for second arg
  #TODO: implement way to retrieve remainder/quotient
  addi $a1, $s1, 0  #incorrect, but will be second arg, replace $s1 with result of prev div
  div $s2, $s0      #division for third arg
  addi $a2, $s2, 0  #incorrect, like above, but for third arg
  addi $a3, $0, 3   #fourth arg

  sw $a0, 16($sp)
  sw $a1, 20($sp)
  sw $a2, 24($sp)
  sw $a3, 28($sp)
  #side note: since the "i" var needs to be checked with the 2nd arg ($a1) storing $a vars needs to be adjusted

  
  j combineFour

  add $v0, $t1
  add $t0, $a2
  j startloop


endloop:
    addi $t0, $t0, 1
    jr $ra


combineFour:
    #first lets do a + b
    addi $t1, $a0, $a1
    #take the previous value of $t1 and add c to it
    addi $t1, $t1, $a2
    #again add the previous value of $t1 and add D to it. 
    addi $t1, $t1, $a3

#now that we should have our math calculations correct we now have to check if even or odd
    #remembering back to even and  odd from our cpu projects, we can look at the last bit to
    #check if it is even or odd. 0 == even 1 == odd. 
    #use the $t2 register to hold the result even or odd 
    andi 
#--deallocating our stack pointer --

# chagpt's won't work because it never lw's $a1 for the bgt
# bettt 
#loolllll ill join you later lmaooo 
# I would simply just kms 
# works for me. Im going to close live share and head home to eat dinner and I will push to github
#if that works. Ill hop back on it straight after dinner. 
# 10/4 captin 
#07
#lol oops 
#ye am white boarding rn
#not high i swear
#just found out i have a data structs hw due tomorrow... at 12:00 am............on g
# i'll get the first problem on ours done, then start on my other hw, lmk if you need help and i'll speedrun it
#ok need food anyway
#msg me and i'll push so u can liveshare

#o7