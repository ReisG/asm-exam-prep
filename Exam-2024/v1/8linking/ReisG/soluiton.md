```
m1.c; m1.o; arr; +; local; m1.o; .bss
ml.c; m1.o; multiplier; +; global; m1.o, m2.o; COMMON
m1.c; m1.o; result; -; -; -; -
m2.c; m2.o; square; +; local; m2.o; .text
m1.c; m1.o; series_mult; +; global; m2.o; .text
```