all: main

.PHONY: main clean

clean:
	rm *.o main

main.o:
	nasm main.asm -o main.o -f elf32 -g

main: main.o
	gcc main.o -o main -m32 -g