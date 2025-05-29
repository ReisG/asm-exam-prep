#include <stdio.h>

#define CANT() {cant++; continue;};
#define CAN() {res++; continue;};
int main(void)
{
    int res = 0, cant = 0;
    for (int i = 1 << 8; i < 1 << 9; i++)
    {
        int t = i;
        int s = (i >> 8) & 1;
        if (s) t = ~t + 1 & 0x1ff; // getting abs for 9 bit value
        
        // counting mantisa size
        int v = 8;
        while (~t >> v & 1) v--;
        if (v > 7) CANT();

        int left = v <= 4 ? 0 : t & ((1 << v - 4) - 1);
        if (left) CANT();

        CAN();
    }

    printf("can %d, cannot %d", res, cant); 
        //(1 << 8) - res);
    return 0;
}