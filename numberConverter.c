#include <stdio.h>
#include <stdint.h>
#include <stdbool.h> // <---- include this for booleans in C !

void printBinary(uint32_t number)
{
    printf("Binary = ");
    uint32_t mask = 1u << (sizeof(uint32_t) * 8 - 1); // This is binary number 1000 0000 0000 0000 0000 0000 0000 0000
    bool isFound = false;                             // This variable indicates if we have reached a 1, to prevent printing leading zeroes.

    for (int i = 0; i < sizeof(uint32_t) * 8; i++)
    {
        if (mask & number)
        {
            putchar('1');
            isFound = true;
        }
        else if (isFound)
        {
            putchar('0');
        }

        mask = mask >> 1;
    }

    if (!isFound)
    {
        putchar('0'); // The case where the entire number is 0, just print 0.
    }

    putchar('\n');
}

int main()
{
    int number = 42; // Decimal
    //int number = 0x2A;      // Hexadecimal - put 0x in front
    //int number = 052;       // Octal - put 0 in front
    //int number = 0b101010;  // Binary - put 0b in front

    printf("Decimal = %d\n", number);
    printf("Hexadecimal = %x\n", number);
    printf("Octal = %o\n", number);
    printBinary(number);
}