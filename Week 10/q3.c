// read 32-byte hexadecimal numbers from a file
// and print low (least significant) byte
// as a signed decimal number (-128..127)

#include <stdio.h>
#include <stdint.h>

#define BYTE_MASK 0xFF

int main(int argc, char *argv[])
{
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <file>\n", argv[0]);
        return 1;
    }

    FILE *f = fopen(argv[1], "r");
    if (f == NULL) {
        perror(argv[1]);
        return 1;
    }

    int32_t num;
    while (fscanf(f, "%x", &num) != EOF) {
        int8_t cutted_num = num & BYTE_MASK; // 1111 1111
        printf("%d\n", cutted_num);
    }

    fclose(f);

    return 0;
}