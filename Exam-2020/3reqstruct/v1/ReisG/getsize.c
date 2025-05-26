struct seq
{
    signed char c;
    short s;
    struct seq *next;
};

int f(struct seq *q)
{
    int t = q->c;
    t = q->s;
    t = q->next;

    if (!q) return 42;
    return (f(q->next) % 2) ? q->s : q->c;
}