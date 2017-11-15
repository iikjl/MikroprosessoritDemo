;;;;;;; P1 for QwikFlash board ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Use 10 MHz crystal frequency.
; Use Timer0 for ten millisecond looptime.
; Blink "Alive" LED every two and a half seconds.
; Toggle C2 output every ten milliseconds for measuring looptime precisely.

;
;;;;;;; Assembler directives ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		list  P=PIC18F452, F=INHX32, C=160, N=0, ST=OFF, MM=OFF, R=DEC, X=ON

        #include P18F452.inc		;include the file

;-----------------------------muuttujat-------------------------------

		counter equ 0x08 ;alustaa muuttujan arvon


;---------------------------Ohjelma----------------------------------------
	goto Main ;jump to main

Main:
		call Alustus ;kutsu Alustus-aliohjelmaa
		call Loop ;kutsu Loop-aliohjelmaa

;-----------------------------Alustus---------------------------------
Alustus:
		movlw 0x00 ;aseta työrekisteriin arvo 0x00
		movwf counter ;siirrä työrekisterin arvo muuttujaan counter
		movlw 0x0A ;aseta työrekisteriin arvo 0x00
		return

;----------------------------Loop--------------------------------------
Loop:
		incf counter ;lisää counter arvoa yhdellä
		CPFSEQ counter ;vertaa työrekisterin arvoa muuttujan counter arvoon, jos counter=w skip
		goto Loop ;hyppää aliohjelmaan Loop
		movlw 0x01 ;aseta työrekisteriin arvon 0x01
		movwf counter ;lataa työrekisterin arvo muuttujaan counter
END
