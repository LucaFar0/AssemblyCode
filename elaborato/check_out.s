.section .data
.section .text
	.global check_out
	.type check_out, @function
	
check_out:
	# Leggo da %ecx, ritorno in eax 0 o 1 se l'input è OUT-
	movl $0, %eax
	
	cmpb $79, (%ecx)
	je first_check
	jmp end

first_check:
	cmpb $85, 1(%ecx)
	je second_check
	jmp end

second_check:
	cmpb $84, 2(%ecx)
	je third_check
	jmp end

third_check:
	cmpb $45, 3(%ecx)
	je fourth_check
	jmp end
	
fourth_check:
	movl $1, %eax

end:
	inc %ecx
	inc %ecx
	inc %ecx
	inc %ecx
	ret

