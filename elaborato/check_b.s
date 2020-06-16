.section .data
.section .text
	.global check_b
	.type check_b, @function
	
check_b:
	# Leggo da %ecx, ritorno in eax 0 o 1 se l'input è B-
	movl $0, %eax
	
	cmpb $66, (%ecx)
	je first_check
	jmp end
	
first_check:
	cmpb $45, 1(%ecx)
	je second_check
	jmp end
	
second_check:
	movl $1, %eax
	inc %ecx
	inc %ecx

end:
	ret
