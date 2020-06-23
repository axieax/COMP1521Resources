.data
msg: .asciiz "Enter a number: "
too_big_msg: .asciiz "square too big for 32 bits\n"

.text
main:
    # let $t0 store x
    # let $t1 store y

    li $v0, 4
    la $a0, msg
    syscall # printf("Enter a number: ");

    li $v0, 5
    syscall

    # NOW in $v0, the scanned number is stored
    move $t0, $v0 

if1:
    ble $t0, 46340, else1 # if (x <= 46340) goto else1;

    li $v0, 4
    la $a0, too_big_msg
    syscall # printf("square too big for 32 bits\n");
    
    b end_if1
else1:
    mul $t1, $t0, $t0 # y = x * x

    li $v0, 1
    move $a0, $t1
    syscall # printf("%d")

    li $v0, 11
    li $a0, 10 # '\n'
    syscall # putchar('\n')

end_if1:

    jr $ra # return