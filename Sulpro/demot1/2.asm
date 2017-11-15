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
		foo equ 0x0B	;alustetaan muuttujia
		bar equ 0x0D
		baz equ 0x0E

;--------------------------------------------------

	goto main ;hypätään main-funktioon


Main:

	movf foo,W ;asetetaan foo:n arvo työrekisteriin
	CPFSGT bar ;vertaa bar arvoa työrekisterin arvoon skip if bar>W
	bra $+1  ;jump from HERE to CPFSEQ bar
	call If_greater,1 ;hyppää alirutiiniin if_greater
	CPFSEQ bar ;vertaa bar arvoa työrekisterin arvoon skip if bar = W
	bra $+1 ;jump from HERE to Call if_lesser,1
	call If_equal,1 ;hyppää alirutiiniin if_equal
	all If_lesser,1 ;hyppää alirutiiniin if_lesser


If_greater: ;aliohjelmien alustus

If_lesser:

If_equal:



END
