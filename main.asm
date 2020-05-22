;; ----------------------------------------------------------------------------
;; Main program
;; ----------------------------------------------------------------------------

;; ----------------------------------------------------------------------------
    SECTION .data
msg1:	db "Hello ", 0x0
len1:	equ $-msg1
msg2:	db "World!", 0xa, 0x0
len2:	equ $-msg2

;; ----------------------------------------------------------------------------
    SECTION .text
    global main
    extern fnUsleep, fnPrintf, fnExit

main:
    mov edi, msg1
    mov esi, len1
    call fnPrintf

    mov edi, 0
    mov esi, 500000
    call fnUsleep

    mov edi, msg2
    mov esi, len2
    call fnPrintf

    jmp fnExit
