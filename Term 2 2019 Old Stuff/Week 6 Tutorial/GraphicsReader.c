/*
Comp1521 Week 6 Tutorial
Simple program that reads some graphics structs from a file and displays them
 */
#include <stdio.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include "Graphics.h"

int main(void)
{
    /* Open a new file for READING.*/
    int fd = open("GraphicsFile", O_RDONLY);
    if (fd < 0)
    {
        perror("Opening file failed");
        return 1;
    }

    Graphics g;
    while (read(fd, &g, sizeof(Graphics)) > 0)
    {
        printf("Graphics Struct = {%d, %d, %d, %d, %d}\n", g.x, g.y, g.r, g.g, g.b);
    }

    /* Remember to close the file descriptor! */
    close(fd);

    return 0;
}