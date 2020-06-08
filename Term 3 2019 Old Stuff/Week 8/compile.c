#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <spawn.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>

char* C_COMPILER = "/usr/bin/gcc";

void process_file(char *c_file);
char *get_binary_name(char *c_file);

int main(int argc, char *argv[])
{
    for (int arg = 1; arg < argc; arg++)
    {
        process_file(argv[arg]);
    }
    return 0;
}

// compile a C file
void process_file(char *c_file)
{
    char *binary = get_binary_name(c_file);
    // gcc -Wall -Werror myProgram.c -o myProgram
    char *argv[] = {C_COMPILER, "-Wall", "-Werror", c_file, "-o", binary, NULL};

    extern char **environ;
    pid_t pid;
    int err = posix_spawn(&pid, C_COMPILER, NULL, NULL, argv, environ);
    if (err) {
        perror("Spwan failed");
        exit(1);
    }

    printf("Compiling %s...\n", c_file);

    waitpid(pid, NULL, 0);

    free(binary);
}

// give a string ending in .c
// return malloc-ed copy of string without .c
char *get_binary_name(char *c_file)
{
    char *binary = strdup(c_file);

    for (int i = 0; i < strlen(binary); i++) {
        if (binary[i] == '.') {
            binary[i] = '\0';
            return binary;
        }
    }

    // Shouldnt reach here
    printf("Binary name failed\n"); exit(1);
}