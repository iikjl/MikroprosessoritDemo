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
		
;--------------------------Macro--------------------------------

LOADF macro literal, register
	movlw literal
	movwf register
	movlw 0x00
	endm


;---------------------------------Test---------------------------
	goto Main

Main:
	LOADF 0x01, 0x0D
	LOADF 0x02, 0x0E
	LOADF 0xFF, 0x0F

;------------------------END-------------------------------------
END	
	
