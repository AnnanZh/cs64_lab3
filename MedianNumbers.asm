# xSpim MedianNumbers.asm program
#Xingxing,Geng 02/03 
#

#  Data Area - allocate and initialize variables
.data

	# TODO: Complete these declarations / initializations
prompt:
	.asciiz "Enter the next number:\n"

result:
	.asciiz "Median: "


#Text Area (i.e. instructions)
.text

main:
	#Display the prompt
	ori $v0, $zero, 4
	la  $a0, prompt
	syscall

	#Read the 1st number
	ori $v0, $zero, 5
	syscall

	# Put the 1st number into $s0
	add $s0, $v0, $zero

	#second turn
	ori $v0, $zero, 4
	la $a0, prompt
	syscall

	ori $v0, $zero, 5
	syscall

	add $s1, $v0, $zero

	#third turn
	ori $v0, $zero, 4
	la $a0,prompt
	syscall

	ori $v0, $zero, 5
	syscall

	add $s2, $v0, $zero

	ble $s0, $s1, else_1
	ble $s0, $s2, else_2
	ble $s1, $s2, else_3
	li $v0, 1
	move $a0, $s1
	syscall
	j exit

else_1:
	bge $s0, $s2, else_4
	bge $s2, $s1, else_5
	li $v0, 1
	move $a0, $s2
	syscall
	j exit

else_2:
	li $v0, 1
	move $a0, $s0
	syscall
	j exit

else_3:
	li $v0, 1
	move $a0, $s2
	syscall
	j exit

else_4:
	li $v0, 1
	move $a0, $s0
	syscall
	j exit

else_5:
	li $v0, 1
	move $a0, $s1
	syscall

exit:
	# Exit
	ori     $v0, $0, 10
	syscall

