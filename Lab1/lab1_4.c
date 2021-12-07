#include<stdio.h>

int main()
{
    char lval = 0;

    printf("=============================================================\n");
    printf("    %50s    \n", "uint8 used as a shorthand for unsigned int 8bits");
    printf(" %58s  \n","uint32 would be used as a shorthand for unsigned int 32bits");
    printf("=============================================================\n");

    
    printf("\n\tEnter a value in the range 0 -> 255 or -128 -> 127: ");
    scanf(" %hhd", &lval);
    
    printf("\n\t==========================================================");   
    printf("\n\tuint8 Hex | uint8 Char | int8 Hex | int8 Char | Binary\n"); 
    printf("\t==========================================================\n");
    printf("\t   %#02x %12d       %#02hhx %8hhd   ", (unsigned char)lval, (unsigned char)lval, (char)lval, (char)lval);

    printf("%4s 0b", " ");
    for(int count = 7; count > -1; count--)
        printf("%d", (lval >> count) & 1);

    printf("\n");
}