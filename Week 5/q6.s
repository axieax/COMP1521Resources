    .data
numbers: .word 0 1 2 3 4 5 6 7 8 9 10

    .text
main:

    # let $t0 be i

    li $t0, 0 #I = 0
while:
    bge $t0, 10, end_while

    mul $t1, $t0, 4 # i * 4
    lw $a0, numbers($t1) 

    li $v0, 1
    syscall

    li $a0, 10 # '\n'
    li $v0, 11
    syscall

    addi $t0, $t0, 1
    j while
end_while:

    jr $ra