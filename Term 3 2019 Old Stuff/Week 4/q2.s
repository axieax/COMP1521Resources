.data
prompt: .asciiz "Enter a number: "
newline: .asciiz "\n"

.text
main:
     # x is $t0
     # y is $t1

    la $a0, prompt
    li $v0, 4
    syscall
    # printf("Enter a number: ");

    li $v0, 5
    syscall #scanf("%d", &x);
    # $v0 contains scanned number    

    move $t0, $v0

    mul $t1, $t0, $t0 # y = x * x

    li $v0, 1
    move $a0, $t1
    syscall #printf("%d", y);

    li $v0, 4
    la $a0, newline
    syscall #prinf("\n")

    jr $ra # return