;;;;;;; P1 for QwikFlash board ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Use 10 MHz crystal frequency.
; Use Timer0 for ten millisecond looptime.
;;;;;;; Program hierarchy ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Main
;Alustus
;;;;;;; Assembler directives ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        list  P=PIC18F452, F=INHX32, C=160, N=0, ST=OFF, MM=OFF, R=DEC, X=ON

        #include P18F452.inc		;include the file
---------------------------Muuttujien alustus-----------------------------

		foo equ 0x0B	;alustetaan muuttujia
		bar equ 0x0D
		baz equ 0x0E

;------------------------------------------------------------------------
		goto Main
Main:
		call Alustus ;alustetaan muuttujille arvoja
		movwf foo ;asetetaan foo:n arvo työrekisteriin W
		movff foo, bar ;siirretään foo sisältö muuttujaan bar
		rlcf bar, bar ;rotate left through Carry
		movff bar, baz ;siirretään bar sisältö muuttujaan baz
		movlw 0x10 ;asetetaan 0x10 työrekisteriin
		addwf baz ;lisätään työrekisterin arvo muuttujaan baz

;----------------------------------Alustus------------------------------------
Alustus:
	movlw 0x4
	movwf foo
	return

;------------------------------------END---------------------------------------



END
