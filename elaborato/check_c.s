.section .data
.section .text
	.global check_c
	.type check_c, @function
	
check_c:
	# Leggo da %ecx, ritorno in eax 0 o 1 se l'input è C-
	movl $0, %eax
	
	cmp $67, (%ecx)
	je first_check
	jmp end
first_check:

	cmp $45, 1(%ecx)
	je second_check
	jmp end
second_check:

	movl $1, %eax
end:
	ret
