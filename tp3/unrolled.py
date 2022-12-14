import numpy as np

Hx = [-1, 0, 1, -2, 0, 2, -1, 0, 1]
Hy = [1, 2, 1, 0, 0, 0, -1, -2, -1]

A = [1, 1, 1, 255, 255, 1, 1, 1, 1, 1, 1, 255, 255, 1, 1, 1, 1, 1, 1, 255, 255, 1, 1, 1, 1, 1, 1, 255, 255, 1, 1,
     1, 1, 1, 1, 255, 255, 1, 1, 1, 1, 1, 1, 255, 255, 1, 1, 1, 1, 1, 1, 255, 255, 1, 1, 1, 1, 1, 1, 255, 255, 1, 1, 1]


fx = [0] * len(A)
fy = [0] * len(A)

sizeA = int(len(A)**(1/2))
sizeH = int(len(Hx)**(1/2))


for lignesA in range(1, sizeA-1):
    for colonnesA in range(1, sizeA-1):
        sx = 0
        sy = 0
        idxA = (lignesA - 1)*(sizeA) + (colonnesA - 1)
        idxH = 0

        I_n = A[idxA]
        Hx0 = Hx[idxH]
        Hy0 = Hy[idxH]
        sx += I_n * Hx0
        sy += I_n * Hy0

        idxA += 1
        idxH += 1

        I_n = A[idxA]
        Hx0 = Hx[idxH]
        Hy0 = Hy[idxH]
        sx += I_n * Hx0
        sy += I_n * Hy0

        idxA += 1
        idxH += 1

        I_n = A[idxA]
        Hx0 = Hx[idxH]
        Hy0 = Hy[idxH]
        sx += I_n * Hx0
        sy += I_n * Hy0

        idxA += sizeA - 2
        idxH += 1

        I_n = A[idxA]
        Hx0 = Hx[idxH]
        Hy0 = Hy[idxH]
        sx += I_n * Hx0
        sy += I_n * Hy0

        idxA += 1
        idxH += 1

        I_n = A[idxA]
        Hx0 = Hx[idxH]
        Hy0 = Hy[idxH]
        sx += I_n * Hx0
        sy += I_n * Hy0

        idxA += 1
        idxH += 1

        I_n = A[idxA]
        Hx0 = Hx[idxH]
        Hy0 = Hy[idxH]
        sx += I_n * Hx0
        sy += I_n * Hy0

        idxA += sizeA - 2
        idxH += 1

        I_n = A[idxA]
        Hx0 = Hx[idxH]
        Hy0 = Hy[idxH]
        sx += I_n * Hx0
        sy += I_n * Hy0

        idxA += 1
        idxH += 1

        I_n = A[idxA]
        Hx0 = Hx[idxH]
        Hy0 = Hy[idxH]
        sx += I_n * Hx0
        sy += I_n * Hy0

        idxA += 1
        idxH += 1

        I_n = A[idxA]
        Hx0 = Hx[idxH]
        Hy0 = Hy[idxH]
        sx += I_n * Hx0
        sy += I_n * Hy0

        fx[lignesA*sizeA + colonnesA] = sx
        fy[lignesA*sizeA + colonnesA] = sy

print(np.reshape(np.array(fx), (8, 8)))
print(np.reshape(np.array(fy), (8, 8)))
