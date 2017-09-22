	# the words are in memory addresses
	# 0x10010000 - 0x1001001b
	li $a0,0x10010000
	# stack is in memory addresses
	# 0x1001001c - 0x10010038
	li $sp,0x10010038

	li $t0,7
loop:	lw $t1,0($a0)
	addi $a0,$a0,4
push:	subi $sp,$sp,4
	sw $t1,0($sp)
	subi $t0,$t0,1
	bne $t0,$zero,loop
	
	li $a0,0x10010000
	li $t0,7
loop2:	lw $t1,0($sp)
	addi $sp,$sp,4
	sw $t1,0($a0)
	addi $a0,$a0,4
	subi $t0,$t0,1
	bne $t0,$zero,loop2
	