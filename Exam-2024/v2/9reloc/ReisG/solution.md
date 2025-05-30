day
```
a9 80 c3 08 0b 96 c4 08 1d 96 c4 08
```

rodata
```
|%s is %s...World|
| Bicycle Day.Jun|
|e 3.|
```

print_holiday `0x08c380d4`
first link print_holiday `1c b0 c4 09`

# solution

## R_386_32 is

looking at begining of .rodata. have addr on `World...` in struct `08c4960b`. World's offset from beg is `b`. So .rodata is in `08c49600`

ANS = `1 = 00 98 c4 08`

## R_386_PC32 in main

`is` in `0x08c380a9` (struct). link is at <is + 22>. print_holiday is at `0x08c380d4`

res = <hol> - (<is + 22> + 4) = 5

ans `05 00 00 00`

## third link print_holiday

data + 8, то есть тоже что и в первой ссылке, но сдвинутое на 8. Получаем `24 b0 c4 09`


# ans
```
1 = 00 98 c4 08
2 = 05 00 00 00
3 = 24 b0 c4 09
```