#include <stdio.h>

void print_numbers(int *numbers);

int main(void) {
    int i;
    int numbers[10] = {0,1,2,3,4,5,6,7,8,9};

    i = 0;
    while (i < 5) {
        int x = numbers[i];
        int y = numbers[9 - i];
        numbers[i] = y;
        numbers[9 - i] = x;
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