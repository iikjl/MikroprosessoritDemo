.data
prompt: .asciiz "Syötä kokonaisluku: "
vastaus: .asciiz "Hex arvona: "
.text
    # Tulosta prompt
    li $v0, 4
    la $a0, prompt
    syscall
    # Tallenna käyttäjän syöte
    li $v0, 5
    syscall
    move $t0, $v0
    # Tulosta hexana
    li $v0, 4
    la $a0, vastaus
    syscall
    # tulosta luku
    move $a0, $t0
    li $v0, 34
    syscall