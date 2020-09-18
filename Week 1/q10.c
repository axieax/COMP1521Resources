#include <stdio.h>

void print_array(int nums[], int i)
{
    if (i == 10)
        return;

    printf("%d\n", nums[i]);
    print_array(nums, i + 1);
}

int main(void)
{
    int nums[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    print_array(nums, 0);
    return 0;
}