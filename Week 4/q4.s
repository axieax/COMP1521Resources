    .data
prompt: .asciiz "Enter a number: \n"
smallbig: .asciiz "small/big\n"
medium: .asciiz "medium"

    .text
main:
    li $v0, 4
    la $a0, prompt
    syscall # printf("Enter a number: ");

    li $v0, 5
    syscall
    move $t0, $v0 # scanf("%d", &x);

    # $t1 stores message
    la $t1, smallbig
    # char *message = "small/big\n";

if1:
    li $t2, 100
    ble $t0, $t2, endif # if (x <= 100) goto endif;
    li $t2, 1000
    bge $t0, $t2, endif # if (x >= 1000) goto endif;

    la $t1, medium
endif:

    li $v0, 4
    move $a0, $t1
    syscall

    jr $ra