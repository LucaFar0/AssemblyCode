.section .data

	init_status : .int 0

	sector_A : .int 0
	sector_A_MAX : .int 31
	sector_A_MIN : .int 0
	
	sector_B : .int 0
	sector_B_MAX : .int 31
	sector_B_MIN : .int 0
	
	sector_C : .int 0
	sector_C_MAX : .int 24
	sector_C_MIN : .int 0

	sbarra_IN : .int 0				#C/O	
	sbarra_OUT : .int 0				#67/79		67 + 0/12

.section .text
	.global assembly_main
	.type assembly_main, @function
	
assembly_main:
	pushl %ebp				#Mi salvo EBP sullo stack
	movl %esp, %ebp			#Imposto ESP = EBP
	movl 8(%ebp), %ecx		#Strigna input in ECX
	movl 12(%ebp), %edi		#Stringa output in EDI
	jmp start_main

pre_start_main:
	inc %ecx
	
start_main:

	leal sbarra_IN, %eax		#Setto sbarra a 0 = chiuso = 0+67 (C)
	movl $0, (%eax)
	
	leal sbarra_OUT, %eax
	movl $0, (%eax)

	movl init_status, %eax		#Prendo lo stato di init
	cmp $3, %eax
	jl init
	jmp not_init

init:
	call check_a
	cmp $1, %eax
	je init_a
	
	call check_b
	cmp $1, %eax
	je init_b
	
	call check_c
	cmp $1, %eax
	je init_c
	
	jmp next_line
	
init_a:
	leal sector_A, %eax
	movl $20, (%eax)
	inc %ecx
	inc %ecx
	
	jmp end_init
	
init_b:
	leal sector_B, %eax
	movl $20, (%eax)
	inc %ecx
	inc %ecx
	
	jmp end_init
	
init_c:
	leal sector_C, %eax
	movl $5, (%eax)	
	inc %ecx

end_init:
	leal init_status, %eax		#Incremento lo status di init
	addl $1, (%eax)
	jmp next_line

not_init:
	call check_in
	cmp $1, %eax
	je input

	call check_out
	cmp $1, %eax
	je output

	jmp print

input:
	cmpb $65, (%ecx)
	je input_a
	
	cmpb $66, (%ecx)
	je input_b
	
	cmpb $66, (%ecx)
	je input_c
	
	inc %ecx
	jmp print

input_a:	
	inc %ecx		# Leggo A
	
	movl sector_A_MAX, %eax
	cmp sector_A, %eax
	je print
	
	leal sector_A, %eax
	addl $1, (%eax)

	leal sbarra_IN, %eax
	movl $12, (%eax)
	
	jmp print
	
input_b:	
	inc %ecx		# Leggo B
		
	movl sector_B_MAX, %eax
	cmp sector_B, %eax
	je print
	
	leal sector_B, %eax
	addl $1, (%eax)

	leal sbarra_IN, %eax
	movl $12, (%eax)
	
	jmp print
	
input_c:		
	inc %ecx		# Leggo C
	
	movl sector_C_MAX, %eax
	cmp sector_C, %eax
	je print
	
	leal sector_C, %eax
	addl $1, (%eax)

	leal sbarra_IN, %eax
	movl $12, (%eax)
	
	jmp print
	
output:


	


	jmp print

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
	
	#eseguo la AND tra, il contenuto del settore e il suo massimo, sarà 1 solo se sono uguali
	movb $48, 12(%edi)		# Scrivo 0, se il massimo e il contenuto sono uguali sovrascrivo con 1
	movl sector_A, %eax
	and sector_A_MAX, %eax
	cmp $0, %eax
	jne sec_a_light
	movb $49, 12(%edi)
	
sec_a_light:
	movb $48, 13(%edi)
	movl sector_B, %eax
	and sector_B_MAX, %eax
	cmp $0, %eax
	jne sec_b_light
	movb $49, 13(%edi)
	
sec_b_light:
	movb $48, 14(%edi)
	movl sector_C, %eax
	and sector_C_MAX, %eax
	cmp $0, %eax
	jne sec_c_light
	movb $49, 14(%edi)
	
sec_c_light:	
	movb $10, 15(%edi)		#Scrivo il carattere \n e incremento EDI di 16 per continuare	
	addl $16, %edi
	
next_line:
	cmpb $10, (%ecx)		#Controllo se il prossimo carattere è \n allora nuova riga
	je pre_start_main
	jmp end_main

end_main:
	inc %ecx
	movb $0, 16(%edi)
	
	movl %ebp, %esp
	popl %ebp
	
	ret
