    .data
numbers: .word 0 0 0 0 0 0 0 0 0 0

    .text
main:

    # let $t0 be i

    li $t0, 0 #I = 0
while:
    bge $t0, 10, end_while

    li $v0, 5
    syscall
    # result is in $v0

    # lets calculate numbers + 4 * i
    mul $t1, $t0, 4 # i * 4
   # la $t2, numbers
   # add $t3, $t2, $t1

    sw $v0, numbers($t1)

    addi $t0, $t0, 1
    j while
end_while:

    jr $ra