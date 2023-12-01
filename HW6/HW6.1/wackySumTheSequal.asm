


combineFour:
    addi $sp, $sp, -12
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $s2, 8($sp)

    add $t0, $a0, $a1
    add $t0, $t0, $a2
    add $t0, $t0, $a3

    #check if even or odd
    andi $t1, $t0, 1
    beq $t1, $0, even
    j odd

even:
    addi $v0, $t0, 0
    jr $ra

odd:
    #divide sum by 2
    srl $t0, $t0, 1
    addi $v0, $t0, 0
    jr $ra
