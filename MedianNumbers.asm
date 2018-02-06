# xSpim MedianNumbers.asm program
# 
#

#  Data Area - allocate and initialize variables
.data

	# TODO: Complete these declarations / initializations

name1:	.asciiz "Enter the next number:\n"

name2:	.asciiz "Median: "


#Text Area (i.e. instructions)
.text

main:

	# TODO: Write your code here
	li $v0, 4
	la $a0, name1
	syscall

	
	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 4
	la $a0, name1
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	li $v0, 4
	la $a0, name1
	syscall

	li $v0, 5
	syscall
	move $t2, $v0

	slt $t7, $t1, $t0
	bne $t7, $zero, first_try
	move $t3, $t0
	move $t5, $t1
	move $t4, $t2


second_compare:	
	slt $t8, $t4, $t3
	bne $t8, $zero, second_try
	

third_compare:	
	slt $t9, $t5, $t4
	bne $t9, $zero, third_try
	j print_part
	


first_try:
	move $t3, $t1
	move $t5, $t0
	move $t4, $t2
	j second_compare

second_try:
	move $t4, $t3
	move $t3, $t2
	j third_compare

third_try:
	move $t6, $t4
	move $t4, $t5
	move $t5, $t6
	
print_part:	
	li $v0, 4
	la $a0, name2
	syscall

	li $v0, 1
	move $a0, $t4
	syscall

exit:

	# Exit
	ori     $v0, $0, 10
	syscall

