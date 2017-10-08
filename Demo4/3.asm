.data
	
	taulukko: .word 1,9,2,8,6,3,4,9,2,4
	pituus: .word 10
	haluttu: .word 7

.text


	la $a0, taulukko 		#jonon alkuosoite
	la $a1, pituus 			#jonon pituuden osoite
	la $a2, haluttu			#haettava arvon osoite
				
	lw $t1 ($a1)
	lw $t2 ($a2)			#alustetaan
	
	jal loop 
	j end		
		
	loop:			            #käy jonoa läpi numero numerolta
	
		beqz  $t1, endNot 	#tarkistoo onko enää alkioita jonossa
		lw $t0, ($a0)
			 		
		beq $t2, $t0, endSame		#jos luku löytyi hypätään pois loopista
		addi $t1, $t1, -1      		#vähennetään jonon kokoa
		addi $a0, $a0, 4		#siirrytään seuraavaan muistipaikkaan 
		j loop			        #jatketaan suoritusta
		
	endNot:
	li $v0, 0
	jr $ra
	
	endSame:
	li $v0, 1
	jr $ra
end:
	

 
