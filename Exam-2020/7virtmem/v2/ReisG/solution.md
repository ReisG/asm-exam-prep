## Входные данные

page - 32 -> 5 bits

tlb:
- полностью ассоциативный

mem cache:
- 4 sets
- data = 8 bytes
- 2 channels

Запрашиваемый адрес `0x1ce`
# Решение

## TLB request
```
0x1ce = 0001110 01110
        |-----| |---|
         VPN(E) offset

```

Record E in TLB is valid. No need to do page walk. PPN = `4 = 100`.
So accessing physical address would be PA = `100 01110`

Присутствие, я полагаю, что это p = 1

## Cache lookup

```
100     01      110
|-|     \/      |-|
tag(4) set(1)  offset
```

Record in valid. 

# Ответ
```
E
E
yes
yes
4
1
yes
```