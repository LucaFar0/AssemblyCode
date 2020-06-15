.section .data

	sector_A : .long 0
	sector_A_MAX : .long 31
	sector_A_MIN : .long 0
	sector_A_light : .long 0
	#A_Pieno = cmp sector_A, sectorA_MAX
	
	sector_B : .long 0
	sector_B_MAX : .long 31
	sector_B_MIN : .long 0
	sector_B_light : .long 0
	
	sector_C : .long 0
	sector_C_MAX : .long 24
	sector_C_MIN : .long 0
	sector_C_light : .long 0

	sbarraIN : .long 0				#C/O	
	sbarraOUT : .long 0				#67/79		67 + 0/12

.section .text
	.global assembly_main
	.type assembly_main, @function
	
assembly_main:
	pushl %ebp				#Mi salvo EBP sullo stack
	movl %esp, %ebp			#Imposto ESP = EBP
	movl 8(%ebp), %ecx		#Strigna input in ECX
	movl 12(%ebp), %edi		#Stringa output in EDI
	
	xorl %edx, %edx			#Azzeramento registri ??
	xorl %eax, %eax
	xorl %ebx, %ebx

start_main:

	cmp $0, %ecx			#Se la riga è NULL
	je end_main






	#eseguo la AND tra, il contenuto del settore e il suo massimo, sarà 1 solo se sono uguali
	movl sector_A, sector_A_light
	and sector_A_MAX, sector_A_light
	
	movl sector_B, sector_B_light
	and sector_B_MAX, sector_B_light
	
	movl sector_C, sector_C_light
	and sector_C_MAX, sector_C_light
	
print:
	#output type OC-19-29-07-000\n
	movb $49, (%edi)
	movb $49, 1(%edi)
	movb $45, 2(%edi)		# -
	movb $49, 3(%edi)
	movb $49, 4(%edi)
	movb $45, 5(%edi)		# -
	movb $49, 6(%edi)
	movb $49, 7(%edi)
	movb $45, 8(%edi)		# -
	movb $49, 9(%edi)
	movb $49, 10(%edi)
	movb $45, 11(%edi)		# -
	movb sector_A_light, 12(%edi)
	movb sector_B_light, 13(%edi)
	movb sector_C_light, 14(%edi)
	movb $10, 15(%edi)		#Scrivo il carattere \n e incremento EDI di 16 per continuare
	
	addl $16, %edi
	addl $1, %ecx			#Aggiungo 1 a ECX, per iniziare ad analizzare una nuova riga
	jmp start_main

end_main:
	movb $0, 16(%edi)
	
	movl %ebp, %esp
	popl %ebp
	
	ret