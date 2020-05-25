AS = as --32
LD = ld -m elf_i386
FLAGS = -gstabs
NOME = hello

all:
	$(AS) $(FLAGS) -o $(NOME).o $(NOME).s 
	$(LD) -o $(NOME).x $(NOME).o 
clean: 
	rm -f hello.o hello.x core
