all: main

.PHONY: main clear

clear:
	rm *.o main

main.o: main.asm
	nasm main.asm -o main.o -f elf32 -g

main: main.o main.c
	gcc main.c main.o -o main -m32 -g