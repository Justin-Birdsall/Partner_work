.globl wackySum combineFour
addi $a0, $0, 21
addi $a1, $0, 26
addi $a2, $0, 1
#we shouldn't have to worry about storing $t registers and $a(probably)
# augmument and temp registers are the calling functon responsibility not the callee
wackySum:
     
    #store those $s registers since we promise that we won't stomp all over them
    #remember the stack grows down
    addi $sp, $sp, -12
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)

    #now that our s registers are preserved we can stomp on them a little bit
    #lets go ahead and make our s equal to registers a, b, c 
    #that way we can change the value of $a0-4 for combineFour
    move $s0 , $a0 #s0 = a
    move $s1 , $a1 #s1 = b
    move $s2 , $a2 #s2 = c

    #let's make our $t0 register our iterator (i)
    move $t0, $a0


    startloop:
    bgt $t0, $s1, endLoopAndWacky 

    #setting up our auguments to pass to combineFour
    #seems redundant because of first iteration but needed for next loop through(s)
    move $a0, $t0
    addi $a1, $t0, 1
    addi $a2, $t0, 2
    addi $a3, $t0, 3

    #we can't forget to divide by two for $a1,a2
    srl $a1, $a1, 1 
    srl $a2, $a2, 1

    add $t0, $t0, $s2
    #should proably ^ back up $t0 register!!!!  and argument registers
    
    j combineFour



    endLoopAndWacky:
    #restore original s register values for the caller since we prommise not to stomp on them 
    lw $s2, 8($sp)
    lw $s1, 4($sp)
    lw $s0, 0($sp)
    addi $sp, $sp, 12

    jr $ra

    #(if a <= b jump)
        #shouldn't have to change $a0


combineFour:
    add $t1, $a0, $a1
    add $t1, $t1, $a2 
    add $t1, $t1, $a3
    
    andi $t2, $t1,0
    beq $t2, $0, evenOutput
    j oddOutput

    #j ExitOutCombineFour

    evenOutput:
        add $v0, $0, $t1
        j ExitOutCombineFour
    oddOutput:
        srl $t1, $t1, 1 
        add $v0, $0, $t1
        j ExitOutCombineFour
    ExitOutCombineFour:
        # lw $s2, 8($sp)
        # lw $s1, 4($sp)
        # lw $s0  0($sp)
        # addi $sp, $sp, 8

        j startloop     

        #sum shoulbe now be stored in $t1
        #now check if it is even or odd 

    
