# Решаем с божьей помощью

Я понял, что без проверки мне никак, поэтому переписываем код, компилируем его с так
```shell
gcc m1.c -o m1.o -c -fcommon
gcc m2.c -o m2.o -c -fcommon
```

И потом вызываем утилиту nm
```
nm m1.o m2.o
```

Получаем следующее

```shell
m1.o:
                 U __isoc99_scanf
0000000000000000 T f
                 U integral
0000000000000018 T main
0000000000000004 C n
                 U printf

m2.o:
                 U f
0000000000000000 T integral
0000000000000004 C n
```

Что нужно помнить про обозначения. Вообще доки можно почитать по `man nm`, но вообще:
- Большие буквы обычно обозначают глобальные символы, а маленькие - локальные
- `b` и `B` - bss
- `C` and `C` - common
- `d` and `D` - initialized data section (.data)
- `r` and `R` - read only
- `t` and `T` - text (code) section
- `U` - undefined

Про последние два не уверен, но пусть будут (там на самом деле ещё есть)
- `V` and `v` - weak symbol (manualy set)
- `W` and `w` not manually set 

## Отвечаем на вопросы

```
+; extern; m2.o; .text
+; global; m1.o, m2.o; COMMON
-; -; -; -
+; global; m2.o; .text

```