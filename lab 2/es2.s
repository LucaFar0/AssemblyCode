.section .data
	mag:	.ascii "maggiore\n"
	mag_l:	.long . - mag
	min:	.ascii "minore\n"
	min_l:	.long . - min
	ugu: 	.ascii "uguale\n"
	ugu_l:	.long . - ugu

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
	leal mag, %ecx
	movl mag_l, %edx
	int $0x80	

	jmp fine
	
minore:
	movl $4, %eax
	movl $1, %ebx
	leal min, %ecx
	movl min_l, %edx
	int $0x80

	jmp fine
	
uguale:
	movl $4, %eax
	movl $1, %ebx
	leal ugu, %ecx
	movl ugu_l, %edx
	int $0x80
	
	jmp fine
	
fine:	
	movl $1, %eax
	movl $0, %ebx
	int $0x80

