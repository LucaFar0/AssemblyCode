.section .data
	n1 : .long 100
	n2 : .long 33
	n3 : .long 68

	somma : .ascii "000\n"
	somma_l : .long . - somma

.section .text
	.global _start
_start:
	leal somma, %esi
	
	movl $0, %eax
	
	movl n1, %ebx
	addl %ebx, %eax
	
	movl n2, %ebx
	addl %ebx, %eax
	
	movl n3, %ebx
	addl %ebx, %eax
	
	#ora eax  contiene il risultato
	
	movl $10, %ebx
	divb %bl
	addb $48, %ah
	movb %ah, 2(%esi)
	xorb %ah, %ah	

	movl $10, %ebx
	divb %bl
	addb $48, %ah
	movb %ah, 1(%esi)
	xorb %ah, %ah	
	
	movl $10, %ebx
	divb %bl
	addb $48, %ah
	movb %ah, (%esi)
	xorb %ah, %ah		
	
	movl $4, %eax
	movl $1, %ebx
	leal somma, %ecx
	movl somma_l, %edx
	int $0x80
	
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
