		lw		0		1		n		load n
		lw		0		2		r		load r
		lw		0		4		Caddr
		jalr	4		7
end		halt
comb	lw		0		6		pos1
		sw		5		7		Stack	save return address to Stack
		add 	5		6		5		increment stack pointer
		sw		5		1		Stack	save n to Stack
		add 	5		6		5		increment stack pointer
		sw		5		2		Stack	save r to Stack
		add 	5		6		5		increment stack pointer
		beq		0		2		base	if r == 0, return 1
		beq		1		2		base	if r == n, return 1
		sw		5		3		Stack	save return register to stack
		add 	5		6		5		increment stack pointer
		lw		0		6		neg1
		add 	6		1		1		decrement n
		lw		0		7		ret1 	save return address
		lw		0		4		Caddr 	get ready for recursion
		jalr 	4		6				jump to beginning
ret1	noop
		lw		5 		6		Stack 	load return register
		add 	3		6		3 		add return register and saved register
		lw		0		6		neg1
		add 	5		6		5		decrement stack pointer
		add 	6		2		2		decrement r
		lw		0		6		pos1
		sw		5		3		Stack	save return register to stack
		add 	5		6		5		increment stack pointer
		lw		0		7		ret2 	save return address
		lw		0		4		Caddr 	get ready for recursion
		jalr 	4		6				jump to beginning
ret2 	noop
		lw		5		6		Stack
		add     3		6		3		add results of the two recurses
		lw		0		6		neg1
		add 	5		6		5		decrement stack pointer
		beq		0		0		return	leave this stack
base	lw		0		6		pos1
		add 	6		3		3		set return value to 1
return 	lw		0		6		neg1
		add 	5		6		5		decrement stack pointer
		lw		5		2		Stack 	load original r
		add 	5		6		5		decrement stack pointer
		lw		5		1		Stack 	load original n
		add 	5		6		5		decrement stack pointer
		lw		5		7		Stack 	load original return address
		jalr	7		4				return to main
n		.fill	7
r		.fill	3
pos1	.fill	1
neg1	.fill	-1
Caddr	.fill	comb
Ret1 	.fill	ret1
Ret2 	.fill	ret2
Stack 	.fill	0
