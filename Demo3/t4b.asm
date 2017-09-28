.data
luku1:	9999
luku2:	-123
.text
	# testataan aliohjelmaa
	la $a0, luku1
	la $a1, luku2
	jal swap
	j finish

swap:	# luetaan luvut rekistereihin
	lw $t0, ($a0)
	lw $t1, ($a1)
	# kirjoitetaan luvut takaisin muistiin toisinpäin
	sw $t0, ($a1)
	sw $t1, ($a0)
	jr $ra

finish: