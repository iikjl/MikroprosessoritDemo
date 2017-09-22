	li	$a0, 0x10010000
	
	add 	$v0, $zero, $zero # nollaa rekisteri $v0
	add 	$t0, $a0, $zero	  # siirrä muistiosoite rekisteristä $a0 rekisteriin $t0
	addi	$t1, $zero, 8	  # alusta 8 rekisteriin $t1
Loop: 	lw 	$t2, 0($t0)	  # lataa muistista rekisterin $t0 osoitteesta arvo rekisteriin $t2
	add 	$v0, $v0, $t2	  # lisää $t2 rekisteriin $v0
	addi 	$t0, $t0, 4	  # lisää 4 rekisteriin $t0
	addi 	$t1, $t1, -1	  # lisää -1 rekisteriin $t1
	bne 	$t1, $zero, Loop  # hyppää labeliin "Loop" jos $t1 != 0
	
	# suorituksen jälkeen arvoilla 1,2,3,4,5 rekisterissä $v0 on arvo 15