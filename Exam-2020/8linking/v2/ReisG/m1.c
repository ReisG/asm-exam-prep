#include <stdio.h>

static int n;

double f(double x)
{
    return x * x;
}

double integral(double a, double b, int n);

int main(void)
{
    scanf("%d", &n);
    double result = integral(0, 1, n);
    printf("%f", result);
    return 0;
}