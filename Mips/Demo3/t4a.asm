	# testataan aliohjelmaa
	li $a0, -123
	jal abso
	li $a0, 54554
	jal abso
	j finish

abso:	move $v0, $a0
	bgtz $v0, grt
	sub $v0, $zero, $v0
grt:	jr $ra

finish: