.data
mainPrompt: .asciiz "Enter an integer (n) : "
result: .asciiz "The sum : "
newLine: .asciiz "\n"



.text


main:
    move $t0 , $zero


    li $v0 , 4
    la $a0 , mainPrompt
    syscall


    li $v0  , 5
    syscall
    
    move $t1,$v0

for:
    bne $t0 , $t1 , do 
    j endfor

do:

    addi $t0 , $t0 , 1
    add  $t2 , $t2 , $t0
    j for
endfor:
    li $v0 , 4
    la $a0 , result
    syscall

    li $v0,1
    move $a0 , $t2
    syscall

    li $v0 , 4
    la $a0 , newLine
    syscall

exit:
li $v0 , 10
syscall