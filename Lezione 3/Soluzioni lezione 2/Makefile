AS = as --32
LD = ld -m elf_i386
FLAGS = -gstabs

all:
	$(AS) $(FLAGS) -o 3add.o 3add.s 
	$(AS) $(FLAGS) -o confronto.o confronto.s 
	$(LD) -o 3add.x 3add.o 
	$(LD) -o confronto.x confronto.o 
clean: 
	rm -f *.o *.x core
