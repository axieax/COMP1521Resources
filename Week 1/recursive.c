#include <stdio.h>

void f(int* nums, int i) {
    if (i == 10) {
        return;
    }

    printf("%d\n", nums[i]);
    f(nums, i+1);
}

int main()
{
    int nums[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    f(nums, 0);

    return 0;
}