;;;;;;; P1 for QwikFlash board ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Use 10 MHz crystal frequency.
; Use Timer0 for ten millisecond looptime.
; Blink "Alive" LED every two and a half seconds.
; Toggle C2 output every ten milliseconds for measuring looptime precisely.
;
; PA4=led
; Last modified 7.11.2017
;;;;;;; Program hierarchy ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;   Init
;   Initpic
;   BlinkAlive
;   LoopTime
;
;;;;;;; Assembler directives ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        list  P=PIC18F452, F=INHX32, C=160, N=0, ST=OFF, MM=OFF, R=DEC, X=ON

        #include P18F452.inc		;include the file
		foo equ 0x0B	;alustetaan muuttujia
		bar equ 0x0D
		baz equ 0x0E
;--------------------------------------------------
		movf foo,W,
		addwf foo,W
		movwf bar
		movf bar,W
		addlw 0x10
		movwf baz



END
