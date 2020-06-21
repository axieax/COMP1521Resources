.data
msg: .asciiz "Coming soon...\n"

.text
main:
    li $v0, 4
    la $a0, msg
    syscall

    jr $ra # return