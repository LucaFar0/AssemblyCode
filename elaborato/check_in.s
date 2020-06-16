.section .data
.section .text
	.global check_in
	.type check_in, @function
	
check_in:
	# Leggo da %ecx, ritorno in eax 0 o 1 se l'input è IN-
	movl $0, %eax
	
	cmp $73, (%ecx)
	je first_check
	jmp end

first_check:
	cmp $78, 1(%ecx)
	je second_check
	jmp end

second_check:
	cmp $45, 2(%ecx)
	je third_check
	jmp end

third_check:
	movl $1, %eax

end:
	inc %ecx
	inc %ecx
	inc %ecx
	ret

