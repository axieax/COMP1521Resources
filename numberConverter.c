#include <stdio.h>
#include <stdbool.h> // <---- include this for booleans in C !

void printBinary(int number)
{
    printf("Binary = ");
    unsigned int mask = 1 << (sizeof(int) * 8 - 1); // This is binary number 1000 0000 0000 0000 0000 0000 0000 0000
    bool found = false;                             // This variable indicates if we have reached a 1, to prevent printing leading zeroes.

    for (int i = 0; i < sizeof(int) * 8; i++)
    {
        if ((mask & number) != 0)
        {
            putchar('1');
            found = true;
        }
        else if (found)
        {
            putchar('0');
        }

        mask = mask >> 1;
    }

    if (!found)
    {
        putchar('0'); // The case where the entire number is 0, just print 0.
    }

    putchar('\n');
}

int main(void)
{
    int number = 42;          // Decimal
    //int number = 0x2A;      // Hexadecimal - put 0x in front
    //int number = 052;       // Octal - put 0 in front
    //int number = 0b101010;  // Binary - put 0b in front

    printf("Decimal = %d\n", number);
    printf("Hexadecimal = %x\n", number);
    printf("Octal = %o\n", number);
    printBinary(number);
}