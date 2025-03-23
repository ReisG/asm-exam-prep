Full code
```C
#define N 1024
unsigned int u[N], v[N], r[N];
unsigned int n;
...
for (unsigned i = n; i > 0; i--) {
    u[i] = r[i] % 5 ? r[i] % 5 : r[i] / 5; 
    v[i - 1] = r[i] >> 1;
}
```

So answer is
```
i > 0; i--
u[i] = r[i] % 5 ? r[i] % 5 : r[i] / 5;
v[i - 1] = r[i] >> 1;
```
