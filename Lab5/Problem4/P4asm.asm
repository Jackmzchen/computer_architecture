extern printf
extern exit
extern scanf

global _start
section .data
    format1 db "Entered Main", 0xa, 0x0
    format2 db "Please enter a string: ", 0xa, 0x0
    format3 db "%s", 0x0
    format4 db "Match found", 0xa, 0x0

section .text
length:
    push rbp
    mov rbp, rsp
    mov QWORD [rbp-0x18], rdi                             ; loads the array to use
    xor rcx, rcx                                          ; sets the counter to 0
check:
    mov rax, QWORD [rbp-0x18]                             ; prepares the array to be cycled
    add rax, rcx                                          ; sets the index of the array to look at
    mov al, BYTE [rax]                                    ; prepares the character within the array to look at
    add rcx, 0x1                                          ; increments the counter by 1
    cmp al, 0x0                                           ; if al !+ NULL
    jne check                                             ; loop
    mov rax, rcx                                          ; return the result of counter
    pop rbp
    ret                                                   ; return to _start
entangle:
    push rbp
    mov rbp, rsp
    sub rsp, 0x30
    mov QWORD [rbp-0x18], rdi          ; arr1
    mov QWORD [rbp-0x20], rsi          ; arr2
    mov QWORD [rbp-0x24], rdx          ; size       size error needs to be rdx not edx
    mov QWORD [rbp-0x4], 0x0           ; count
    mov QWORD [rbp-0x8], 0x0           ; flag
    ; xor -> [rbp-0x28]
        xor rax, rax
        xor rbx, rbx
        xor rcx, rcx
        mov ecx, DWORD [rbp-0x4]            ; count = 0
while:
    mov al, BYTE [rsi + rcx]
    mov bl, BYTE [rdi + rcx]
    test al, 0xFF
    je flag_0
    test dl, 0xFF
    je flag_0
    xor al, 0x22                            ;xor arr2[count] ^ 0x22
    mov DWORD [rbp-0x28], eax               ;xor arr2[count] ^ 0x22 
    cmp al, bl                              ;(al) arr2[count] = arr1[count](bl)
    jne flag_1
    mov edx, DWORD [rbp-0x24]   ;, edx       
    sub edx, 1
    mov DWORD [rbp-0x24], edx
    add ecx, 1
    mov DWORD [rbp-0x24], ecx
    jmp while

flag_1:
    mov DWORD [rbp-0x8], 1                    ;flag = 1
flag_0:
    mov eax, DWORD [rbp-0x8]
    ;cmp eax, 0x0                                                                                                                                                                                                                                                                                                              
    ;jne Done                               ; the printf on line 68 will never work because of this
    xor eax, eax
    mov rdi, format4
    call printf
    cmp eax, 0x0                            ;lines 64 and 65 moved here                                                                                                                                                                                                                                                                                                     
    jne Done  
Done:
    leave
    ret

_start:
    push rbp
    mov rbp, rsp
    sub rsp, 0x50

    xor eax, eax 
    mov rax, 0x5146504d55514352

    mov edx, 0x0
    mov QWORD [rbp-0x40], rax              ; char array [20]
    mov QWORD [rbp-0x38], rdx              ; movs 0 into address
    mov DWORD [rbp-0x30], 0x0              ; movs 0 into address
    mov rdi, format1                       ; Entered main
    xor eax, eax
    call printf                            ; Prints entered main
    mov rdi, format2                       ; Please enter a string
    mov eax, 0x0    
    call printf                            ; Prints Please enter a string

    lea rdi, [rbp-0x40]                    ; loads address of char array 20
    call length                            ; calls length/possibly passing the array
    sub RAX, 1                             ; subtracts 1 from rax reducing the extra increment returned

    mov DWORD [rbp-0x44], eax              ; value from length
    mov QWORD [rbp-0x20], 0x0              ; char new arr[20]

    mov QWORD [rbp-0x18], 0x0              ; stores zero at address making new variable
   
    mov DWORD [rbp-0x10], 0x0              ; stores 0 at address making new variable

    lea rsi, [rbp-0x20]                    ; loads the new array
    sub rsp, 0x8                           ; subs 8 from rsp
    lea rdi, [format3]                     ; loads %s from format3
    xor rax, rax                           ; sets rax to 0
    call scanf                             ; [moved up to line 97] calls scanf

    add rsp, 0x8                            ; adds 8 to rsp
    mov edx, DWORD [rbp-0x44]               ; loads value of eax from earlier
    lea rsi, [rbp-0x40]                     ; char array[20]
    lea rdi, [rbp-0x20]                     ; char new arr[20]

    call entangle
    xor rdi, rdi
    mov edi, 0x100
    call exit