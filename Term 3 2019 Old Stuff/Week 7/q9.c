/* Write a C program, write_line.c, which is given 1 command-line argument which is the name of a file.
It should read a line from stdin and write to the specified file.

If the file exists, it should be overwritten. */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {

    if (argc != 2) {
        printf("u wot m8 wrong number of arguments gg\n");
        return 1;
    }

    FILE* f = fopen(argv[1], "w");
    if (f == NULL) {
        perror("File failed to open...");
        return 1;
    }

    int c;
    while ((c = fgetc(stdin)) != EOF) {
      //  putchar(c);
        fputc(c, f);

        if (c == '\n') break;
    }

    return 0;
}