.section .data

titolo:
	.ascii "PROGRAMMA PER LA DIVISIONE INTERA\n\n"

titolo_len:
	.long . - titolo		# lunghezza del titolo

ricDividendo:
	.ascii "Inserire dividendo: "

ricDividendo_len:
	.long . - ricDividendo

ricDivisore:
	.ascii "Inserire divisore: "

ricDivisore_len:
	.long . - ricDivisore

risultato:
	.ascii "Risultato divisione: "

risultato_len:
	.long . - risultato

new_line_char:
	.byte 10

.section .text
	.global _start

_start:
	# stampa a video del titolo
	movl $4, %eax			# syscall WRITE
	movl $1, %ebx			# terminale
	leal titolo, %ecx  		# carico l'indirizzo della stringa
	movl titolo_len, %edx	# lunghezza della stringa
	int $0x80				# eseguo la syscall
	
	# stampa a video della richiesta del dividendo
	movl $4, %eax				# syscall WRITE
	movl $1, %ebx				# terminale
	leal ricDividendo, %ecx 	# carico l'indirizzo della stringa
	movl ricDividendo_len, %edx	# lunghezza della stringa
	int $0x80					# eseguo la syscall
	
	call atoi				# lettura da tastiera del dividendo, viene salvato in EAX
	pushl %eax				# salvo sullo stack prima di rilanciare atoi

	# stampa a video della richiesta del divisore
	movl $4, %eax				# syscall WRITE
	movl $1, %ebx				# terminale
	leal ricDivisore, %ecx 		# carico l'indirizzo della stringa
	movl ricDivisore_len, %edx	# lunghezza della stringa
	int $0x80					# eseguo la syscall

	call atoi				# lettura da tastiera del divisore, viene salvato in EAX

	movl %eax,%ebx			# sposto il divisore in EBX
	popl %eax				# ricarico dallo stack il dividendo in EAX
	xorl %edx, %edx			# svuoto EDX
	divl %ebx				# divido per EBX (la divisione fara' (EDX EAX) : EBX), 
							# il risultato e' in EAX
	pushl %eax				# salvo sullo stack il risltato prima di stampare

	# stampa a video del testo per il risultato
	movl $4, %eax				# syscall WRITE
	movl $1, %ebx				# terminale
	leal risultato, %ecx 		# carico l'indirizzo della stringa
	movl risultato_len, %edx	# lunghezza della stringa
	int $0x80					# eseguo la syscall

	popl %eax					# ricarico dallo stack il risultato in EAX

	call itoa					# chiamo itoa per stampare il numero in EAX

	movl $1, %eax				# uscita
	movl $0, %ebx
	int $0x80
