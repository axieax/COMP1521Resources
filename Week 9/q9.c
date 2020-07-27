// Print lines containing  specified substring from the files specified as arguments

#include <stdio.h>
#include <string.h>

#define MAX_LINE 65536

void search_stream(FILE *stream, char stream_name[], char search_for[]);

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        fprintf(stderr, "Usage: %s <prefix> <files>\n", argv[0]);
        return 1;
    }
    if (argc == 2)
    {
        search_stream(stdin, "<stdin>", argv[1]);
    }
    else
    {
        for (int argument = 2; argument < argc; argument = argument + 1)
        {
            FILE *in = fopen(argv[argument], "r");
            if (in == NULL)
            {
                fprintf(stderr, "%s: ", argv[0]);
                perror(argv[argument]);
                return 1;
            }

            search_stream(in, argv[argument], argv[1]);
        }
    }

    return 0;
}

void search_stream(FILE *stream, char stream_name[], char search_for[])
{
    char line[MAX_LINE];

    int line_number = 1;
    while (fgets(line, MAX_LINE, stream) != NULL)
    {
        if (strstr(line, search_for) != NULL)
        {
            printf("%s:%d:%s", stream_name, line_number, line);
        }
        line_number = line_number + 1;
    }
}