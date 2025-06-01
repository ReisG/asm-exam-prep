#include <stdio.h>

struct Node
{
    char payload;
    struct Node *right;
    struct Node *left;
};

unsigned __attribute__((fastcall)) tree_height_rec(struct Node* node);

struct Node a[3];
int main(void)
{
    a[0].right = &a[1];
    a[1].left = &a[2];

    unsigned result = tree_height_rec((struct Node*)&a);
    printf("%u", result);
}