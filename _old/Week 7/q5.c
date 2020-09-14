#include <stdio.h>
#define NROWS 3
#define NCOLS 4

void change(int nrows, int ncols, int M[nrows][ncols], int factor);

int main(void)
{
    int matrix[NROWS][NCOLS] = {
        {0, 1, 2, 3},
        {4, 5, 6, 7},
        {8, 9, 10, 11}};

    change(NROWS, NCOLS, matrix, 42);

    for (int i = 0; i < NROWS; i++)
    {
        for (int j = 0; j < NCOLS; j++)
        {
            printf("%d ", matrix[i][j]);
        }

        putchar('\n');
    }

    return 0;
}

void change(int nrows, int ncols, int M[nrows][ncols], int factor)
{
    for (int row = 0; row < nrows; row++)
    {
        for (int col = 0; col < ncols; col++)
        {
            M[row][col] = factor * M[row][col];
        }
    }
}