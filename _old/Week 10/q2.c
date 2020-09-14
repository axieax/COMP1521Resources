// print $HOME/.diary to stdout

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
    char *home = getenv("HOME");
    if (home == NULL) {
        fprintf(stderr, "user does not have a home\n");
        return 1;
    }

    char *diary = "/.diary";
    int len = strlen(home) + strlen(diary) + 1;
    char diary_pathname[len];

    // /home/ryan/.diary
    snprintf(diary_pathname, len, "%s%s", home, diary);

    FILE* f = fopen(diary_pathname, "r");
    if (f == NULL) {
        perror("diary failed to open");
        return 1;
    }

    int ch;
    while ((ch = fgetc(f)) != EOF) {
        putchar(ch);
    }

    fclose(f);

    return 0;
}