all: main

main.o: main.c
	$(CC) main.c -c -o main.o -m32 -g

org.o: org.asm
	nasm org.asm -o org.o -f elf32 -g

main: main.o org.o
	$(CC) -Xlinker main.o org.o -o main -m32 -g

clean:
	rm *.o main

.PNONY: all