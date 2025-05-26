#include <stdio.h>

struct seq
{
    unsigned char c;
    struct seq *next;
    unsigned short s;
};

extern int f(struct seq *q);

int main(void)
{
    printf("%d", f(&(struct seq) {.s=2020, .c=1, .next=NULL}));
}