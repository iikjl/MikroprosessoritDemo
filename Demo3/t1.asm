	blt $s0, $s1, L1
L1: 	nop
# Blt on pseudokäsky jonka kääntäjä muuttaa oikeiksi käskyiksi.
# Muita haarautumis pseudokäskyjä ovat bge, bgt ja ble.
# https://en.wikibooks.org/wiki/MIPS_Assembly/Pseudoinstructions

#kääntyy slt $1, $8, $9
	#bne $1, $0, label
