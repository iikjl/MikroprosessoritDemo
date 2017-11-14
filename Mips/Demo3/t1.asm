	blt $s0, $s1, L1
L1: 	nop
# Blt on pseudokäsky jonka kääntäjä muuttaa oikeiksi käskyiksi.
# Muita haarautumis pseudokäskyjä ovat bge, bgt ja ble.
# https://en.wikibooks.org/wiki/MIPS_Assembly/Pseudoinstructions

# blt kääntyy: 
	#slt $t1, $s8, $s9
	#bne $t1, $zero, L1
