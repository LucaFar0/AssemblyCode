#calcolare quante macchine servono al minimo a n persone per andare a prendere un spritz

.section .data
	titolo: 
		.ascii "Calcolo numero auto\n\n"
	titolo_len:
		.long . - titolo
	risposta:
		.ascii "Totale auto neccessarie: "
	risposta_len:
		.long . - risposta
	numStudenti:
		.long 87
	numStudPerAuto:
		.long 5
	numAuto:
		.ascii "000\n"	#tra 0 e 999 macchine, non  faccio la fariabile lunghezza in quanto so sono 4 caratteri

.section .text
	.global _start
	
_start:
	#nelle divisioni, se op è un byte(8bit)
	#	dividendo in AX
	#	quoziente in AL
	#	resto in AH
	#nelle divisioni, se op è una world(16bit)
	#	dividendo in DX e AX concatenati
	#	quoziente in EAX
	#	resto in EDX
	#nelle divisioni, se op è un long
	#	dividendo in EDX e EAX concatenati (32 bit)
	#	quoziente in EAX
	#	resto in EDX
	
	movl numStudenti, %eax;
	movl numStudPerAuto, %ebx
	
	# il divisore (5) è un byte
	divb %bl
	# otteniamo il risultato in AL e il resto in AH
	
	# verifichiamo se ce resto
	cmpb $0, %ah
	je continua			# se non ce resto proseguo
	incb %al			# aumento di 1 il risultato
	xorb %ah, %ah		# azzero AH
	
continua:
	# carico in ESI l'indirizzo della variabile dove vogliamo mettere il risultato
	leal numAuto, %esi
	
	# convertiamo il numero in decimale, il risultato è ancora il AL, non serve trasferirlo
	movl $10, %ebx
	divb %bl
	addb $48, %ah		# convertola prima cifra in ascii
	movb %ah, 2(%esi)	# metti in ESI+2(unita) ah
	xorb %ah, %ah
	
	divb %bl
	addb $48, %ah
	movb %ah, 1(%esi)	# metti in ESI+1(decine) ah
	xorb %ah, %ah
	
	divb %bl
	addb $48, %ah
	movb %ah, %esi		# metti in ESI(centinaia) ah
	# xorb %ah, %ah		Non lo usiamo piu non serve azzerarlo
	
stampa:
	#per stampare:
	# 4 in EAX
	# 1 in EBX
	# stringa in ECX
	# lunghezza in EDX
	# lanciare in 0x80

	movl $4, %eax
	movl $1, %ebx
	leal titolo, %ecx
	movl titolo_len, $edx
	int $0x80
	
	movl $4, %eax
	movl $1, %ebx
	leal risposta, %ecx
	movl risposta_len, $edx
	int $0x80
	
	movl $4, %eax
	movl $1, %ebx
	leal numAuto, %ecx
	movl $4, $edx
	int $0x80
	
uscita:	
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	