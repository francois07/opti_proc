#include <stdlib.h>
#include <time.h>

#define HEIGHT 1000
#define WIDTH 1000
#define SIZE 1000 * 1000

float neighborhood(int *A, size_t idx)
{
    int offsets[][2] = {
        {-1, -1},
        {-1, 0},
        {-1, 1},
        {0, -1},
        {0, 0},
        {0, 1},
        {1, -1},
        {1, 0},
        {1, 1},
    };

    float sum = 0;

    for (int i = 0; i < 9; i++)
    {
        sum += (float)A[idx + (offsets[i][0] * WIDTH) + offsets[i][1]];
    }

    return (float)(sum / 9.0f);
}

int main(int argc, char const *argv[])
{
    srand(time(NULL));

    int *A = malloc(SIZE * sizeof(int));
    float *B = malloc(SIZE * sizeof(float));

    // Initialisation
    for (int i = 1; i < SIZE - 1; i++)
    {
        *(A + i) = rand() % 50;
    }

    // Version 2
    for (int i = 1; i < HEIGHT - 1; i++)
    {
        for (int j = 1; j < WIDTH - 1; j++)
        {
            int idx = i * WIDTH + j;
            B[idx] = neighborhood(A, idx);
        }
    }

    free(A);
    free(B);

    return 0;
}
