// *********************
// filename: c-asm.c
// *********************
// Per compilare:
// gcc -m32 -c -o c-asm.o c-asm.c
// gcc -m32 -c -o c-asm-funz.o c-asm-funz.s 
// gcc -m32 -o c-asm c-asm.o c-asm-funz.o
// *********************
// Esempio di esecuzione:
// (local.delta)mrclcu12@livenet-host:~/Scrivania/Lezione6$ ./c-asm 
// Inserire base: 2
// Inserire esponente: 4
// Valore della potenza = 16
// *********************

extern int pot_asm(int b, int e);

#include <stdio.h>

int main() {
    int base, esp, potenza;
    printf("Inserire base: ");
    scanf("%d",&base);
    printf("Inserire esponente: ");
    scanf("%d",&esp);
    potenza=pot_asm(base,esp);
    printf ("Valore della potenza = %d\n",potenza);
    return 0;
}
