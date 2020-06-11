# *********************
# filename: c-asm-funz.s
# *********************
# Per compilare:
# gcc -m32 -c -o c-asm.o c-asm.c
# gcc -m32 -c -o c-asm-funz.o c-asm-funz.s 
# gcc -m32 -o c-asm c-asm.o c-asm-funz.o
# *********************
# Esempio di esecuzione:
# (local.delta)mrclcu12@livenet-host:~/Scrivania/Lezione6$ ./c-asm 
# Inserire base: 2
# Inserire esponente: 4
# Valore della potenza = 16
# *********************

.data
.text
    .global pot_asm         # funzione deve essere globale

pot_asm:
    pushl %ebp              # event. chiamate nidificate
    movl %esp, %ebp         # imposto %ebp
    movl 8(%ebp), %ebx      # leggo la base
    movl 12(%ebp), %ecx     # leggo l'esponente
    xorl %edx, %edx         # azzero %edx
    movl $1, %eax           # imposto accumulatore
ciclo:
    mull %ebx               # %eax = %eax*%ebx
    loopl ciclo             # ciclo %ecx volte

# al termine il risultato si trova in %eax

popl %ebp                   # ripristino %ebp precedente
ret
