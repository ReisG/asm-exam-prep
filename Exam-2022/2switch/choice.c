int choice(int a, int b)
{
    switch(b)
    {
    case 3: return a & b;
    case 4: return a >> 2;
    case 5: return 5*a;
    case 6: return a + b; 
    default: return 0;
    }
}

