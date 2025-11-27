.data
A:  .word 4
B:  .word 6

.text

# ===========================
# Function: compute(a, b)
# returns (a + b) * 2
# ===========================
compute:
    # Callee-save
    addi $sp, $sp, -8
    sw   $ra, 4($sp)
    sw   $s0, 0($sp)

    # Body
    add  $s0, $a0, $a1
    sll  $v0, $s0, 1

returncompute:
    # Callee-restore
    lw   $s0, 0($sp)
    lw   $ra, 4($sp)
    addi $sp, $sp, 8

    jr   $ra


# ===========================
# main function (caller)
# ===========================
main:
    lw   $t0, A
    lw   $t1, B
    li   $s0, 99

    # Caller-save  
    addi $sp, $sp, -4
    sw   $s0, 0($sp)

    move $a0, $t0
    move $a1, $t1
    jal  compute

    move $t3, $v0


    # print
    move $a0, $t3
    li $v0 , 1
    syscall

    # Caller-restore
    lw   $s0, 0($sp)
    addi $sp, $sp, 4

returnmain:
    li $v0, 10
    syscall
