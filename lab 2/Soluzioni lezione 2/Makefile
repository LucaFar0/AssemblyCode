AS = as --32
LD = ld -m elf_i386
FLAGS = -gstabs
NOME = confronto

all:
	$(AS) $(FLAGS) -o $(NOME).o $(NOME).s 
	$(LD) -o $(NOME) $(NOME).o 
	./$(NOME)
clean: 
	rm -f $(NOME).o $(NOME) core
