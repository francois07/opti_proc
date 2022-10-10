; Exercice 1
; Auteurs: Hugo MICHEL & François SOULIÉ

.data
n1:	.double		1.0
n2:	.double		2.0

.code
l.d f1, n1(r0)
l.d f2, n2(r0)

; add.d f3, f1, f2 ; 12 Cycles avec l'addition
mul.d f3, f1, f2 ; 15 Cycles avec la multiplication