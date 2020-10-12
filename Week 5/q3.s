Address       Data Definition
0x10010000    aa:  .word 42
0x10010004    bb:  .word 666 
0x10010008    cc:  .word 1
0x1001000C         .word 3
0x10010010         .word 5
0x10010014         .word 7

la   $t0, aa
# $t0 = 0x10010000

lw   $t0, bb
# $t0 = 666

lb   $t0, bb
# 666 in binary is 0000 0000 0000 0000 0000 0010 1001 1010
# $t0 = 1111 1111 1111 1111 1111 1111 1001 1010

lw   $t0, aa+4
# $t0 = 666

la   $t1, cc
# lw $t0, 0x10010008
lw   $t0, ($t1)
# $t1 = 0x10010008
# $t0 = 1

la   $t1, cc
lw   $t0, 8($t1)
# $t1 = 0x10010008
# 8($t1) == 8 + 0x10010008 = 0x10010010
# $t0 = 5

li   $t1, 8
lw   $t0, cc($t1)
# cc($t1) == 0x10010008 + 8 = 0x10010010
# $t0 = 5

la   $t1, cc
lw   $t0, 2($t1)
# $t1 = 0x10010008
# 8($t1) == 2 + 0x10010008 = 0x1001000A
# 0x1001000A not 4-byte aligned, crash!!!