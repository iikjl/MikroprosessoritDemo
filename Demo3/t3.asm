.text
	la $s0, omatluvut	# $s0 osoittaa omaluvut alkuun
	li $s1, 0xffffffff	# ladataan $s1:een...
				# ...arvo 0xffffffff (32 bittiä)

loop:	lw $a0, ($s0)		# luetaan muistista $a0:aan
	beq $a0, $zero, finish	# lopeta suoritus jos luku on 0
	slt $t0, $s1, $a0	# jos 0xffffffff pienempi kuin $a0
	beq $t0, $zero, skip	# ...ohitetaan aliohjelmakutsu
	jal proc
	sw $v0, ($s0)		# talletetaan aliohjelman tulos ($v0)

skip:	addi $s0, $s0, 4	# muistiosoitetta kasvatetaan
	j loop			# uusi loop

proc:	nor $v0, $a0, $zero	# aliohjelma kääntää bitit...
	addi $v0, $v0, 1	# ja lisää ykkösen
	jr $ra

finish:

.data
	omatluvut: .word -2, 10, -1, 2, -15, 0, 1
