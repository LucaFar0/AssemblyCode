.section .data
.section .text
	.global itoa_2cifre
	.type itoa_2cifre, @function
	
itoa_2cifre:
	#leggo da %eax, riporto in %al e %ah

	# Mi salvo l'indirizzo della stringa in input, la riprendo a fine funzione
	pushl %ebx
	pushl %ecx
	pushl %edx
	pushl %esi
	
	movb $10, %bl
	divb  %bl

	addb $48, %ah
	addb $48, %al

	popl %esi
	popl %edx
	popl %ecx
	popl %ebx
	ret
