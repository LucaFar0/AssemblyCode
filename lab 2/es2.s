.section .data
	ma : .ascii "maggiore\n"
	ma_l : .long - ma
	
	mi : .ascii "minore\n"
	mi_l : .long - mi
	
	u : .ascii "uguale\n"
	u_l : .long - u

.section .text
	.global _start
_start:

	movl $4, %eax
	movl $10, %ebx
		
	cmp %eax, %ebx
	
	je uguale	#op2 equal op1
	jg minore	#op2 greater op1
	
maggiore:
	movl $4, %eax
	movl $1, %ebx
	leal ma, %ecx
	movl ma_l, %edx
	int $0x80	

	jmp fine
	
minore:
	movl $4, %eax
	movl $1, %ebx
	leal mi, %ecx
	movl mi_l, %edx
	int $0x80

	jmp fine
	
uguale:
	movl $4, %eax
	movl $1, %ebx
	leal u, %ecx
	movl u_l, %edx
	int $0x80
	
fine:	
	movl $1, %eax
	movl $0, %ebx
	int $0x80

