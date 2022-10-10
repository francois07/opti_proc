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
        for lignesH in range(sizeH):
            for colonnesH in range(sizeH):
                offset = (lignesH-1, colonnesH-1)
                I_n = A[(lignesA + offset[0])*(sizeA) +
                        (colonnesA + offset[1])]
                sx += I_n * Hx[lignesH*sizeH + colonnesH]
                sy += I_n * Hy[lignesH*sizeH + colonnesH]

        fx[lignesA*sizeA + colonnesA] = sx
        fy[lignesA*sizeA + colonnesA] = sy

print(np.reshape(np.array(fx), (8, 8)))
print(np.reshape(np.array(fy), (8, 8)))
