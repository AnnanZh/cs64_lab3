# xSpim MedianNumbers.asm program
#Xingxing,Geng 02/03 
#

#  Data Area - allocate and initialize variables
    .data

prompt:
	.asciiz "Enter the next number:\n"

result:
	.asciiz "Median: "


#Text Area (i.e. instructions)
    .text

main:
# Show the promt
	li $v0,  4
	la  $a0, prompt
	syscall

# Read the first number
	li $v0, 5
	syscall

# Move the first number into $s0
	add $s0, $v0, $zero

# Show the promt
	li $v0, 4
	la $a0, prompt
	syscall

# Read the second number
	li $v0, 5
	syscall

# Move the second number into $s1
    add $s1, $v0, $zero

# Third try
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall

	add $s2, $v0, $zero


	blt $s0, $s1, else_1
	blt $s0, $s2, else_2
	blt $s1, $s2, else_3
# if s0 > s1 > s2, then s1 is the median number. Print s1!
	li $v0, 1
    la $a0, $s1  #move here?
	syscall
	j exit

else_1:  # if s0 < s1
	bge $s0, $s2, else_4
	bge $s2, $s1, else_5
	li $v0, 1
	move $a0, $s2
	syscall
	j exit

else_2: # if s0 < s2
	li $v0, 1
	move $a0, $s0
	syscall
	j exit

else_3: # if s1 < s2
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

