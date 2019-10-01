/*
Comp1521 Week 6 Tutorial
Simple program that writes some graphics structs to a file
 */
#include <stdio.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include "Graphics.h"

int main(void)
{
    /* Initialise an array of Graphics structs */
    Graphics a[5];
    a[0] = (Graphics){1, 2, 3, 4, 5};
    a[1] = (Graphics){6, 5, 4, 100, 50};
    a[2] = (Graphics){255, 255, 255, 50, 60};
    a[3] = (Graphics){9, 10, 21, 99};
    a[4] = (Graphics){5, 68, 1, 2, 3};

    /* Open a new file for WRITING. If they file already exists, truncate it. If the file does not exist, create a new one. */
    int fd = open("GraphicsFile", O_WRONLY | O_TRUNC | O_CREAT);
    if (fd < 0)
    {
        perror("Opening file failed");
        return 1;
    }

    /* Write each Graphics in the array to the file */
    for (int i = 0; i < 5; i++)
    {
        write(fd, &a[i], sizeof(Graphics));
    }

    /* Alternative Faster way - just write the whole array */
    //write(fd, a, sizeof(Graphics) * 5);

    /* Remember to close the file descriptor! */
    close(fd);

    return 0;
}