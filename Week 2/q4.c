#include <stdio.h>

#define READING 0x01
#define WRITING 0x02
#define AS_BYTES 0x04
#define AS_BLOCKS 0x08
#define LOCKED 0x10

int main()
{
    unsigned char device;

    // a
    device = READING | LOCKED | AS_BYTES;

    // b
    device = ;

    // c
    device = ;

    // d
    device = ;

    // e
    device = ;
}