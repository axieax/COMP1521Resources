### COMP1521 19t2 ... Tutoral Week 5
### Question 4

## Global data
	.data
nrows:	.word 6
ncols:	.word 12
flag:	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'

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
    la $a2, flag
    jal displayFlag

	# clean up stack frame
	lw	$s0, -8($fp)	# restore $s0 value
	lw	$ra, -4($fp)	# restore $ra for return
	la	$sp, 4($fp)	# restore $sp (remove stack frame)
	lw	$fp, ($fp)	# restore $fp (remove stack frame)

	li	$v0, 0
	jr	$ra		# return 0

### displayFlag() function
### $a0 has nrows
### $a1 has ncols
### $a2 has pointer to flag 2d array
	.text
	.globl	displayFlag
displayFlag:
    # Set up stack frame
	sw	$fp, -4($sp)	# push $fp onto stack
	la	$fp, -4($sp)	# set up $fp for this function
	sw	$ra, -4($fp)	# save return address
	sw	$s0, -8($fp)	# save $s0
	addi	$sp, $sp, -12	# reset $sp to last pushed item

    # move the arguments
    move $t0, $a0 # $t0 = nrows
    move $t1, $a1 # $t1 = ncols
    move $t2, $a2 # $t2 = pointer to flag 2d array

	li $t3, 0 # row = 0
for:
	bge $t3, $t0, end_for # condition
	li $t4, 0 # col = 0
inner_for:
	bge $t4, $t1, inner_end_for

	# we need to grab flag[row][col]
	# which is the same as flag[row * ncols + col]
	mul $t5, $t3, $t1 # row * ncols
	add $t5, $t5, $t4 # row * ncols + col
	add $t5, $t5, $t2

	# print 
	lb $a0, ($t5)
	li $v0, 11
	syscall

	addi $t4, $t4, 1
	j inner_for
inner_end_for:

	li $a0, 10 # '\n'
	li $v0, 11 
	syscall

	addi $t3, $t3, 1 #increment
	j for #jumping back
end_for:

    # clean up stack frame
	lw	$s0, -8($fp)	# restore $s0 value
	lw	$ra, -4($fp)	# restore $ra for return
	la	$sp, 4($fp)	# restore $sp (remove stack frame)
	lw	$fp, ($fp)	# restore $fp (remove stack frame)
    jr	$ra