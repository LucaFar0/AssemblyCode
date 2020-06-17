all:
	gcc -m32 -gstabs -c -o parking.o parking.c
		
	gcc -m32 -gstabs -c -o check_a.o check_a.s
	gcc -m32 -gstabs -c -o check_b.o check_b.s
	gcc -m32 -gstabs -c -o check_c.o check_c.s
	
	gcc -m32 -gstabs -c -o check_in.o check_in.s
	gcc -m32 -gstabs -c -o check_out.o check_out.s

	gcc -m32 -gstabs -c -o atoi_2cifre.o atoi_2cifre.s	
	gcc -m32 -gstabs -c -o itoa_2cifre.o itoa_2cifre.s
	
	gcc -m32 -gstabs -c -o assembly_main.o assembly_main.s
	
	gcc -m32 -gstabs -o parking parking.o check_a.o check_b.o check_c.o check_in.o check_out.o atoi_2cifre.o itoa_2cifre.o assembly_main.o
	
	./parking testin.txt testout.txt
