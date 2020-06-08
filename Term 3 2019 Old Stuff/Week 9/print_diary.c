// print $HOME/.diary to stdout

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char** argv)
{
    char* home_directory = getenv("HOME");
    if (home_directory == NULL) {
        perror("HOME");
        return 1;
    }

    // $HOME/.diary
    char* basename = ".diary";
    int length = strlen(home_directory) + strlen(basename) + 2;
    char resultPath[length];
    snprintf(resultPath, length, "%s/%s", home_directory, basename);

    // resultPath = $HOME/.diary
    FILE* f = fopen(resultPath, "r");
    if (f == NULL) {
        perror(resultPath);
        return 1;
    }

    char c;
    while (fscanf(f, "%c", &c) == 1) {
        printf("%c", c);
    }

    fclose(f);

    return EXIT_SUCCESS;
}