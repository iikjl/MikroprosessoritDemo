.text
	la $s0, omajono # $s0 osoittaa omajono alkuun
	# la $sp, pino
loop:	lw $t0, 0($s0) # luetaan luku omajonosta
	beqz $t0, end
	addi $s0, $s0, 4
push:	subi $sp, $sp, 4
	sw $t0, 0($sp)
	lw $v0, 8($sp)  # 8 on offset -2 sanaa pinon päältä
			# toimii koska oletetaan että jonon pituus >= 4
	j loop
end:	nop
.data
omajono:
	25, 7, 1, 5, 3, 1, 0, 10