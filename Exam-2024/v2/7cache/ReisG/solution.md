page 64 bytes -> 6 bits

mem:
- 4 sets -> 2 bits
- 8 bytes data -> 3 bits

address: `0x98`

# solution

## TLB

```
10 | 011000
VPN  offset
```

tag = 2, p = 1, PPN = 4 good **TLB HIT**

VPN = 2
offset = 18
HIT? - yes
page good - yes
PPN = 4

now looking for `0100 011000` Phys addr

## mem

```
01000   |  11    |   000
tag        set      offset
```

**HIT**

mem set = 3
HIT? - yes

# ans
```
2
18
yes
yes
4
3
yes
```