    .data
numbers:
    .word 0 0 0 0 0 0 0 0 0 0

    .text
main:
    addi $sp, $sp, -4  # create stack frame
    sw   $ra, 0($sp)   # save return address

    li $t0, 0 # i = 0
while:
    bge $t0, 10, end_while

    li $v0, 5
    syscall

    # $v0 contains scanned number

    la $t1, numbers # numbers
    mul $t2, $t0, 4 # offset = 4*i
    add $t1, $t1, $t2 # $ti stores numbers + offset

    sw $v0, ($t1)

    addi $t0, $t0, 1
    j while
end_while:

    la $a0, numbers
    jal print_numbers # call print_numbers(numbers)

    # clean up stack frame
    lw   $ra, 0($sp)   # restore $ra
    addi $sp, $sp, 4   # restore sp

    li $v0, 0
    jr $ra # return 0

# function - prints 10 numbers from numbers array seperated by spaces
# NOTE: numbers provided as argument in register $a0
print_numbers:
    addi $sp, $sp, -12 # create stack frame
    sw   $ra, 8($sp)   # save return address
    sw   $s0, 4($sp)   # save $s0
    sw   $s1, 0($sp)   # save $s1

    # NOTE: i'm using $s0 and $s1 for fun, we could have used $t registers it would have been fine since we don't call any functions
    move $s0, $a0 # move argument into s0 so we don't overwrite it when doing syscalls
    li $s1, 0 # i = 0 
for:
    bge $s1, 10, end_for

    mul $t0, $s1, 4 # offset = 4*i
    add $t0, $s0, $t0 # $ti stores numbers + offset

    lw $a0, ($t0) # load numbers[i] into $t1
    li $v0, 1
    syscall # printf("%d", numbers[i])

    li $a0, ' '
    li $v0, 11
    syscall # putchar(' ')

    addi $s1, $s1, 1
    j for
end_for:

    li $a0, 10 # '\n'
    li $v0, 11
    syscall # putchar('\n')

                       # clean up stack frame
    lw   $s1, 0($sp)   # restore $s1
    lw   $s0, 4($sp)   # restore $s0
    lw   $ra, 8($sp)   # restore $ra
    addi $sp, $sp, 12  # restore sp

    jr  $ra # return