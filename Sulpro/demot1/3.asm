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
		sum equ 0x08				;alustetaan muuttujille paikat
		counter equ 0x09
		dat equ 0x0A

;--------------------------------------------------

	goto Alustaa ; jump to Alustaa
	goto Main ;jump to Main

Main:


	call Loop ;kutsu aliohjelmaa Loop

Loop:
	movf dat,W  ;lataa dat arvo työrekisteriin
	addwf sum,W ;lisää sum arvo työrekisteriin
	movwf sum ;lataa työrekisterin arvo muuttujaan sum
	decf counter ;vähennä counterista yksi
	TSTFSZ counter ;skip if counter = 0
	goto Loop ;jump to Loop
	return ;palaa kohtaan, jossa aliohjelmaa on kutsuttu

;---------------------------------------
Alustaa:
	movlw 0x01  ;Alustetaan muuttujat
	movwf dat
	movlw 0x10
	movwf counter
	movlw 0x00
	movwf sum
	rcall Main


END
