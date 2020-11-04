.data

lfsr:
	.align 4
	.word 0x1

.text

# Implements a 16-bit lfsr
#
# Arguments: None
lfsr_random:
	la t0 lfsr
	lhu a0 0(t0)

	# Your Code Here
	add t0, x0, x0
	addi t1, x0, 16
	add t5, x1, x0
	jal loop

	la t0 lfsr
	sh a0 0(t0)
	add x1, x0, t5
	jr ra


loop:
	srli t2, a0, 2
	srli t3, a0, 3
	srli t4, a0, 5
	xor t2, a0, t2
	xor t2, t3, t2
	xor t2, t4, t2
	srli t3, a0, 1
	andi t2, t2, 1
	slli, t2, t2, 15
	or a0, t3, t2
	addi t0, t0, 1
	blt t0, t1, loop #goes back to loop if have not cycled through 16 bits
	jr ra
