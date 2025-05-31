#include <stdio.h>
#include <stdlib.h>

int getmark(void)
{
    int mark = 2;
    printf("What's the definition of limit?\n");
    char buffer[10];
    scanf("%s", buffer);
    printf("I have heard enough!\n");
    return mark;
}

int main(void)
{
    char buffer[1000];
    int res = getmark();
    printf("Your mark is %d", res);

    // Had to add, doesn't load it otherwise
    system("sleep 1");    
    return 0;
}