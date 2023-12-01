


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
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    lw $s2, 12($sp)
    addi $sp, $sp, 16
    jr $ra
