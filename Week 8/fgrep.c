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

    
    return 0;
}

// print all lines which have search_for as substring in the file
// in this format: stream_name:line_number:line
// hint: USE strstr
void search_stream(FILE *stream, char stream_name[], char search_for[])
{
}