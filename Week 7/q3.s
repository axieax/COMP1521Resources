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
    addi $sp, $sp, -8  # create stack frame
    sw   $ra, 0($sp)   # save return address
    sw   $s0, 4($sp)

    lw $s0, ($a0) # int first_element = a[0];
if:
    bne $a1, 1, else # if (length != 1) goto else
    move $v0, $s0
    j end_if
else:
    addi $a0, $a0, 4 # &a[1]
    addi $a1, $a1, -1
    jal max # max(&a[1], length - 1)

    # now $v0 contains max_so_far
if2:
    ble $s0, $v0, end_if2 # if (first_element <= max_so_far) goto end_if2
    move $v0, $s0 # max_so_far = first_element;
end_if2:

end_if:

                       # clean up stack frame
    lw   $s0, 4($sp)   # restore $s0
    lw   $ra, 0($sp)   # restore $ra
    addi $sp, $sp, 8   # restore sp
    jr $ra