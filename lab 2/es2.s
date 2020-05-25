.section .data
	ma : .ascii " è maggiore di "
	ma_l : .long - ma
	
	mi : .ascii " è minore di "
	mi_l : .long - mi
	
	u : .ascii " è uguale a "
	u_l : .long - u

.section .text
	.global _start
_start:
	
	cmp %eax, %ebx
	
