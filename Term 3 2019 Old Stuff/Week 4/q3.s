    .data
prompt: .asciiz "Enter a number: \n"
sqr2big: .asciiz "square too big for 32 bits\n"
newline: .asciiz "\n"

    .text
main:
    li $v0, 4
    la $a0, prompt
    syscall # printf("Enter a number: ");

    li $v0, 5
    syscall
    # result in $v0 now
    move $t0, $v0 # scanf("%d", &x);

if1:
    li $t2, 46340
    ble $t0, $t2, else1 # if (x <= 46340) goto else1;

    li $v0, 4
    la $a0, sqr2big
    syscall

    j endif
else1:
    mul $t1, $t0, $t0, # y = x * x
    li $v0, 1
    move $a0, $t1
    syscall #printf("%d", y);

    li $v0, 4
    la $a0, newline
    syscall #prinf("\n")
endif:

    jr $ra