### COMP1521 19t2 ... Tutoral Week 5
### Question 5

## Global data
	.data
nrows:	.word 3
ncols:	.word 4
M:		.word 1, 2, 3, 4
		.word 3, 4, 5, 6
		.word 5, 6, 7, 8

### main() function
	.text
	.globl	main
main:
	# Set up stack frame
	sw	$fp, -4($sp)	# push $fp onto stack
	la	$fp, -4($sp)	# set up $fp for this function
	sw	$ra, -4($fp)	# save return address
	sw	$s0, -8($fp)	# save $s0
	addi	$sp, $sp, -12	# reset $sp to last pushed item

    lw $a0, nrows
    lw $a1, ncols
    la $a2, M
	li $a3, 2 # factor
    jal change

	# Display the new matrix
	lw $a0, nrows
    lw $a1, ncols
    la $a2, M
    jal displayMatrix

	# clean up stack frame
	lw	$s0, -8($fp)	# restore $s0 value
	lw	$ra, -4($fp)	# restore $ra for return
	la	$sp, 4($fp)	# restore $sp (remove stack frame)
	lw	$fp, ($fp)	# restore $fp (remove stack frame)

	li	$v0, 0
	jr	$ra		# return 0

### change() function
### $a0 has nrows
### $a1 has ncols
### $a2 has pointer to matrix
### $a3 has factor to multiply by
	.text
	.globl	change
change:
    # Set up stack frame
	sw	$fp, -4($sp)	# push $fp onto stack
	la	$fp, -4($sp)	# set up $fp for this function
	sw	$ra, -4($fp)	# save return address
	sw	$s0, -8($fp)	# save $s0
	addi	$sp, $sp, -12	# reset $sp to last pushed item

	li $t0, 0 # row = 0
for:
	bge $t0, $a0, end_for # condition
	li $t1, 0 # col = 0
inner_for:
	bge $t1, $a1, inner_end_for

	# we need to grab flag[row][col]
	# which is the same as flag[row * ncols + col]
	mul $t2, $t0, $a1 # row * ncols
	add $t2, $t2, $t1 # offset = row * ncols + col
	sll $t2, $t2, 2   # multiply offset by 4 (sll instruction bit shifts to the left by the specified amount)
	add $t2, $t2, $a2 # add offset to matrix pointer. This now stores &flag[row][col]
	
	# grab the value
	lw $t3, ($t2)

	#multiply it by the factor
	mul $t3, $t3, $a3

	# store the value in the same place
	sw $t3, ($t2)

	addi $t1, $t1, 1
	j inner_for
inner_end_for:

	addi $t0, $t0, 1 #increment
	j for #jumping back
end_for:

    # clean up stack frame
	lw	$s0, -8($fp)	# restore $s0 value
	lw	$ra, -4($fp)	# restore $ra for return
	la	$sp, 4($fp)	# restore $sp (remove stack frame)
	lw	$fp, ($fp)	# restore $fp (remove stack frame)
    jr	$ra

### displayMatrix() function
### prints a given 2D matrix
### $a0 has nrows
### $a1 has ncols
### $a2 has pointer to matrix
	.text
	.globl	displayMatrix
displayMatrix:
    # Set up stack frame
	sw	$fp, -4($sp)	# push $fp onto stack
	la	$fp, -4($sp)	# set up $fp for this function
	sw	$ra, -4($fp)	# save return address
	sw	$s0, -8($fp)	# save $s0 to use as ... int n
	addi	$sp, $sp, -12	# reset $sp to last pushed item

    # move the arguments
    move $t0, $a0 # $t0 = nrows
    move $t1, $a1 # $t1 = ncols
    move $t2, $a2 # $t2 = pointer to matrix

    li $t3, 0 # row = 0
displayMatrix_for:
    bge $t3, $t0, displayMatrix_end_for # if (row >= nrows) goto displayMatrix_end_for

    li $t4, 0 # col = 0
displayMatrix_inner_for:
    bge $t4, $t1, displayMatrix_inner_end_for # if (col >= ncols) goto displayMatrix_inner_end_for

    # printf("%d ", matrix[row][col]);
    # we need to grab this value matrix[row][col] somehow. MIPS stores arrays like flat 1D array.
    # we need to calculate row * ncols + col
    # then we can grab matrix[row * ncols + col]
    mul $t5, $t3, $t1 # row * ncols
    add $t5, $t5, $t4 # row * ncols + col
	li $t6, 4         # sizeof(int)
	mul $t5, $t5, $t6 # multiply by sizeof(int)

    add $t5, $t5, $t2 # add offset to matrix pointer to get matrix[row * ncols + col]
    lw $a0, ($t5)     # load the value at matrix[row * ncols + col]
    li $v0, 1
    syscall           # print the number

	# print a space
	li $v0, 11
    li $a0, 32 # ' '
    syscall

    addi $t4, $t4, 1 # col++
    j displayMatrix_inner_for
displayMatrix_inner_end_for:

	# print a newline
    li $v0, 11
    li $a0, 10 # '\n'
    syscall

    addi $t3, $t3, 1 # row++
    j displayMatrix_for
displayMatrix_end_for:

    # clean up stack frame
	lw	$s0, -8($fp)	# restore $s0 value
	lw	$ra, -4($fp)	# restore $ra for return
	la	$sp, 4($fp)	# restore $sp (remove stack frame)
	lw	$fp, ($fp)	# restore $fp (remove stack frame)
    jr	$ra