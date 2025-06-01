all: main

choice.o: choice.c
	gcc choice.c -o choice.o -c

main: main.c choice.o
	gcc main.c choice.o -o main