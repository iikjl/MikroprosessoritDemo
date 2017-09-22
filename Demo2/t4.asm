li $s0,1045

# set the top 4 bits to 1
li $t0,0xf0000000
or $s0,$s0,$t0

# set the bottom 2 bits to 0
li $t0,0xfffffffc
and $s0,$s0,$t0

# divide by 4 by shifting right twice
srl $s0,$s0,2