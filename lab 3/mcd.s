.section .data
	.string1 .ascii "PROGRAMMA PER IL CALCOLO DEL MCD\n\nValore richiesto:"
	.string1_l .long . - string1
	
	.string2 .ascii "\n"
	.string2_l .long . - string2

.section .text
	.global _start
_start:

	movl $25, %eax
	movl $30, %ebx

	cmp $0, %eax
	jz eaxzero
	
	cmp $0, %ebx
	jz ebxzero
	
	#entrambi non zero
	
	while (a!=b)
			if (a<b)
				b = b - a;
			else
				a = a - b;
		result = a; // MCD = a = b
	

eaxzero:	
	cmp $0, %ebx
	jz bothzero
	
	move %ecx, %ebx
	
	jmp fine;
	
ebxzero:
	move %ecx, %eax
	
	jmp fine;
	
bothzero:
	movl $1, %eax
	movl $1, %ebx
	int $0x80 
	
	move $1, %eax
	
fine:
	# print intestazioni
	movl $4, %eax
	movl $1, %ebx
	leal string1, %ecx
	movl string1_l, %edx
	int $0x80

	movl $4, %eax
	movl $1, %ebx
	leal string1, %ecx
	movl string1_l, %edx
	int $0x80

	movl $4, %eax
	movl $1, %ebx
	leal string2, %ecx
	movl string1_2, %edx
	int $0x80
	
	
	
	# return 0
	movl $1, %eax
	movl $0, %ebx
	int $0x80 
