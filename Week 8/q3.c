#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <error.h>
#include <err.h>

int main(int argc, char **argv)
{
    FILE *f = fopen("garbage file", "r");

    if (f == NULL)
    {
        // fprintf(stderr, "Oh no! %s\n", strerror(errno));
        perror("Something Bad Happened.");
        // err(1, NULL);
        // error(1, errno, NULL);

        printf("hello world\n");
    }
}