    .data
numbers:
    .space 40 # int numbers[10]

    .text
main:
    addi $sp, $sp, -4  # create stack frame
    sw   $ra, 0($sp)   # save return address

    li $t0, 0 # i = 0
while1:
    bge $t0, 10, end_while1 # if (i >= 10) goto end_while

    li $v0, 5
    syscall # scanf("%d")

    # NOW, the scanned integer is inside $v0

    mul $t1, $t0, 4 # offset = i * 4
    sw $v0, numbers($t1) # this is numbers + offset, store $v0 into numbers[i]

    addi $t0, $t0, 1 # i++
    j while1
end_while1:

    li $s0, 42 # Load $s0 for fun, just an example of what you can do if you wish to preserve registers across function calls.

    la $a0, numbers
    jal print_numbers # print_numbers(numbers)
    # notice!! jal overwrites $ra when you call the function

    # whats value of $s0 here???
    # even though print_numbers overwrote $s0 in its logic (line 50), it is backed up to the stack on line 48 and restored on line 78 so the value of $s0 remains 42.

    # clean up stack frame
    lw   $ra, 0($sp)   # restore $ra
    addi $sp, $sp, 4   # restore sp (opposite of line 7)

    li $v0, 0
    jr $ra # return 0

# function - prints 10 numbers from numbers array seperated by spaces
# NOTE: numbers provided as argument in register $a0
print_numbers:

    addi $sp, $sp, -8  # create stack frame
    sw   $ra, 0($sp)   # save return address
    sw   $s0, 4($sp)   # save $s0
   
    move $s0, $a0 # move $a0 into $s0 so we dont overwrite when doing syscalls
    # note im using $s0 for fun, could have just used a $t register
    
    li $t0, 0 # i = 0
while2:
    bge $t0, 10, end_while2 # if (i >= 10) goto end_while

    mul $t1, $t0, 4 # offset = i * 4
    add $t2, $s0, $t1 # $t2 = numbers + offset
    lw $t3, ($t2) # load integer from address numbers + offset

    li $v0, 1
    move $a0, $t3
    syscall # printf("%d")

    li $v0, 11
    li $a0, ' '
    syscall # putchar(' ')

    addi $t0, $t0, 1 # i++
    j while2
end_while2:

    li $v0, 11
    li $a0, 10 # '\n'
    syscall # putchar(' ')

    # clean up stack frame
    lw   $s0, 4($sp)   # restore $s0
    lw   $ra, 0($sp)   # restore $ra
    addi $sp, $sp, 8   # restore sp (opposite of line 46)

    jr  $ra # return