.PHONY: main

main: main.c
	gcc main.c -o main -fno-stack-protector -m32 \
		-D_FORTIFY_SOURCE=0 -static-libgcc -static -fno-PIC -no-pie