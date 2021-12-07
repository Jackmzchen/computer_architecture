#include <stdio.h>

int additup(int val1, int val3, int val2)
{
    
    val2 = val2 & 0xa;                  //and eax, 0xa
    val3 = val3 & 0x14;                 //and eax , 0x14
    val3 = val2 | val3;                 //or edx , eax
    val1 = val1 & 0x28;                 //and eax , 0x28
    val1 = val1 + val3;                 //add eax, edx
    return val1;
}

void main()
{
    int result, val1 = 60, val2 = 170, val3 = 54, val4 = 200;
    result = additup(val1, val3, val2);
    printf("My answer is >> Dec: %d Hex: %X",result, result);
}