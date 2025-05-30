# First

Doing backwards
```
0000 23a0
``
Короче, код откусывает правый полубайт от исходного состояния eax. Получается, что сначала в eax = 0000 23a?

Mem layout ids
```
x = 0x1234 0x5678
34 12 78 56 - mem
requested 12 78 mem
ax = 78 12 + there was a sign
```
Получается, что в asm было написано
```
x dw 0xa??? 0x??23
```

# second


```
becafeba now do ror 56
cafebabe - ans
```

# third

shl 3
shl 1
```
eax = 1caffca0
eax = ?1caffca -before

x db ca ff ca ?1
```