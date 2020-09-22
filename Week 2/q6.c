#include <stdio.h>
#include <stdint.h>
#include <assert.h>

typedef uint32_t Word;

Word reverseBits(Word w)
{
    Word result = 0;
    for (int i = 0; i < 32; i++) {
        // Check ith bit from LHS of w is set to 1
        Word mask = 1u << (31 - i);
        if (mask & w) {
            Word anotherMask = 1u << i;
            result |= anotherMask;
        }
    }
    return result;
}

int main()
{
    assert(reverseBits(0b00000001001000110100010101100111) == 0b11100110101000101100010010000000);
    printf("All tests passed!\n");

    return 0;
}