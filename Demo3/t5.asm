.data
	jono: 7, 14, -7, 62, 0, 45, -9, 3   #tutkittava jono 
.text
	la $a0, jono 		      #jonon alkuosoite
	addi $a1, $zero, 8  	#jonon pituus
	addi $a2, $zero, 0 	  #haettava arvo
	add $v0, $zero, $zero	#alustetaan $v0 
	jal loop  		        #kutsutaan  aliohjelmaa
	j end			            #lopetetaan suoritus		
		
	loop:			            #käy jonoa läpi numero numerolta
	
		beq $a1, $zero, endloop   #tarkistoo onko enää alkioita jonossa
		lw $t0, ($a0)		          #ladataan a0 muistipaikan arvo t0	
		seq $v0, $t0, $a2	        #vertaillaan ovatko luvut samat ja vastaus tallentuu v0
		bne $v0, $zero, endloop	  #jos luku löytyi hypätään pois loopista
		addi $a1, $a1, -1       	#vähennetään jonon kokoa
		addi $a0, $a0, 4	        #siirrytään seuraavaan muistipaikkaan 
		j loop			              #jatketaan suoritusta
		
	endloop:     #lopetetaan suorits
	end:	       #lopetetaan suoritus
	
	
