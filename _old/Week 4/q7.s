    .data
n_equal:
    .asciiz "n  = "
n_fac_equal:
    .asciiz "n! = "
    
    .text
main:
    li $v0, 4
    la $a0, n_equal
    syscall # printf("n  = ")

    li $v0, 5
    syscall # scanf("%d", &n)
    # $v0 now contains scanned int

    li $t0, 1 # fac = 1
    li $t1, 1 # i = 1
    move $t2, $v0 # n (copy scanned int to $t2)
for:
    bgt $t1, $t2, end_for # if (i > n) goto end_for

    mul $t0, $t0, $t1 # fac = fac * i

    addi $t1, $t1, 1 # i++
    j for
end_for:

    li $v0, 4
    la $a0, n_fac_equal
    syscall # printf("n! = ")

    li $v0, 1
    move $a0, $t0
    syscall # printf("%d")

    li $v0, 11
    li $a0, 10 # '\n'
    syscall # putchar('\n')

    jr $ra # return