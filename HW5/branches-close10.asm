#Richard Roy, Justin Birdsall



#public int close10(int a, int b) {
#  if(Math.abs(10-a) < Math.abs(10-b)) {
#    return a;
#  } else if(Math.abs(10-a) > Math.abs(10-b)) {
#    return b;
#  } else {
#    return 0;
#  }
#}

.globl close10 firstless equal



addi $a0, $0, 0
addi $a1, $0, 11
addi $sp, $sp, -12
sw $t0, 8($sp)
sw $t1, 4($sp)
sw $t2, 0($sp)
jal close10
lw $t2, 0($sp)
lw $t1, 4($sp)
lw $t0, 8($sp)
addi $sp, $sp, 12
syscall

close10:
addi $t0, $0, 10
sub $t1, $t0, $a0
sub $t2, $t0, $a1
abs $t1, $t1
abs $t2, $t2
beq $t1, $t2, equal
bgt $t1, $t2, firstless
addi $v0, $a0, 0
jr $ra

firstless:
addi $v0, $a1, 0
jr $ra

equal:
addi $v0, $0, 0
jr $ra
