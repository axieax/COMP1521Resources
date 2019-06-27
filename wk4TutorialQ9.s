#char *string = "....";
#char *s = &string[0];
#int   length = 0;
#while (*s != '\0') {
#   length++;  // increment length
#   s++;       // move to next char
#}

   .data
string:
   .asciiz "...."
msg:
   .asciiz "The length of the string is "

   .text
main:

   la   $t0, string     # s = &string[0];
   li   $t1, 0
while:
   lb   $t2, ($t0)      # if (*s == '\0') goto end_while
   beq  $t2, $0, end_while
 
   addi $t1, $t1, 1     # length++
   addi $t0, $t0, 1     # s++
   j    while           # goto while
end_while:
 
   # $t1 contains the length of the string now

   #print the msg string
   li $v0, 4
   la $a0, msg
   syscall

   #print the length of the string
   li $v0, 1
   move $a0, $t1
   syscall

   #print a newline character
   li $v0, 11
   li $a0, 10 # \n
   syscall

   jr $ra