	.data
M:	.word 1, 2, 3, 4
	.word 3, 4, 5, 6
	.word 5, 6, 7, 8

    .text

# void change (int nrows, int ncols, int M[nrows][ncols], int factor)
change:

    jr $ra

main:
    addi $sp, $sp, -4  # create stack frame
    sw   $ra, 0($sp)   # save return address

    li   $a0, 3
    li   $a1, 4
    la   $a2, M
    li   $a3, 2
    jal  change

                       # clean up stack frame
    lw   $ra, 0($sp)   # restore $ra
    addi $sp, $sp, 4   # restore sp

    li $v0, 0
    jr $ra