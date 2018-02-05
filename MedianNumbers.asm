 xSpim MediNumbers.asm program
# 
#

#  Data Area - allocate and initialize variables
    .data
numberEnter:
    .asciiz "Enter the next number:\n"

medianNo:
    .asciiz "Median: "


#Text Area (i.e. instructions)
    .text

main:
#t0,t1,t2 are numbers given by users
#t3,t4,t5 stand for min, med and max
#t6 is boolean
#t7 is a temparary variable

    li $v0, 4
    la $a0, numberEnter
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, numberEnter
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, numberEnter
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    slt $t6, $t1, $t0
    beq $t6, 1, first
    move $t3, $t0
    move $t5, $t1
    move $t4, $t2
    syscall

first:
    move $t3, $t1
    move $t5, $t0
    move $t4, $t2
    slt $t6, $t2, $t3
    beq $t6, 1, second
    syscall

second:
    move $t4, $t3
    move $t3, $t2
    syscall
    slt $t6, $t5, $t4,
    beq $t6, 1 , third
    syscall

thrid:
    move $t7, $t4
    move $t4, $t5
    move $t5, $t7

    li $v0, 4
    la &a0, medianNo
    syscall

    li $v0, 1
    li $a0, $t4
    syscall

exit:

	# Exit
	ori     $v0, $0, 10
	syscall

