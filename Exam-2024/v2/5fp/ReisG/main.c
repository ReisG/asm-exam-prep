#include <stdio.h>

int main(void)
{
    int res = 0;

    #define NO {continue;}
    #define YES {res++; printf("%b\n", t); continue;}
    for (int i = 1; i < 1 << 8; i++)
    {
        int s = (i >> 8) & 1;

        int t = i;
        if (s) t = (~t + 1) & 0x1ff;

        // mant size
        int v = 8;
        while (v && !((t >> v) & 1)) v--;
        
        if (v > 7) NO;
        if (v >= 4 && t & ((1 << v - 4) - 1)) NO;
        YES;
    }

    printf("%d", res);
    return 0;
}