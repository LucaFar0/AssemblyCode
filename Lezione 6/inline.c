// *********************
// filename: inline.c
// *********************
// Per compilare:
// gcc -m32 -o inline inline.c
// *********************
// Esempio di esecuzione:
// (local.delta)mrclcu12@livenet-host:~/Scrivania/Lezione6$ ./inline
// Inserire val1: 12
// Inserire val2: 23
// Valori scambiati val1=23 val2=12
// *********************
#include <stdio.h>
int main() {
    int val1, val2;
    printf("Inserire val1: ");
    scanf("%d",&val1);
    printf("Inserire val2: ");
    scanf("%d",&val2);
    __asm__("movl %0, %%eax; movl %1, %%ebx;"
        "xchgl %%eax, %%ebx;"
        : "=r" (val1), "=r" (val2)
        : "r" (val1), "r" (val2)
        : "%eax", "%ebx"
    );
    printf ("Valori scambiati val1=%d val2=%d\n",val1,val2);
    return 0;
}
