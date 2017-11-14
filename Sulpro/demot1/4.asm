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

		counter equ 0x08


;---------------------------Ohjelma----------------------------------------
	goto Main

Main:
		call Alustus
		call Loop

;-----------------------------Alustus---------------------------------
Alustus:		
		movlw 0x00
		movwf counter
		movlw 0x0A
		return

;----------------------------Loop--------------------------------------
Loop:
		incf counter
		CPFSEQ counter
		goto Loop
		movlw 0x01
		movwf counter
END
		
	
