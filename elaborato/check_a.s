.section .data
.section .text
	.global check_a
	.type check_a, @function
	
check_a:
	# Leggo da %ecx, ritorno in eax 0 o 1 se l'input è A-
	movl $0, %eax
	
	cmpb $65, (%ecx)
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
