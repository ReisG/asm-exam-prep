#include <stdio.h>

void copy(char* command, int add, short *mul);

int main(void)
{
    copy((void *)1, 2, (void *)3);
    return 0;
}