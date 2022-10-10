tab1 = [11, 12, 13, 14, 21, 22, 23, 24, 31, 32, 33, 34, 41, 42, 43, 44]
tab2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
tab3 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

size = 4

for i in range(size):
    for j in range(size):
        for k in range(size):
            e1 = tab1[i*size + k]
            e2 = tab2[k*size + j]
            tab3[i*size + j] += e1*e2
            print(e1, e2, e1*e2)

print(tab3)
