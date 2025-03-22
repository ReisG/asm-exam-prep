.data section mem alloc
```
a: 24 20 23 20 22 20 21 20
s: i n p u t 0
b: da ad ee bc
p: 12 a1 0e 08
```

using zero expantion
```
eax = 00 00 bc ee
```

problem, need to convert letter to number
using following c code

```c
#include <stdio.h>

int main(void)
{
    char i = 'i';
    // integer promotion happend everything's ok
    printf("%d\n", i); // 105
    return 0;
}
```

hope we have hex calculator in mashine class
but anyway we could use C

```
al + 105 = ee + 69 = |1| 57

CF = 1
OF = 0 // OF = CF ^ <last carry> = 1 ^ 1 = 0
ZF = 0
SF = (5 >= 8) = 0

eax = 00 00 bc 57 // now eax
```

last oparation
```
temp = 23 // mem loads
temp = 00 23 // mem expands
eax = 0x00000057 // new eax
```


Final answer:
```
(1) EAX = 0x0000bcee
(2) EAX = 0x0000bc57, CF = 1, OF = 0, ZF = 0, SF = 0
(3) EAX = 0x00000057
```