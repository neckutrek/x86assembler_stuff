release: main.asm
	nasm -f elf64 -o main64.o main.asm
	ld -m elf_x86_64 -o main64 main64.o

debug: main.asm
	nasm -felf64 -g -F dwarf -o main64.o main.asm
	nasm -felf64 -g -F dwarf -o utils64.o utils.asm
	gcc -no-pie -o main64 utils64.o main64.o

clean:
	rm -rf *.o *~ main64

