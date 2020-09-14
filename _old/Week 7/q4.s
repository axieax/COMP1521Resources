    .data
flag:
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.'
    .byte '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'

    .text
main:

    li $t0, 0 # row = 0
for1:
    bge $t0, 6, end_for1 # if (row >= 6) goto end_for1

    li $t1, 0 # col = 0
for2:
    bge $t1, 12, end_for2 # if (col >= 12) goto end_for2

    # offset = row * colSize + col
    mul $t2, $t0, 12 # offset = row * colSize
    add $t2, $t2, $t1 #      += colSize
    
    lb $t2, flag($t2)

    li $v0, 11
    move $a0, $t2
    syscall # putchar(flag[row][col]);

    addi $t1, $t1, 1 # col++
    j for2
end_for2:

    li $v0, 11
    li $a0, 10 # '\n'
    syscall # putchar('\n');

    addi $t0, $t0, 1 # row++
    j for1
end_for1:

    li   $v0, 0
    jr   $ra           # return 0