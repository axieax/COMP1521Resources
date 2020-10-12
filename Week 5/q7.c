#include <stdio.h>

void print_numbers(int *numbers);

int main(void) {
    int i;
    int numbers[10] = {0,1,2,-3,4,-5,6,-7,8,9};

    i = 0;
    while (i < 10) {
        if (numbers[i] < 0) {
            numbers[i] += 42;
        }
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