EXE = divisione
AS = as --32
LD = ld -m elf_i386
FLAGS = -gstabs 
OBJ = divisione.o itoa.o atoi.o 

all: $(OBJ) 
	$(LD) -o $(EXE) $(OBJ) 
divisione.o: divisione.s 
	$(AS) $(FLAGS) -o divisione.o divisione.s 
itoa.o: itoa.s 
	$(AS) $(FLAGS) -o itoa.o itoa.s 
atoi.o: atoi.s 
	$(AS) $(FLAGS) -o atoi.o atoi.s 
clean: 
	rm -f *.o $(EXE) core
