.data

namePrompt: .asciiz "Name : "
idPrompt: .asciiz "ID : "
coursePrompt: .asciiz "Course : "

name: .space 20
course: .space 50


.text

main:
    li $v0 , 4
    la $a0 , namePrompt
    syscall

    li $v0 , 8
    la $a0 , name
    li $a1 , 20
    syscall


    li $v0 , 4
    la $a0 , idPrompt
    syscall

    li $v0 , 5
    syscall

    

    li $v0 , 4
    la $a0 , coursePrompt
    syscall
  
    li $v0 , 8
    la $a0 , course
    li $a1 , 50
    syscall

    
exit:
    li $v0 , 10
    syscall