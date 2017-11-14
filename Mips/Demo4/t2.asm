	la $s1, uusi_sijainti # $s1 osoittaa uusi_sijainti paikkaan muistissa
.text
	lw $t0, luvun_ylaraja
	lw $t1, taulukon_pituus
	la $t2, taulukko
	# luetaan arvo taulukosta
loop:	lw $t3, ($t2)
	addi $t2, $t2, 4
	# verrataan ylärajaan
	bge $t3, $t0, grt
	# tallennetaan uuteen sijaintiin
	sw $t3, ($s1)
	addi $s1, $s1, 4
grt:	subi $t1, $t1, 1
	bgtz $t1, loop
	
.data
luvun_ylaraja:   .word 6
taulukon_pituus: .word 10
taulukko: 	 .word 1,9,2,8,7,3,8,5,9,8
uusi_sijainti:   .space 40