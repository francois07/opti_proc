; Partie 1
; Auteurs : Hugo MICHEL et François SOULIÉ
; Nombre de cycles sans Forwarding : 19155
; Nombre de cycles avec Forwarding : 9315

.data
hx: .word -1,0,1, -2,0,2, -1,0,1
hy: .word 1,2,1, 0,0,0, -1,-2,-1
A: .word 1, 1, 1, 255, 255, 1, 1, 1, 1, 1, 1, 255, 255, 1, 1, 1, 1, 1, 1, 255, 255, 1, 1, 1, 1, 1, 1, 255, 255, 1, 1, 1, 1, 1, 1, 255, 255, 1, 1, 1, 1, 1, 1, 255, 255, 1, 1, 1, 1, 1, 1, 255, 255, 1, 1, 1, 1, 1, 1, 255, 255, 1, 1, 1

fx: .word 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
fy: .word 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0

clear: .word 0
set1: .word 1

.code
addi r1, r0, #8 ; Taille de l'image (A)
addi r2, r0, #3 ; Taille des noyaux (H)
addi r26, r0, #8
addi r27, r0, #7

lw r3, set1(r0)
lignesA:

lw r4, set1(r0)
colonnesA:
    lw r22, clear(r0)
    lw r23, clear(r0)
    
lw r5, clear(r0)
lignesH:

lw r6, clear(r0)
colonnesH:
    ; I_n
    addi r10, r6, #-1 ; offset[1] = colonnesH - 1

    add r11, r3, r9 ; lignesA + offset[0]

    mult r1, r11 ; sizeA * r11
        addi r9, r5, #-1 ; offset[0] = lignesH - 1
        add r12, r4, r10 ; colonnesA + offset[1]
    mflo r13

    add r14, r13, r12 ; n (Indices de I)

    mult r14, r26 ; Word donc adresse x8
    mflo r14

    lw r15, A(r14) ; I_n

    ; Hx_n & Hy_n
    mult r5, r2 ; lignesH * sizeH
    mflo r16
    add r17, r16, r6 ; lignesH * sizeH + colonnesH

    mult r17, r26 ; Word donc adresse x8
    mflo r17

    lw r18, hx(r17) ; Hx
    lw r19, hy(r17) ; Hy

    mult r15, r18 ; I_n * Hx_n
    mflo r20

    mult r15, r19 ; I_n * Hy_n
    mflo r21

    add r22, r22, r20 ; sx += I_n * Hx_n
    add r23, r23, r21 ; sy += I_n * Hy_n

addi r6, r6, #1
bne r6, r2, colonnesH

addi r5, r5, #1
bne r5, r2, lignesH

mult r3, r1 ; lignesA * sizeA
mflo r24
add r25, r24, r4 ; lignesA * sizeA + colonnesA

mult r25, r26 ; Word donc adresse x8
mflo r25

sw r22, fx(r25)
sw r23, fy(r25)

addi r4, r4, #1
bne r4, r27, colonnesA

addi r3, r3, #1
bne r3, r27, lignesA
