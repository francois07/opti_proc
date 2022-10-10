; Exercice 4
; Auteurs: Hugo MICHEL & François SOULIÉ
; Nombre de cycles sans Forwarding: 3275
; Nombre de cycles avec Forwarding: 1635

.data
tab1: .word	11,12,13,14, 21,22,23,24, 31,32,33,34, 41,42,43,44
tab2: .word	1,2,3,4, 5,6,7,8, 9,10,11,12, 13,14,15,16
tab3: .word	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0

clear: .word 0

.code
addi r1, r0, #4
addi r13, r0, #8

lw r2, clear(r0)
lignes:
    lw r3, clear(r0)

colonnes:
    lw r4, clear(r0)
    lw r11, clear(r0)

operation:
	mult r2, r1
	mflo r5
	add r5, r5, r4

	mult r4, r1
	mflo r6
	add r6, r6, r3

	mult r2, r1
	mflo r7
	add r7, r7, r3

	mult r5, r13
	mflo r5

	mult r6, r13
	mflo r6

	mult r7, r13
	mflo r7

	lw r8, tab1(r5)
	lw r9, tab2(r6)
	
	mult r8, r9
	mflo r10

	add r11, r11, r10

addi r4, r4, #1
bne r4, r1, operation
sw r11, tab3(r7)

addi r3, r3, #1
bne r3, r1, colonnes

addi r2, r2, #1
bne r2, r1, lignes