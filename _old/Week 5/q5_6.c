#include <stdio.h>

// Combined q5 and q6
// Slightly modified to show how you can call functions and pass arguments

void print_numbers(int *numbers);

int main(void) {
    int i;
    int numbers[10];

    i = 0;
    while (i < 10) {
        scanf("%d", &numbers[i]);
        i++;
    }

    print_numbers(numbers);
}

void print_numbers(int *numbers) {
    int i;

    i = 0;
    while (i < 10) {
        printf("%d ", numbers[i]);
        i++;
    }

    putchar('\n');
}