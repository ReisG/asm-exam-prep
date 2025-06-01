page size = 32 bytes -> 5 bits
4 sets -> 2 bits to encode

memcache:
- 16 byte in string -> 4 bits to encode
- 2 sets -> 1 byte to encode
- 2 channel

Address to obtain `0x123`

# solution
## TLB
```
0x123 = 0000 0001 0 | 01 | 00011
            tag       set  offset
```

set 1 doesn't store tag 2 **TLB miss**

VPN = 9
set = 1
HIT = NO

## Page walk

Asking for VPN = 9 -> PPN = 3. So physical address needed 0011 00011

## Cache lookup

```
0011  | 0  | 0011
tag     set  offset
```

set = 0 


# Answer

```
9
1
no 
yes
0 
3 
no 
-
```
```
```
