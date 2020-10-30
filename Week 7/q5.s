# sum 4 numbers using function calls
# note use of stack to save $ra in main
# and $ra $a0, $a1, $s0 in sum2
# for simplicity we are not using a frame pointer

main:
    addi $sp, $sp, -4   # move stack pointer down to make room
    sw   $ra, 0($sp)    # save $ra on $stack

    li   $a0, 11         # sum4(11, 13, 17, 19)
    li   $a1, 13
    li   $a2, 17
    li   $a3, 19
    jal  sum4

    move $a0, $v0       # printf("%d", z);
    li   $v0, 1
    syscall

    li   $a0, 10        # printf("%c", '\n');
    li   $v0, 11
    syscall

    lw   $ra, 0($sp)    # recover $ra from $stack
    addi $sp, $sp, 4    # move stack pointer back up to what it was when main called

    li   $v0, 0         # return 0 from function main
    jr   $ra            # return from function main


# a,b,c,d are in $a0,$a1,$a2,$a3
# e is in $s0
# f is in $v0 (remporarily)
#
# we use $s0 for e because its value must survive a function call to sum4
# by convention we have to store $s0 original valueon the stack so
# we can restore it before sum4 returns
#
# note sum2 is simple function which changes only $v0
# we could simplify sum4 by relying on this
# but in general we don't do this
# we assume only registers $s0..$s7 survive function calls

sum4:
    addi $sp, $sp, -16  # move stack pointer down to make room
    sw   $ra, 12($sp)   # save $ra on $stack
    sw   $s0, 8($sp)    # save $s0 on $stack
    sw   $a2, 4($sp)    # save $a2 on $stack
    sw   $a3, 0($sp)    # save $a3 on $stack

    jal  sum2           # sum2(a, b)
    move $s0, $v0       # move result to $s0

    lw   $a0, 4($sp)    # restore $a2 from $stack
    lw   $a1, 0($sp)    # restore $a3 from $stack

    jal  sum2           # sum2(c, d);

    move $a0, $s0
    move $a1, $v0
    jal  sum2           # sum2(e, f)

    lw   $ra, 12($sp)   # restore $ra from $stack
    lw   $s0, 8($sp)    # restore $s0 on $stack
    addi $sp, $sp, 16   # move stack pointer back up to what it was when sum4 called

    jr   $ra            # return from sum_product


sum2:                   # sum2 doesn't call other functions
                        # so it doesn't need to save any registers
    add  $v0, $a0, $a1  # return argument + argument 2
    jr   $ra            #