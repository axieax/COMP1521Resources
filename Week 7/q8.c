/* Write a C program, first_line.c, which is given 1 command-line argument which is the name of a file.
It should print the first line of the file to stdout.

It should print suitable error messages if given an incorrect number of arguments or if there is an
 error opening the file. */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {

    if (argc != 2) {
        printf("u wot m8 wrong number of arguments gg\n");
        return 1;
    }

    FILE* f = fopen(argv[1], "r");
    if (f == NULL) {
        perror("File failed to open...");
        return 1;
    }

    int c;
    while ((c = fgetc(f)) != EOF) {
      //  putchar(c);
        fputc(c, stdout);

        if (c == '\n') break;
    }

    return 0;
}