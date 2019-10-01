#include <stdio.h>

int a[] = {1, 2, 3, 4, 5};
int length = 5;

int max(int a[], int length)
{
    if (length == 1)
    {
        return a[0];
    }
    else
    {
        // find max value in rest of array
        int max_so_far = max(&a[1], length - 1);

        // check if it's bigger than the first element
        if (a[0] > max_so_far)
        {
            return a[0];
        }
        else
        {
            return max_so_far;
        }
    }
}

int main(void)
{
    int size = max(a, length);
    printf("The max value in the array is: %d\n", size);
    return 0;
}