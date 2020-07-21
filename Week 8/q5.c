/* Write a C program, write_line.c, which is given 1 command-line argument which is the name of a file.
It should read a line from stdin and write to the specified file.

If the file exists, it should be overwritten. */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    FILE* f = fopen(argv[1], "w");
    if (f == NULL) {
        perror(argv[1]);
        return 1;
    }

    int ch;
    while ((ch = fgetc(stdin)) != EOF) {
        fputc(ch, f);

        if (ch == '\n') break;
    }

    fclose(f);

    return 0;
}