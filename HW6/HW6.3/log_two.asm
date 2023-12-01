.globl log_two

#recursive function to find log2 of a number
# log_two:
#     addi $sp, $sp, -4
#     sw $ra, 0($sp)
#     addi $v0, $0, 0
#     jal log_two_helper
#     lw $ra, 0($sp)
#     addi $sp, $sp, 4
#     jr $ra
# log_two_helper:
#     addi $t0, $0, 1
#     blt $a0, $t0, base_case
#     #blt $a0, $0, negative
#     #beq $a0, $0, base_case
#     addi $sp, $sp, -8
#     sw $ra, 4($sp)
#     sw $t1, 0($sp)
#     srl $a0, $a0, 1
#     addi $t1, $t1, 1
#     jal log_two_helper
#     #need to store ret val in something so it is not overwritten
#     #addi $v0, $v0, 1
#     lw $t1, 0($sp)
#     lw $ra, 4($sp)
#     addi $sp, $sp, 8
#     jr $ra

# base_case:
#     beq $a0, $0, zero
#     addi $v0, $0, -1
#     jr $ra

# zero:
#     addi $v0, $0, 0
#     jr $ra


log_two:
    addi $v0, $0, 0
    addi $t0, $0, 1
    blt $a0, $t0, less_case
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal log_two_helper
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
log_two_helper:
    addi $t0, $0, 2
    blt $a0, $t0, base_case
    #blt $a0, $0, negative
    #beq $a0, $0, base_case
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    sra $a0, $a0, 1
    jal log_two_helper

    addi $v0, $v0, 1 
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

less_case:
    addi $v0, $0, -1
    jr $ra

base_case:
    addi $v0, $0, 0
    jr $ra

