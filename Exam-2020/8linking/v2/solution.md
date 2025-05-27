# Божья помощь 2

Переписываем код, пишем в консоли
```
gcc m1.c -o m1.o -c -fcommon
gcc m2.c -o m2.o -c -fcommon
nm m1.o m2.o
```

Получаем
```
m1.o:
                 U __isoc99_scanf
0000000000000000 T f
                 U integral
0000000000000018 T main
0000000000000000 b n
                 U printf

m2.o:
                 U f
0000000000000000 T integral
```

# Пишем ответ
```
m1.c; m1.o; printf; +; extern; -; .text
m1.c; m1.o; n; +; local; m1.o; .bss
m2.c; m2.o; n; -; -; -; -
m2.c; m2.o; integral; +; global; m2.o; .text
```