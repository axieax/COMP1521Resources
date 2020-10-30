main:
    addi $sp, $sp, -4   # move stack pointer down to make room
    sw   $ra, 0($sp)    # save $ra on $stack

    li   $a0, 11        # sum4(11, 13, 17, 19)
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

sum4:
    
    jr $ra

sum2:

    jr $ra