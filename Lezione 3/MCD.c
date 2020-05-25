// Programma che calcola il MCD di due numeri a e b

#include <stdio.h>

int main(void){

	int a = 25; // da salvare in EAX
	int b = 30; // da salvare in EBX
	int result; // da salvare in ECX

	if (a==0 && b==0)
		result = 1;
	else if (a==0)
		result = b;
	else if (b==0)
		result = a;
	else {
		while (a!=b)
			if (a<b)
				b = b - a;
			else
				a = a - b;
		result = a; // MCD = a = b
	}

	printf("PROGRAMMA PER IL CALCOLO DEL MCD\n\n");
	printf("Valore richiesto: %i\n", result);
    
    // termino ritornando zero (chiusura senza errori)
    return 0;
}
