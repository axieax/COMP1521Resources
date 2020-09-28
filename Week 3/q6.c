#include <stdio.h>
#include <stdint.h>
#include <assert.h>

uint32_t six_middle_bits(uint32_t u)
{
    return (u >> 13) & 0x3F;
}

// E.g. if you had some binary number e.g.
// 0001 0011 0101 0111 1000 1111 1000 0001
//                 |     |
// middle 6 bits   111 100

int main()
{
    assert(six_middle_bits(0b00010011010101111000111110000001) == 0b111100);
    printf("All tests passed!\n");

    return 0;
}