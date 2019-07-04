#include <stdio.h>

int nrows = 6;
int ncols = 12;
char flag[6][12] = {{'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
                    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
                    {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
                    {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
                    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
                    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'}};

void displayFlag(int nrows, int ncols, char flag[nrows][ncols])
{
    for (int row = 0; row < nrows; row++)
    {
        for (int col = 0; col < ncols; col++)
        {
            printf("%c", flag[row][col]);
        }

        printf("\n");
    }
}

int main(void)
{
    displayFlag(nrows, ncols, flag);
    return 0;
}