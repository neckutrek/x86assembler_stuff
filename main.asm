    SECTION .data
msg1:	db "Hello ", 0x0
len1:	equ $-msg1
msg2:	db "World!", 0xa, 0x0
len2:	equ $-msg2
timeval:
    tv_sec dd 0
    tv_usec dd 0

    SECTION .text
    global main

exit:
    mov ebx, 0
    mov eax, 1
    int 0x80

printf:
    mov eax, 4      ; write sys call
    mov ebx, 1      ; stdout
    mov ecx, edi    ; char string
    mov edx, esi    ; string length
    int 0x80        ; linux sys call
    mov eax, 0      ; return success
    ret             ; return

    ;; Sleep for %edi secs and %esi usecs
usleep:
    mov dword [tv_sec], edi
    mov eax, 1000
    mul esi         ; nano to micro
    mov dword [tv_usec], eax
    mov eax, 162
    mov ebx, timeval
    mov ecx, 0
    int 0x80
    ret

main:
    mov edi, msg1
    mov esi, len1
    call printf

    mov edi, 0
    mov esi, 500000
    call usleep

    mov edi, msg2
    mov esi, len2
    call printf

    jmp exit
