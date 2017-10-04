.data
mem_a: 	0
mem_b: 	1
.text
loop:	lw   $t0, mem_a
	lw   $t1, mem_b
	beq  $t0, 10, end
	addi $t0, $t0, 1 # increment a
	sll  $t1, $t1, 1 # multiply b by 2 by shifting left
	sw   $t0, mem_a
	sw   $t1, mem_b
	j    loop
end:

# Suorituksen jälkeen muistipaikassa b on luku 1024	