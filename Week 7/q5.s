    .data
NROWS:
    .word 3
NCOLS:
    .word 4
matrix:
    .word 0 1 2 3
    .word 4 5 6 7
    .word 8 9 10 11

    .text
main:
    addi $sp, $sp, -4  # create stack frame
    sw   $ra, 0($sp)   # save return address

    lw $a0, NROWS
    lw $a1, NCOLS
    la $a2, matrix
    li $a3, 42
    jal change         # change(NROWS, NCOLS, matrix, 42)

    li $t0, 0          # i = 0
for_i:
    lw $t1, NROWS
    bge $t0, $t1, end_for_i # if (i >= NROWS) goto end_for_i

    li $t1, 0          # j = 0
for_j:
    lw $t2, NCOLS
    bge $t1, $t2, end_for_j # if (j >= NCOLS) goto end_for_j

    mul $t2, $t0, $t2  # offset = i * NCOLS
    add $t2, $t2, $t1  #       += j
    mul $t2, $t2, 4    #       *= 4
    lw $a0, matrix($t2) # load from matrix[i][j]
    li $v0, 1         
    syscall            # printf("%d", matrix[i][j]);

    li $a0, ' '
    li $v0, 11
    syscall            # putchar(' ')

    addi $t1, $t1, 1
    j for_j
end_for_j:
    li $a0, 10         # '\n'
    li $v0, 11
    syscall            # putchar('\n'); 

    addi $t0, $t0, 1
    j for_i
end_for_i:
                       # clean up stack frame
    lw   $ra, 0($sp)   # restore $ra
    addi $sp, $sp, 4   # restore sp

    li   $v0, 0
    jr   $ra           # return 0

    # void change(int nrows, int ncols, int M[nrows][ncols], int factor)
    # $a0 is int nrows
    # $a1 is int ncols
    # $a2 is int** M
    # $a3 is factor
change:

    jr $ra