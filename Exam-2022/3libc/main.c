#include <stdio.h>
#include <stdlib.h>

int *callall(void* ar);

int main(void)
{
    int a = 1;
    int b = 2;

    char *tt[] = {"%d %d", "%d"};
    void* tr[] = {(void*)2, (void*)3, &scanf, tt[0], &a, &b, (void*)2, &printf, tt[1], (void*)(a + b)};
    int *res = callall(tr);
    for (int i = 0; i < (int)tr[0]; i++)
    {
        printf("%d\n", res[i]);
    }
    return 0;

}