.section .data

testo:
	.ascii "100+33+68 = "

testo_len:
	.long . - testo			# lunghezza della stringa testo

somma:
	.ascii "000\n"			# variabile somma di tipo ascii che conterra' il risultato da stampare

.section .text
	.global _start

_start:

	movl $100, %eax			# il registro EAX contiene il numero 100

	addl  $33, %eax			# sommo 33 al registro EAX che ora contiene il numero 133

	addl  $68, %eax			# sommo 68 al registro EAX che ora contiene il numero 201

	# in realta' il risultato e' tutto contenuto in AL perche' e' esprimibile in 8 bit,
	# quindi tutto il resto del registro EAX e' posto  0.
	# Per questo motivo posso lavorare con divisioni tra byte.
	# PS: uso il trucco di successive divisioni per 10 per estrarre le cifre da stampare 
	#     e convertirle in ASCII

	leal somma, %esi		# assegno al registro ESI l'indirizzo di memoria di "somma"

	movl $10, %ebx
	div %bl					# divido per 10 in byte, il risultato sarà in AL (quoziente) e AH (resto)
	addb $48, %ah			# sommo 48 al resto della divisione (prima cifra del numero)
	movb %ah, 2(%esi)		# sposto AH nel terzo byte della stringa somma (indirizzamento indicizzato: aggiungo 2 all'indirizzo caricato in %esi)
	xorb %ah, %ah			# azzero il registro AH

	# ripeto la procedura precedente per altre due volte.

	div %bl					# divido per 10 in byte, il risultato sarà in AL (quoziente) e AH (resto)
	addb $48, %ah			# sommo 48 al resto della divisione
	movb %ah, 1(%esi)		# sposto AH nel secondo byte della stringa somma (indirizzamento indicizzato: aggiungo 1 all'indirizzo caricato in %esi)
	xorb %ah, %ah			# azzero il registro AH

	div %bl					# divido per 10 in byte, il risultato sarà in AL (quoziente) e AH (resto)
	addb $48, %ah			# sommo 48 al resto della divisione
	movb %ah, (%esi)		# sposto AH nel primo byte della stringa somma (indirizzamento diretto: uso direttamente l'indirizzo caricato in %esi)

	# stampa a video del testo introduttivo

	movl $4, %eax			# syscall WRITE
	movl $1, %ebx			# terminale
	leal testo, %ecx  		# carico l'indirizzo della stringa "testo"
	movl testo_len, %edx	# lunghezza della stringa
	int $0x80				# eseguo la syscall

	# stampa a video della variabile somma

	movl $4, %eax			# syscall WRITE
	movl $1, %ebx			# terminale
	leal somma, %ecx  		# carico l'indirizzo della stringa "somma"
	movl $4, %edx			# stringa di 3 caratteri + andata a capo (quindi lunghezza 4)
	int $0x80				# eseguo la syscall

	# termino il programma

	movl $1, %eax			# syscall EXIT
	movl $0, %ebx			# codice di uscita 0
	int $0x80				# eseguo la syscall
