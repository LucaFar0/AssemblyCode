// *********************
// filename: inline2.c
// *********************
// Per compilare:
// gcc -m32 -o inline2 inline2.c
// *********************
// Esempio di esecuzione:
// (local.delta)mrclcu12@livenet-host:~/Scrivania/Lezione6$ ./inline2
// Inserire val1: 12
// Inserire val2: 32
// Somma = 44
// *********************
#include <stdio.h>
int main() {
    int val1, val2, somma;
    printf("Inserire val1: ");
    scanf("%d",&val1);
    printf("Inserire val2: ");
    scanf("%d",&val2);
    __asm__("addl %%ebx, %%eax;"
        : "=a" (somma)
        : "a" (val1), "b" (val2)
    );
    printf("Somma = %d\n",somma);
    return 0;
}
