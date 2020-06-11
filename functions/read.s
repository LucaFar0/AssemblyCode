#Lettura di N caratteri da tastiera, ritorna in %eax

.section .data
	stringa		:	.ascii "----------"
	stringa_l 	: 	.long - stringa
	
.section .text
	.global read

.type read, @function

read:
	movl $3, %eax
	movl $0, %ebx
	movl $stringa_l, %ecx
	movl $stringa, %edx
	int $0x80
	
	mov $stringa, %eax
	
	ret