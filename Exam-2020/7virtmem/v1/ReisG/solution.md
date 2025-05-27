# Входные данные
Размер страницы = 32 байта -> требуется для кодирования 5 бит

tlb:
- 2 sets -> 1 bit to encode
- size of page 32 bytes -> 5 bit to encode

mem cache:
- 8 bytesize -> 3 bits to encode
- 8 sets -> 3 bits to encode
- direct mapping

address to obtain: `0xb0`

# Solution

## Accessing TLB
`0xb0 = 10110000`

First try to get data from TLB. It allows as to get cached data directly using *virtual address*

offest inside page consumes 5 bits. 1 bit to distinguish sets. Rest is for tag

```
10  1   10000
\/  |   |---|
tag set offset
(2) (1) 
```

Looking up in TLB. Record in set 1 with tag 2 exists but it's to valid (v = 0). So **TLB MISSED**

Interim results
- VPN = `0b101 = 0x5`
- TLB requesting set = `1`
- TLB HIT? - `no`


## Doing Page walk

Now we need to translate our VPN (virtual page number) to PPN (physical page number). We must request value, place in VPN = 5.

Looking at the table. VPN = 5 tranlates to PPN = 4 and this record is valid (p = 1).

Interim results
- Is this page available? - `yes`

## Requesting cache

Now we need to access physical address `0b100 10000`

Cache stores 8 byte strings, using 8 sets

```
10  010    000
\/  |-|    |-|
tag set  offset
(2) (2)
```

Looking up the cache table. Set 2 countains data with tag 1 but not 2 **Memory cache miss**

Interim results
- Mem cache set id `2`
- Mem cache tag `2`
- Mem cache hid - `no`

# Answer
```
5
1
no
yes
2
2
no
```