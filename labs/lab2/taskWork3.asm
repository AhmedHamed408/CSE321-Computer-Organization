.data
mainMsg: .asciiz "welcome.\nchoose from the following:-\n1- first\n2- second\n3- third\nEnter Your Choice : "
firstMsg: .asciiz "You choosed first \n"
secondMsg: .asciiz "You choosed second \n"
thirdMsg: .asciiz "You choosed third \n"
deafultMsg: .asciiz "\nERROR... You must choosed 1 , 2 , 3 \n"

.text

main:
    li $v0 , 4
    la $a0 , mainMsg
    syscall


    li $v0 , 5
    syscall
    move $t0 , $v0


#switch Case
    beq $t0 , 1 , caseFirst
    beq $t0 , 2 , caseSecond
    beq $t0 , 3 , caseThird
    j deafult



#switch case
caseFirst:
    li $v0 , 4
    la $a0 , firstMsg
    syscall
    j exit

caseSecond:
    li $v0 , 4
    la $a0 , secondMsg
    syscall
    j exit
caseThird:
    li $v0 , 4
    la $a0 , thirdMsg
    syscall
    j exit

deafult:
    li $v0 , 4
    la $a0 , deafultMsg
    syscall
    j exit
exit:
    li $v0 , 10
    syscall