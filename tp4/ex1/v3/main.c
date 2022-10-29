#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#define HEIGHT 1000
#define WIDTH 1000
#define SIZE 1000 * 1000

int main(int argc, char const *argv[])
{
    int *A = (int *)calloc(SIZE, sizeof(int));
    int *B = (int *)calloc(SIZE, sizeof(int));

    // Initialisation
    for (int i = 0; i < SIZE; i++)
    {
        *(A + i) = 1;
    }

    // Version 3
    for (int i = 0; i < HEIGHT; i++)
    {
        for (int j = 0; j < WIDTH; j++)
        {
            int idx = i * WIDTH + j;
            memcpy(B + idx, A + idx, sizeof(int));
        }
    }

    free(A);
    free(B);

    return 0;
}
