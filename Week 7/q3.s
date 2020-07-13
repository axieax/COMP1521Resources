    .data
numbers:
    .word 2309 32 3 2 10 3433 2 42 -5 -2

    .text
main:
    addi $sp, $sp, -4  # create stack frame
    sw   $ra, 0($sp)   # save return address

    la   $a0, numbers
    li   $a1, 10
    jal  max           # call max(numbers, 10)

    move $a0, $v0
    li   $v0, 1
    syscall            # printf("%d")

    li   $v0, 11
    li   $a0, 10       # '\n'
    syscall            # putchar('\n')

                       # clean up stack frame
    lw   $ra, 0($sp)   # restore $ra
    addi $sp, $sp, 4   # restore sp

    li   $v0, 0
    jr   $ra           # return 0

    # max(int* a, int length)
    # $a0 is first arg
    # $a1 is second arg
    # returns max of array a
max:
    li $v0, 42
    jr $ra