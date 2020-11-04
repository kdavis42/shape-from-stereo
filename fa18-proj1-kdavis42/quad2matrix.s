.text

# Decodes a quadtree to the original matrix
#
# Arguments:
#     quadtree (qNode*)
#     matrix (void*)
#     matrix_width (int)
#
# Recall that quadtree representation uses the following format:
#     struct qNode {
#         int leaf;
#         int size;
#         int x;
#         int y;
#         int gray_value;
#         qNode *child_NW, *child_NE, *child_SE, *child_SW;
#     }

quad2matrix:
	lw t0, 0(a0)
	add t1, x0, x0
	bne t0, t1, leaf
	j children 
	leaf:
		lw t2, 4(a0) # t2 = size, t3 = x, t4 = y, t5 = gray_value
		lw t3, 8(a0) 
		lw t4, 12(a0) 
		lw t5, 16(a0) 
		add t0, x0, x0 
		row:
			add t1, x0, x0 
			column:
            	add t6, t4, t1
				mul t6, t6, a2
				add t6, t6, t3
				add t6, a1, t6
				sb t5, 0(t6)
				addi t1, t1, 1
				bne t1, t2, column
			addi t0, t0, 1
            addi t3, t3, 1
			bne t0, t2, row
		jr ra
	children:
		addi sp, sp, -8
		sw a0, 0(sp)
		sw ra, 4(sp)
		lw a0, 20(a0)
		jal quad2matrix
		lw ra, 4(sp)
		lw a0, 0(sp)
		sw a0, 0(sp)
		sw ra, 4(sp)
		lw a0, 24(a0)
		jal quad2matrix
		lw ra, 4(sp)
		lw a0, 0(sp)
		sw a0, 0(sp)
		sw ra, 4(sp)
		lw a0, 28(a0)
		jal quad2matrix
		lw ra, 4(sp)
		lw a0, 0(sp)
		sw a0, 0(sp)
		sw ra, 4(sp)
		lw a0, 32(a0)
		jal quad2matrix
		lw ra, 4(sp)
		lw a0, 0(sp)
		addi sp, sp, 8
		jr ra
