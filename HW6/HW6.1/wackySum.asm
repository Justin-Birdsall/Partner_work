#Justin Birdsall and Richard Roy 
# def fib(n):
#   if n < 2: return n
#   return fib(n-1) + fib(n-2)

# a0: n
# s0: 2   <-- Note: Need to back up s register
# v0: fib(n-1) + fib(n-2)
# t0: fib(n-1)
# t1: fib(n-2)
fib:
  # -- Stack allocation --
  addi $sp, $sp, -8   # Allocate space for two register values
  sw $s0, 0($sp)      # Back up $s0 to stack
  sw $ra, 4($sp)      # Back up $ra to stack

  addi $s0, $0, 2         # $s0 = 2
  blt $a0, $s0, base_case # if n < 2: return n

  # Right now, a0 = n; we want fib(n-1)
  subi $a0, $a0, 1
  # Back up a0 register because fib is going to mess with it
  addi $sp, $sp, -4 # Allocating space for 1 register value on stack
  sw $a0, 0($sp)    # Backing up $a0 register value on stack
  jal fib
  # v0 = fib(n-1)
  move $t0, $v0 # t0 = fib(n-1)
  # Restore a0 register to its original value prior to calling fib(n-1)
  lw $a0, 0($sp)    # Restore $a0's original value from the stack
  addi $sp, $sp, 4  # Deallocating space on the stack

  # f(n-2)
  # Back up $t0 because it's a non-preserved register (i.e., fib might overwrite it)
  addi $sp, $sp, -4 # Allocating space for 1 register value on stack
  sw $t0, 0($sp)    # Backing up $t0 register value on stack
  subi $a0, $a0, 1  # $a0 = n - 2
  jal fib           # v0 = fib(n-2)
  move $t1, $v0     # t1 = v0 = fib(n-2)
  # Restore $t0 back to original value prior to calling fib(n-2)
  lw $t0, 0($sp)    # Restore $t0's original value from the stack
  addi $sp, $sp, 4  # Deallocating space on the stack

  # t0: fib(n-1); t1: fib(n-2)
  add $v0, $t0, $t1
  j end_fib

  base_case:
    move $v0, $a0 # $v0 = $a0 (return n)

  end_fib:
    # -- Stack deallocation --
    lw $s0, 0($sp)    # Restore $s0 to original value
    lw $ra, 4($sp)    # Restore $ra to original value
    addi $sp, $sp, 8  # Deallocate stack space
    jr $ra
---------------------------------------------------------------------------------------------------------------------------------- 

.globl wackySum combineFour


#--Stack allocation-- 
#addi $sp, $sp, -12
addi $sp, $sp, -28

sw $s0, 0($sp)
sw $s1, 4($sp)
sw $s2, 8($sp)
sw $v0, 12($sp)

wackySum:
    #the t0 register is our our incramentor (i)
    addi $t0, $a0, 0
    addi $v0, $0, 0
    j startloop

startloop:
  bgt $t0, $a1, endloop
  #this is where we use stack
  #combinefour call gets set to $t1
  #then that is added to ret val
  #
  #use a0, a1, a2, a3
  #$t0 is our i, which does not need to be stored
  sw $a0, 16($sp)
  sw $a1, 20($sp)
  sw $a2, 24($sp)
  sw $a3, 28($sp)
  addi $a0, $t0, 0
  addi $s0, $0, 2
  
  j combineFour

  add $v0, $t1
  add $t0, $a2
  j startloop


endloop:
  jr $ra


combineFour:

    


#--deallocating our stack pointer --
