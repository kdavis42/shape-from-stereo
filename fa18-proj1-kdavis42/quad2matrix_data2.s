.data
# Quadtree Node representation
# Recall that quadtree representation uses the following format:
#	struct qNode {
#		int leaf;
#		int size;
#		int x;
#		int y;
#		int gray_value;
#		qNode *child_NW, *child_NE, *child_SE, *child_SW;
#	}

q00:   .word  0, 12, 0, 0,  -1, 0, 0, 0, 0

qx00:  .word  0, 6, 0, 0,   -1, 0, 0, 0, 0
qx40:  .word  1, 6, 6, 0,  1, 0, 0, 0, 0
qx44:  .word  1, 6, 6, 6,  2, 0, 0, 0, 0
qx04:  .word  1, 6, 0, 6,   3, 0, 0, 0, 0

qxx00: .word 1, 3, 0, 0, 	6, 0, 0, 0, 0
qxx01: .word 1, 3, 3, 0,	7, 0, 0, 0, 0
qxx02: .word 1, 3, 3, 3,	8, 0, 0, 0, 0
qxx03: .word 1, 3, 0, 3,	9, 0, 0, 0, 0