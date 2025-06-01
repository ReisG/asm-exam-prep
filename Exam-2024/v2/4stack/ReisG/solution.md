stdcall all on stack + clearing stack

using ebp

CET, cannary

```
count XX XX
command

ret
ebp
---
---

cannary
00 00 00 00
00 00 00 00
00> 00 00 00

XX <28 82 00 <- buffer
XX XX result
---
---

command
count XX XX
---
---

----
count
command
<buffer + 2>
```

# andswer
```
C
AD
4 6 21 11 20 9 2 20 3 20 6 20 4 20 4 6 1
```