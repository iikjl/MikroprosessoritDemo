	li $a0,10
	li $a1,9
	
	bge $a0,$a1,A 
	move $v0,$a1
	j End
A:	move $v0,$a0
End: