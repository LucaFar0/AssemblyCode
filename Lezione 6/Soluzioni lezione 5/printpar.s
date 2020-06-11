.section .data

new_line_char:
	.byte 10

.section .text
	.global _start

_start:
	popl %ecx		# copia in ECX la cima dello stack (numero argomenti)
	popl %ecx		# copia in ECX la cima dello stack (nome programma lanciato)

handle_par:
	popl %ecx
	testl %ecx, %ecx	# controlla se ECX e' 0 (NULL, test fa l'AND bit a bit di ECX con se stesso)
	jz fine
	call print_par		# stampa il parametro
	jmp handle_par

fine:
	movl $1, %eax		# uscita
	movl $0, %ebx
	int $0x80



.type print_par, @function
print_par:
	call count_char		# per stampare, devo prima sapere il numero di caratteri del parametro
	movl $4, %eax		# EDX ora contiene il numero di caratteri da stampare, posso invocare la system call WRITE
	movl $1, %ebx
	int $0x80

	movl $4, %eax		# stampo il carattere new line
	movl $1, %ebx
	leal new_line_char, %ecx
	movl $1, %edx
	int $0x80
	
	ret


# --------------------------------------
.type count_char, @function

count_char:
	xorl %edx, %edx				# Azzero EDX (alla fine conterra' il numero di caratteri)

iterate:
	movb (%ecx,%edx), %al		# Carica in AL il carattere puntato da ECX+EDX
	testb %al, %al				# Controlla se la stringa e' finita (\0) 
	jz end_count				# Se la stringa e' finita, la funzione termina 
	incl %edx					# Se la stringa non e' finita, incremento EDX e itero
	jmp iterate

end_count:
	ret
	


