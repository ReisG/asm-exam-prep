# Input data

size of head = 32 * 4 = 128 bytes
search from current position
choose first fitting one

# Solution

## staring state
```
X 8/1 8/1 112/0 ... 112/0 0/1
```

## `p1 = malloc(24)`
```shell
          p1
          ↓
X 8/1 8/1 32/1 * * * * * * * 80/0 ... 80/0 0/1
```
$$U = \frac{called for}{total space} = \frac{24}{128}$$

## `p2 = malloc(17)`
```shell
          p1                  p2
          ↓                   ↓
X 8/1 8/1 32/1 * * * * * * * 24/1 * * * * * 56/0 ... 56/0 0/1
```
$$U = \frac{41}{128}$$

## p3 = malloc(4);
```shell
          p1                  p2            p3
          ↓                   ↓             ↓
X 8/1 8/1 32/1 * * * * * * * 24/1 * * * * * 8/1 * 48/0 ... 48/0 0/1
```
$$U = \frac{45}{128}$$

## `free(p2)`
```shell
          p1                                   p3
          ↓                                    ↓
X 8/1 8/1 32/1 * * * * * * * 24/0 @ @ @ @ 24/0 8/1 * 48/0 ... 48/0 0/1
```

$$U = \frac{28}{128}$$

## `p2 = malloc(48)`
48 + 4 = 52 bytes, only 48 avalible - **denial of service**
```shell
          p1                                   p3
          ↓                                    ↓
X 8/1 8/1 32/1 * * * * * * * 24/0 @ @ @ @ 24/0 8/1 * 48/0 ... 48/0 0/1
``` 
$$U = \frac{27}{128}$$

## `free(p1)`
```shell
                                            p3
                                            ↓
X 8/1 8/1 56/0 @ @ @ @ @ @ @ @ @ @ @ @ 56/0 8/1 * 48/0 ... 48/0 0/1
```
$$U = \frac{4}{128}$$

# Ответ
```
45/128
56/0 @ @ @ @ @ @ @ @ @ @ @ @ 56/0 
8/1 * 
48/0 @ @ @ @ @ @ @ @ @ @ 48/0
```