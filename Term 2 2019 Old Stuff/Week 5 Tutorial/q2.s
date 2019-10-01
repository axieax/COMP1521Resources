### COMP1521 19t2 ... Tutoral Week 5
### Question 2

## Global data
	.data
a:  
    .word 1, 2, 3, 4, 5
length: 
    .word 5
msg:
    .asciiz "The max value in the array is: "

### main() function
	.text
	.globl	main
main:
	# Set up stack frame
	sw	$fp, -4($sp)	# push $fp onto stack
	la	$fp, -4($sp)	# set up $fp for this function
	sw	$ra, -4($fp)	# save return address
	sw	$s0, -8($fp)	# save $s0 to use as ... int n
	addi	$sp, $sp, -12	# reset $sp to last pushed item

	# code for main()
	la $a0, a
    lw $a1, length
    jal max
    # $v0 now stores the max value in the array
    # move it to $t0 so we don't lose it
    move $t0, $v0

    #print message string
    li $v0, 4
    la $a0, msg
    syscall

    #print the max that we calculated
    li $v0, 1
    move $a0, $t0
    syscall 

    #print newline char
    li $v0, 11
    li $a0, 10
    syscall

	# clean up stack frame
	lw	$s0, -8($fp)	# restore $s0 value
	lw	$ra, -4($fp)	# restore $ra for return
	la	$sp, 4($fp)	# restore $sp (remove stack frame)
	lw	$fp, ($fp)	# restore $fp (remove stack frame)

	li	$v0, 0
	jr	$ra		# return 0


### max() function
# $a0 contains pointer to array
# $a1 contains length
	.text
	.globl	max
max:
    # Set up stack frame
	sw	$fp, -4($sp)	# push $fp onto stack
	la	$fp, -4($sp)	# set up $fp for this function
	sw	$ra, -4($fp)	# save return address
	sw	$s0, -8($fp)	# save $s0 to use as ... int n
	addi	$sp, $sp, -12	# reset $sp to last pushed item

if:
    li $t0, 1
    bne $a1, $t0, else
    lw $v0, ($a0)
    j end_if
else:
    move $s0, $a0 # store a into $s0
    addi $a0, $a0, 4
    addi $a1, $a1, -1
    jal max
    # $v0 will now contain max_so_far

if2:
    lw $t0, ($s0) # grab a[0]
    ble $t0, $v0, else2
    lw $v0, ($s0)
else2:
    # $v0 already contains max_so_far, so fall through
end_if2:

end_if:


    # clean up stack frame
	lw	$s0, -8($fp)	# restore $s0 value
	lw	$ra, -4($fp)	# restore $ra for return
	la	$sp, 4($fp)	# restore $sp (remove stack frame)
	lw	$fp, ($fp)	# restore $fp (remove stack frame)
	jr	$ra		# return 0