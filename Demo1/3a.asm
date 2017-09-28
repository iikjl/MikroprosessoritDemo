	li $a0,5
	li $a1,4

	slt $t0,$a1,$a0
	bne $zero,$t0,Grt
	j End
Grt:	li $t0,1
End: