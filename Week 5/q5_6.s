    .data

    .text
main:
    # CODE HERE.

    li $v0, 0
    jr $ra # return 0

# function - prints 10 numbers from numbers array seperated by spaces
# NOTE: numbers provided as argument in register $a0
print_numbers:

    addi $sp, $sp, -8  # create stack frame
    sw   $ra, 0($sp)   # save return address
    sw   $s0, 4($sp)   # save $s0

    # CODE HERE.

    # clean up stack frame
    lw   $s0, 4($sp)   # restore $s0
    lw   $ra, 0($sp)   # restore $ra
    addi $sp, $sp, 8   # restore sp (opposite of line 46)

    jr  $ra # return