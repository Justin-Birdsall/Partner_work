#Richard Roy, Justin Birdsall


#public int intMax(int a, int b, int c) {
#  if(a>b && a>c) {
#    return a;
#  } else if(b>a && b>c) {
#    return b;
#  } else {
#    return c;
#  }

.globl intMax notfirst notsecond

addi $a0, $0, 5
addi $a1, $0, 2
addi $a2, $0, 3

jal intMax
syscall

intMax:
blt $a0, $a1, notfirst
blt $a0, $a2, notfirst
addi $v0, $a0, 0
jr $ra

notfirst:
blt $a1, $a2, notsecond
addi $v0, $a1, 0
jr $ra

notsecond:
addi $v0, $a2, 0
jr $ra
