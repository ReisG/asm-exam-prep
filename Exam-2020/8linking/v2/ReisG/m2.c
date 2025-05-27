double f(double x);

double integral(double a, double b, int n)
{
    double result = 0;
    double d = (b - a) / n;
    for (int i = 0; i < n; i++)
    result += f(a + d * (i + 0.5)) * d;
    return result;
}