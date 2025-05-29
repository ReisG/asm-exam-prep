see `bush ebp` - **using stack pointer**

We see `endbr32` - using **INTEL CET**

see that we access `gs:20` == `gs:0x14` - using **cannary** (stack protector)

see that we access memory on address `ebp + 16` - all parameters are on the stack. Also we that function doesn't clean up it's params => **cdecl** 

stack representation:
```
mul
add
command

ret
ebp
---
---

cannary
00 00> <00 00>
00 00> <00 00
XX XX <3e 20 <- buffer

result
---
---
---

command
mul
---
--- 

---
--- 
command
&buffer <-esp
```

# Ответ
```
D
B E
6 5 4 10 12 21 8 2 21 1 21 4 6 21 4 3
```

## Замечание
Если становиться непонятно, что компилятор сделал, у нас всегда есть возможность переписать код ассемблера, дописать на C main, в котором вызовите функцию с красивыми параметрами (например, 1 2 3, не обязательно валидными), собрать с отладочными символами, и запустить gdb. Чтобы посмотреть содержание стека можно выполнить команду `x/30x $esp`. Можно поймать канарейку, нужно посмотреть регистр, пока он не затёрся (напрямую залезь по сегментному регистру не получается)