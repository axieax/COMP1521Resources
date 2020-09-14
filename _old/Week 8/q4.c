/* Write a C program, first_line.c, which is given 1 command-line argument which is the name of a file.
It should print the first line of the file to stdout.

It should print suitable error messages if given an incorrect number of arguments or if there is an
 error opening the file. */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    FILE* f = fopen(argv[1], "r");
    if (f == NULL) {
        perror(argv[1]);
        return 1;
    }

    /*
    char buffer[BUFSIZ];
    fgets(buffer, BUFSIZ, f);
    // printf("%s", buffer);
    // fputs(buffer, stdout); // gives extra new line
    // puts(buffer);  // gives extra new line
    */

    int ch;
    while ((ch = fgetc(f)) != EOF) {
        fputc(ch, stdout);
        // putchar(ch);
        // printf("%c", ch);
        // fprintf(stdout, "%c", ch);

        if (ch == '\n') break;
    }

    fclose(f);

    return 0;
}