#include <stdlib.h>
#include <time.h>
#include <stdio.h>

#define HEIGHT 10
#define WIDTH 10
#define SIZE 10 * 10

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

double neighborhood(int *A, size_t idx)
{
    double sum = 0;

    for (int i = 0; i < 9; i++)
    {
        sum += (float)A[idx + (offsets[i][0] * WIDTH) + offsets[i][1]];
    }

    return sum / 9;
}

void print_float_matrix(float *A, size_t width, size_t height)
{
    for (int i = 0; i < width * height; i++)
    {
        if (i % width == 0)
        {
            printf("\n");
        }
        printf("%f ", A[i]);
    }
    printf("\n");
}

int main(int argc, char const *argv[])
{
    srand(time(NULL));

    int *A = malloc(SIZE * sizeof(int));
    float *B = malloc(SIZE * sizeof(int));

    // Initialisation
    for (int i = 1; i < SIZE - 1; i++)
    {
        *(A + i) = rand();
    }

    // Version 1
    for (int i = 1; i < WIDTH - 1; i++)
    {
        for (int j = 1; j < WIDTH - 1; j++)
        {
            int idx = i * WIDTH + j;
            *(B + idx) = neighborhood(A, idx);
        }
    }

    print_float_matrix(B, WIDTH, HEIGHT);

    free(A);
    free(B);

    return 0;
}
