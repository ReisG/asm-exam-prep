.PHONY: main

main: main.c
	gcc main.c -o main -fno-stack-protector -m32 \
		-D_FORTIFY_SOURCE=0 -static-libgcc -static -fno-pic -no-pie

killSLAR:
	sudo cat /proc/sys/kernel/randomize_va_space > SLARconfig.txt
	sudo echo 0 | sudo tee /proc/sys/kernel/randomize_va_space

aliveSLAR:
	sudo cat SLARconfig.txt | sudo tee /proc/sys/kernel/randomize_va_space