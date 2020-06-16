.section .data
.section .text
	.global itoa_2cifre
	.type itoa_2cifre, @function
	
itoa_2cifre:
	#leggo da %eax, riporto in %eax e %ebx	

	# Mi salvo l'indirizzo della stringa in input, la riprendo a fine funzione
	pushl %ecx

	movl $0, %ecx			# carica il numero 0 in %ecx

	cmp $10, %eax
	jge due_cifre			# Ha due cifre
	
una_cifra:
	movl %eax, %ebx		# cifra in ebx
	addl $48, %ebx
	
	movl $48, %eax			# 0 in eax
	
	jmp end

due_cifre:
	movl  $0, %edx			# Setto %edx a 0 in quanto la divizione concatena edx+eax
	movl $10, %ebx
	divl  %ebx

	addl $48, %edx			# Aggiungo 48 e salvo sullo stack
	movl %edx, %ebx		# salvo la cifra meno significativa
	
	add $48, %eax	
	jmp end

end:
	popl %ecx
	ret
