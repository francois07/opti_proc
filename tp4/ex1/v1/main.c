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

    // Version 1
    for (int j = 0; j < WIDTH; j++)
    {
        for (int i = 0; i < HEIGHT; i++)
        {
            int idx = i * WIDTH + j;
            *(B + idx) = *(A + idx);
        }
    }

    return 0;
}
