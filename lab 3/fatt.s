.section .data
	
	str1:	.ascii "Insisci il numero\n"
	str1_l: .long . - str1
	
	num:	.ascii "0000000000"
	numt:	.ascii "0000000000"
	
	

.section .text
	.global _start
_start:

	movl $4, %eax
	movl $1, %ebx
	leal str1, %ecx
	movl str1_l, %edx
	int $0x80
	
	movl $3, %eax
	movl $1, %ebx
	leal num, %ecx
	movl $50, %edx
	incl %edx
	int $0x80
	
	movl $12, %ecx
	
	movl $1, %eax
	
ciclo:
	mul %ecx
	mov %ax, %bx
	mov %dx, %eax
	mov %ax, %bx
	
	loop ciclo
	
	
	mov $10, %ebx
	mov $0, %ecx
	
	leal numt, %esi
	
dividi:
	
	movl $0, %edx
	divl %ebx
	
	add $48, %dl
	movb %dl, (%ecx, %esi, 1)
	
	inc %ecx
	cmp $0, %eax
	
	jne dividi
	
ribalata:

	movb -1(%ecx, %esi, 1), %al
	movb %al, (%ebx, %edx, 1)
	
	inc %ebx
	
	loop ribalta
	
	
	movb $10, (%ebx, %edx, 1)
	inc %ebx
	movl %ebx, %edx	
	movl $4, %eax
	movl $1, %ebx
	leal num, %ecx
	int $0x80	
	
	
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
	
	
