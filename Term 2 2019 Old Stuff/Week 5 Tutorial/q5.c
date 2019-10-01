#include <stdio.h>

int nrows = 3;
int ncols = 4;
int matrix[3][4] = {{1, 2, 3, 4},
                    {3, 4, 5, 6},
                    {5, 6, 7, 8}};

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

void displayMatrix(int nrows, int ncols, int M[nrows][ncols])
{
    for (int row = 0; row < nrows; row++)
    {
        for (int col = 0; col < ncols; col++)
        {
            printf("%d ", M[row][col]);
        }

        putchar('\n');
    }
}

int main(void)
{
    change(nrows, ncols, matrix, 2);
    displayMatrix(nrows, ncols, matrix);
    return 0;
}