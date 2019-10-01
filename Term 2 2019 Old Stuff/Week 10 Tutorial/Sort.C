#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Node
{
    char name[BUFSIZ];
    int value;
};

void printArray(struct Node *array, int size)
{
    for (int i = 0; i < size; i++)
    {
        printf("{name = %s, value = %d}\n", array[i].name, array[i].value);
    }
}

int compare(const void *a, const void *b)
{
    struct Node *ptrA = (struct Node *)a;
    struct Node *ptrB = (struct Node *)b;

    /* Sort by value then by name. */
    if (ptrA->value != ptrB->value)
    {
        return ptrA->value - ptrB->value;
    }
    else
    {
        return strcmp(ptrA->name, ptrB->name);
    }
}

int main(void)
{
    struct Node array[] = {
        {.name = "Batman", .value = 5},
        {.name = "Superman", .value = 5},
        {.name = "Martian Manhunter", .value = 3},
        {.name = "The Flash", .value = 5},
        {.name = "Wonder Woman", .value = 1},
        {.name = "Hawkgirl", .value = 4}
    };

    qsort(array, 6, sizeof(struct Node), compare);

    printArray(array, 6);

    return 0;
}