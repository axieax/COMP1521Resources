    .data
array:
    .word 1 2 3 4 5 6 4 3 2 1

    .text

# int max(int a[] ($a0), int length ($a1))
max:
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $s0, 4($sp)

    lw $s0, 0($a0) # int first_element = a[0];
if:
    bne $a1, 1, else # if (length != 1) goto else
    move $v0, $s0
    j end_if
else:
    addi $a0, $a0, 4 # calculate &a[1]
    addi $a1, $a1, -1 # length - 1
    jal max
    # $v0 stores max_so_far

if2:
    ble $s0, $v0, end_if2
    move $v0, $s0  # max_so_far = first_element;
end_if2:
    # v0 stores max_so_far
end_if:
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    addi $sp, $sp, 8

    jr $ra

# some test code which calls max
main:
    addi $sp, $sp, -4  # create stack frame
    sw   $ra, 0($sp)   # save return address

    la   $a0, array
    li   $a1, 10
    jal   max    #

    move  $a0, $v0     # printf ("%d")
    li    $v0, 1
    syscall

    li   $a0, 10     # printf("%c", '\n');
    li   $v0, 11
    syscall

                       # clean up stack frame
    lw   $ra, 0($sp)   # restore $ra
    addi $sp, $sp, 4   # restore sp

    li  $v0, 0         # return 0
    jr  $ra
