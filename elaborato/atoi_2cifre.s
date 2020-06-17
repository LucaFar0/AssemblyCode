.section .data
.section .text
	.global atoi_2cifre
	.type atoi_2cifre, @function
atoi_2cifre:
	# Legge da %ecx, fino a quando trova \n (escluso), eax contiene l'indirizzo dove salvare il valore letto, se il valore ha più di 2 cifre verranno troncate
	
	pushl %esi
	pushl %ebx
	pushl %edx
	
	pushl %eax	#Indirizzo del settore
	
	movl $0, %eax
	movb (%ecx), %al
	subb $48, %al		# al continene la prima cifra
	inc %ecx
	
	cmpb $10, (%ecx)	# se il prossimo carattere è \n fine
	je una_cifra

due_cifre:	
	movl $0, %ebx
	movb $10, %bl
	mulb %bl		# ax contiene al*10

	movb (%ecx), %bl
	subb $48, %bl		# bl continene la seconda cifra
	
	inc %ecx
	
	addb %al, %bl		# ebx contiene il valore

	
canc:				# ciclo per troncare il valore, faccio avanzare ecx
	cmpb $10, (%ecx)
	je end
	inc %ecx
	jmp end

una_cifra:
	movl $0, %ebx
	movb %al, %bl
end:
	popl %eax		# Recupero l'indirizzo del settore e li ci salvo il valore
	movl %ebx, (%eax)
	
	popl %edx
	popl %ebx
	popl %esi
	
	ret
