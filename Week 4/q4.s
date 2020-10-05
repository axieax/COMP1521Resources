    .data
msg: 
    .asciiz "Enter a number: "
medium_msg: 
    .asciiz "medium\n"
small_big_msg: 
    .asciiz "small/big\n"

    .text
main:
    li $v0, 4
    la $a0, msg
    syscall # printf("Enter a number: ");

    li $v0, 5
    syscall # scanf("%d", &x);

if:
    ble $v0, 100, else # if (x <= 100)
    bge $v0, 1000, else # if (x >= 1000)

    li $v0, 4
    la $a0, medium_msg
    syscall # printf("medium\n")

    j end_if
else:
    li $v0, 4
    la $a0, small_big_msg
    syscall # printf("small/big\n")
end_if:

    jr $ra # return