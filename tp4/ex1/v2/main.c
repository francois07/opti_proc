#include <stdlib.h>

#define HEIGHT 1000
#define WIDTH 1000
#define SIZE 1000 * 1000

int main(int argc, char const *argv[])
{
    int *A = malloc(SIZE * sizeof(int));
    int *B = malloc(SIZE * sizeof(int));

    // Initialisation
    for (int i = 0; i < SIZE; i++)
    {
        *(A + i) = 0;
    }

    // Version 2
    for (int i = 0; i < HEIGHT; i++)
    {
        for (int j = 0; j < WIDTH; j++)
        {
            int idx = i * WIDTH + j;
            *(B + idx) = *(A + idx);
        }
    }

    free(A);
    free(B);

    return 0;
}
