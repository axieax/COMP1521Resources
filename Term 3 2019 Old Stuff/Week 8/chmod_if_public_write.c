// remove public write from specified as command line arguments if needed

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

void chmod_if_needed(char *pathname);

int main(int argc, char *argv[])
{
    for (int i = 1; i < argc; i++) {
        chmod_if_needed(argv[i]);
    }
    return 0;
}

// chmod a file if publically-writeable
void chmod_if_needed(char *pathname)
{
    struct stat s;
    int err = stat(pathname, &s);
    if (err) {
        perror("Stat failed");
        exit(1);
    }

    // Check if file is already not publically writeable
    if (!(s.st_mode & S_IWOTH)) {
        printf("%s is not publically writeable\n", pathname);
        return;
    }

    printf("removing public write from %s\n", pathname);

    err = chmod(pathname, s.st_mode & ~S_IWOTH);
    if (err == -1) {
        perror("Chmod failed");
        exit(1);
    }
}