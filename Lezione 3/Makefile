AS = as --32
LD = ld -m elf_i386
FLAGS = -gstabs

all:
	$(AS) $(FLAGS) -o macchine_spritz_loop.o macchine_spritz_loop.s 
	$(LD) -o macchine_spritz_loop.x macchine_spritz_loop.o 
clean: 
	rm -f macchine_spritz_loop.o macchine_spritz_loop.x core
