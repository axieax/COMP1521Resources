    .text
main:

    li $t0, 1 # i = 1
for1:
    bgt $t0, 10, end_for1 # if (i > 10) goto end_for1

    li $t1, 0 # j = 0
for2:
    bge $t1, $t0, end_for2 # if (j >= i) goto end_for2

    li $v0, 11
    li $a0, '*'
    syscall # putchar('*')

    addi $t1, $t1, 1 # j++
    j for2
end_for2:

    li $v0, 11
    li $a0, 10 # '\n'
    syscall # putchar('\n')

    addi $t0, $t0, 1 # i++
    j for1
end_for1:

    jr $ra # return