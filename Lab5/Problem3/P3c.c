#include <stdio.h>

int funct1(int val4, int val3, int val2)
{
    //edx = 0x2345 = val4
    // esi = ecx = 0x1234 = val3
    //edi = eax = 0x54 = val2
    printf("Entered function1\n");
    val2 = val2 & 0xa;
    val4 = val4 | val2;
    val4 = val4 & 0x28;
    val4 = val4 + val4;
    return val4;
}

int funct2(int *val3, int *val4, int *val1)
{
    //eax = val1 = val4 at the end of funct1
    //rdx = 0x2345 = val4
    //rax = 0x1234 = val3
    //rsi = rax = 0x1234 = val3
    //rdi = format3 = "First value: %#x + second val: %#x = %#x"
    printf("First value: %#x + second val: %#x = %#x\n",*val3, *val4, *val3 + *val4);
}

void main()
{
    printf("Entered Main\n");
    int result, val1 = 0x1248, val2 = 0x54, val3 = 0x1234, val4 = 0x2345;
    val1 = funct1(val4, val3, val2);
    funct2(&val3,&val4,&val1);
    printf("Exiting program\n");
}