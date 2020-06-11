######################
# filename: somma_c.s
######################
# Per compilare:
# as --32 -o somma_c.o somma_c.s
# ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -lc -o somma somma_c.o
######################
# Esempio di esecuzione:
# (local.delta)mrclcu12@livenet-host:~/Scrivania/Lezione6$ ./somma
# Inserire un valore: 12
# Inserire un valore: 12
# Somma = 24
######################

.section .bss
    val1: .long 0   # primo valore di input
    val2: .long 0   # secondo valore di input
    ris: .long 0    # risultato
.section .data
    invito: .string "Inserire un valore: "  # stringa terminata con \0
    formato: .string "%d"                   # formato input
    risultato: .string "Somma = %d\n"       # stringa per risultato
.section .text
    .global _start
_start:
    # Input primo valore
    pushl $invito
    call printf
    addl $4, %esp	# aggiungo 4 byte ad esp per riportare indietro lo stack di una pushl
    pushl $val1
    pushl $formato
    call scanf
    addl $8, %esp	# aggiungo 8 byte ad esp per riportare indietro lo stack di due pushl

    # Input secondo valore
    pushl $invito
    call printf
    addl $4, %esp
    pushl $val2
    pushl $formato
    call scanf
    addl $8, %esp

    # Calcolo val1 + val2
    movl (val2), %eax
    addl (val1), %eax
    movl %eax, (ris)
    # Stampa risultato
    pushl (ris)
    pushl $risultato
    call printf
    addl $8, %esp

fine:
    movl $1, %eax
    int $0x80
