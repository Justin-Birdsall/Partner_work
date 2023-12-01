

addi $a0, $0, 3
addi $a1, $0, 7
addi $a2, $0, 2
j wackySum
syscall

wackySum:
    addi $sp, $sp, 28
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)
    sw $s2, 12($sp)

    #backup $a0-$a2 in s regs
    move $s0, $a0
    move $s1, $a1
    move $s2, $a2

    move $t0, $a0 #t is incrementor
    addi $t1, $0, 0 #t1 is sum
startloop:
    bgt $t0, $s1, endloop

    addi $a0, $t0, 0
    addi $a1, $t0, 1
    srl $a1, $a1, 1
    addi $a2, $t0, 2
    srl $a2, $a2, 1
    addi $a3, $t0, 3

    sw $t0, 16($sp)
    sw $t1, 20($sp)
    sw $t2, 24($sp)

    jal combineFour

    lw $t2, 24($sp)
    lw $t1, 20($sp)
    lw $t0, 16($sp)

    add $t1, $t1, $v0
    add $t0, $t0, $s2
    addi $v0, $t1, 0
    j startloop

endloop:
    move $v0, $t1

    lw $s2, 12($sp)
    lw $s1, 8($sp)
    lw $s0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 28
    jr $ra

combineFour:
    addi $sp, $sp, -16
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)
    sw $s2, 12($sp)

    add $t0, $a0, $a1
    add $t0, $t0, $a2
    add $t0, $t0, $a3

    #check if even or odd
    andi $t1, $t0, 1
    beq $t1, $0, even
    j odd

even:
    addi $v0, $t0, 0
    j endcombine

odd:
    #divide sum by 2
    srl $t0, $t0, 1
    addi $v0, $t0, 0
    j endcombine

endcombine:
    lw $s2, 12($sp)
    lw $s1, 8($sp)
    lw $s0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 16
    jr $ra
