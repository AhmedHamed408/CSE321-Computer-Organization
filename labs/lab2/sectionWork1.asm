.data

mainPrompt: .asciiz "Enter an integer :"
zeroMSG: .asciiz "Zero\n"
posMSG: .asciiz "Positive\n"
negMSG: .asciiz "Negative\n"


.text



main:
    li $v0 , 4
    la $a0 , mainPrompt
    syscall

    li $v0 , 5
    syscall
    move $t0,$v0

if:
    bne $t0 , $zero , elsif 
    la $a0 , zeroMSG
    j endif
elsif:
    bgtz $t0 ,else
    la $a0 , negMSG
    j endif
else:
    la $a0 , posMSG
endif:
    li $v0 ,4
    syscall


exit:
    li $v0 , 10
    syscall