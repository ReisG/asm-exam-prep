```
m2.c; m2.o; end; +; global; m1.o, m2.o; COMMON
m2.c; m2.o; changer; +; global; m2.o; .data
m1.c; m1.o; mul2; +; local; m1.o: .text
m1.c; m1.o; result; -; -; -; -
m2.c; m2.o; init; +; global; m1.o; .data
```