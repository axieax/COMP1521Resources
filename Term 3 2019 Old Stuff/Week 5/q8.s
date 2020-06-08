    .data
numbers: .word 0 1 2 3 4 5 6 7 8 9

    .text
main:

    li $t0, 0 # i = 0
while:
    bge $t0, 5, end_while # while (i < 5) {

    mul $t1, $t0, 4
    lw $t3, numbers($t1) #x

    li $t2, 9
    sub $t2, $t2, $t0 # $t2 = 9 - i
    mul $t2, $t2, 4
    lw $t4, numbers($t2) #y

    # $t1 = 4*i
    # $t2 = 4*(9-i)
    # $t3 = x
    # $t4 = y

    sw $t4, numbers($t1) # numbers[i] = y;
    sw $t3, numbers($t2) # numbers[9 - i] = x;

    addi $t0, $t0, 1 # i++
    j while
end_while:

    jr $ra