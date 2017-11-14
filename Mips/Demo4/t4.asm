.text
main:				# pääohjelman alku
	la $a0, merkkijono 	# ladataan merkkijonon osoite
	jal palindrome 		# kutsutaan aliohjelmaa selvittämään, onko merkkijono palindromi
	beqz $v0, not_paldr	# verrataan tulosta
is_paldr:
	la $a0, result_positive
	li $v0, 4		# system call 4, tulostus
	syscall			# tulostusta varten
	j main_end
not_paldr:
	la $a0, result_negative
	li $v0, 4		# system call 4, tulostus
	syscall
main_end:
	j end

# Ohjelma merkkijonon palindromiominaisuuden selvittämiseksi.
#
# Kutsuttaessa:
# $a0 – NULL-päätteisen merkkijonon kantaosoite muistissa
# Palattaessa:
# $v0 – 1 mikäli merkkijono on palindromi, 0 muutoin

palindrome:	# palindromi-metodin alku
	# Aseta osoitin $a0:aan ja tulos rekisteri $v0 nollaksi.
	# $v0 muuttuu ykköseksi vasta, kun sana on todettu palindromiksi.
	move $t0, $a0
	li   $v0, 0
	# Looppi, joka tallentaa merkkijonon pinoon ja lopettaa lukemisen, 
	# kun NULL-merkki on viimeisin luettu.
loop:	lb   $t1, ($t0)
	beqz $t1, done
	addi $t0, $t0, 1
push:  	addi $sp, $sp, -1  # Decrement stack pointer by 1
       	sb   $t1, ($sp)   # Save $t1 to stack
       	j    loop
	# Looppi, joka vertaa pinossa olevia alkuperäiseen. Kannattaa lähteä
	# siitä liikkeelle, että pino osoitta luetun merkkijonon viimeisimpään merkkiin
	# ja jokin pointteri laitetaan osoittamaan takaisin $a0:n alkuun ja täten 
	# verrata järjestystä.
done:	move $t0, $a0
loop2:	lb   $t1, ($t0)
	addi $t0, $t0, 1
pop:	lb   $t2, ($sp)
	addi $sp, $sp, 1
	beqz $t1, true
	beq  $t1, $t2, loop2
	j    palindrome_end
	# Aseta $v0 ykköseksi, jos sana oli palindromi. 
true:	li $v0, 1

palindrome_end: 	# palindromi-metodin loppu
	jr $ra
end:		# Koko ohjelman loppu
.data 
merkkijono: 		.asciiz "saippuakauppias"
result_positive: 	.asciiz "Jono oli palindromi!"
result_negative: 	.asciiz "Jono ei ollut palindromi!"
