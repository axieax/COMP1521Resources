#int x;      // assume 4 bytes
#int  y;     // assume 4 bytes
#scanf("%d", &y);
#x = (y + 2000) * (y + 3000);

# Please note this we declared x as an integer, rather than a long
# so that it is easy to print.
# Look at the tutorial solutions for how to work with longs.

	.data
x: .space 4 # malloc(4)
y: .space 4

	.text
main:
	#scan an integer
	li $v0, 5
	syscall

	#result now in $v0
	#we want to move $v0 into x
	sw $v0, x

	move $t0, $v0
	addi $t1, $t0, 2000 # $t1 = y + 2000
	addi $t2, $t0, 3000 # $t2 = y + 3000

	#now we need to multiply them to get the result
	mul  $t1, $t1, $t2 # $t1 = $t1 * $t2

	sw $t1, y #store result in y

	#print the result
	li $v0, 1
	move $a0, $t1
	syscall

	#print a newline character
	li $v0, 11
	li $a0, 10 # \n
	syscall

	jr $ra