; Exercice 2
; Auteurs: Hugo MICHEL & François SOULIÉ
; Nous n'avons pas réussi à améliorer le nombre de cycles plus bas que 89 cycles
; Nombre de cycles sans Forwarding: 89
; Nombre de cycles avec Forwarding: 61

.data
tab: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
res: .word 0

.code
lw r3, tab(r0)
addi r4, r0, #72

boucle:
	addi r1, r1, #8
	lw r2, tab(r1)
	add r3, r3, r2
	bne r1, r4, boucle

sw r3, res(r0)