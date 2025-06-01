#include <iostream>

using namespace std;

int main(void)
{
    // special case -128 10000000
    int res = 1; // -128 = 1 1110 000

    for (char i = 0x81; i ^ (char)0x80; i++)
    {
        char t = i;
        char s = t >> 7 & 1;
        if (s) t = -t;

        char v = 7;
        while (v && !(t >> v & 1)) v--;

        if (v > 3 && t & (1 << v - 3) - 1) continue;
        res++;
        printf("%b %d\n", t, v);
    }

    cout << res << endl;
    return 0;
}