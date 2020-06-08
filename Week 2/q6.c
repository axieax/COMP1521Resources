#include <stdio.h>
#include <stdint.h>
#include <assert.h>

typedef unsigned int Word;

Word reverseBits(Word w)
{
    Word result = 0;
    return result;
}

int main()
{
    assert(reverseBits(0b00000001001000110100010101100111) == 0b11100110101000101100010010000000);
    puts("All tests passed!");

    return 0;
}