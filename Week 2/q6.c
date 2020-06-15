#include <stdio.h>
#include <stdint.h>
#include <assert.h>

typedef uint32_t Word;

Word reverseBits(Word w)
{
    Word result = 0;
    for (int i = 0; i < 32; i++) {
        // Is the ith bit (from the left hand side) set?
        Word mask = 1u << (31 - i);
        if (w & mask) {
            // Now set the ith bit from the right hand side in result
            Word anotherMask = 1u << i;
            result = result | anotherMask;
        }
    }
    return result;
}

int main()
{
    assert(reverseBits(0b00000001001000110100010101100111) == 0b11100110101000101100010010000000);
    puts("All tests passed!");

    return 0;
}