#include <stdio.h>

int main()
{
    int EAX, EBX, ECX, EDX, request_code;
    printf("Please enter a value between 0 and 4: ");
    scanf(" %d", &request_code);
    
    __asm__ ("cpuid": "=a"(EAX), "=b"(EBX), "=c"(ECX), "=d"(EDX): "0"(request_code)); 
    printf("Request_code %x\nEAX: %x\nEBX: %x\nECX: %x\nEDX: %x\n", request_code, EAX, EBX, ECX, EDX);

    return 0;
}