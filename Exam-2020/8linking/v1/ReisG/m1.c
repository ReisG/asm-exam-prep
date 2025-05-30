#include <stdio.h>

int n;

double f(double x)
{
    return x * x;
}

double integral(double a, double b);

int main(void)
{
    scanf("%d", &n);
    double result = integral(0, 1);
    printf("%f", result);
    return 0;
}