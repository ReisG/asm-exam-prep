#include <iostream>

using namespace std;

int main(void)
{
    // special case -128 10000000
    // !!!!!!!!!!!!!
    int res = 0; // -128 = 1 1110 000
    // !!!!!!!!!!!!

    for (char i = 0x81; i ^ (char)0x80; i++)
    {
        // printf("%d ", i);

        char t = i;
        char s = t >> 7 & 1;
        if (s) t = -t;

        char v = 7;
        while (v && !(t >> v & 1)) v--;

        // char frac = (t >> v - 3) & 0x7;
        if (i == 0) printf("\n\n%x\n\n", v + 0xfff & 0xfff);
        if (v > 3 && t & (1 << v - 3) - 1) continue;
        // !!!!!!!!!!!!
        if (i & 1 && v == 0
        || !(i & 1) && ((v + 0xfff & 0xfff) == 0 || t == 0))
        {
            res++;
            printf("%b %d\n", t, v);
        }
        // !!!!!!!!!!!1
    }

    cout << res << endl;
    return 0;
}