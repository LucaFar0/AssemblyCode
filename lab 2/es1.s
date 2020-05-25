.section .data
	n1 : .long 100
	n2 : .long 33
	n3 : .long 68

	somma : .long 0

.section .text
	.global _start
_start:
	leal somma, %eax
	
	leal n1, %ebx
	addl %ebx, %eax
	
	leal n2, %ebx
	addl %ebx, %eax
	
	leal n3, %ebx
	addl %ebx, %eax
	
	move %eax, somma
	
	movl $4, %eax
	movl $1, %ebx
	leal somma, %ecx
	movl $4, %edx
	int $0x80
