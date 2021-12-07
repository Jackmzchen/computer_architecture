#include <stdio.h>

int length(char array[])
{
    int counter = 0;
    for(int counter = 0;array[counter] != '\0'; counter++)
        counter++;

    return counter;
}
void entangle(char arr1[], char arr2[], int length)
{
    int count = 0, flag = 0;
    while (length != 0)
    {
        if(arr2[count] & 0xFF == 0 || length & 0xFF == 0)
            flag = 0;
        arr2[count] = arr2[count] ^ 0x22;
        if(arr2[count] == arr1[count])
            flag = 1;
        length--;
        count++;
    }
    if(flag == 0)
    {
        printf("Match Found\n");
    }
}
void main()
{
    char array[20] = {"RCQUMPFQ"};
    printf("Entered Main\n");
    printf("Please enter a string\n"); 
    
    char new_arr[20] = {'\0'};
    scanf(" %s",&new_arr);
    int result = length(array);
    entangle(new_arr, array,result);
}