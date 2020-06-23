    .text
main:
    
    li $t0, 24 # x = 24
for1:
    bge $t0, 42, end_for1

    li $v0, 1
    move $a0, $t0
    syscall # printf("%d")

    li $v0, 11
    li $a0, 10 # '\n'
    syscall # putchar('\n')

    addi $t0, $t0, 3 # x = x + 3
    b for1
end_for1:

    jr $ra # return