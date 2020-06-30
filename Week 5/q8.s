    .data
numbers:
    .word 0 1 2 3 4 5 6 7 8 9

    .text
main:
    addi $sp, $sp, -4  # create stack frame
    sw   $ra, 0($sp)   # save return address

    li $t0, 0 # i = 0
while1:
    bge $t0, 5, end_while1 # if (i >= 10) goto end_while
    
    # load x
    mul $t1, $t0, 4 # 4 * i
    lw $t2, numbers($t1) # load word from memory address numbers + 4*i

    # load y
    li $t3, 9
    sub $t3, $t3, $t0 # 9 - i
    mul $t3, $t3, 4 # 4*(9-i)
    lw $t4, numbers($t3) # load word from memory address numbers + 4*(9-i)

    # numbers[i] = y
    sw $t4, numbers($t1)

    # numbers[9-i] = x
    sw $t2, numbers($t3)

    addi $t0, $t0, 1 # i++
    j while1
end_while1:

    la $a0, numbers
    jal print_numbers # print_numbers(numbers)
    # notice!! jal overwrites $ra when you call the function

    # clean up stack frame
    lw   $ra, 0($sp)   # restore $ra
    addi $sp, $sp, 4   # restore sp

    li $v0, 0
    jr $ra # return 0

# function - prints 10 numbers from numbers array seperated by spaces
# NOTE: numbers provided as argument in register $a0
print_numbers:

    addi $sp, $sp, -8  # create stack frame
    sw   $ra, 0($sp)   # save return address
    sw   $s0, 4($sp)   # save return address
   
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
    lw   $s0, 4($sp)
    lw   $ra, 0($sp)   # restore $ra
    addi $sp, $sp, 8   # restore sp

    jr  $ra # return