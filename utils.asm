;; ----------------------------------------------------------------------------
;; Utility functions
;; ----------------------------------------------------------------------------

;; ----------------------------------------------------------------------------
    SECTION .data
    ;; Structure used by usleep
timeval:
    tv_sec dd 0
    tv_usec dd 0

;; ----------------------------------------------------------------------------
    SECTION .text
    ;; Print string in %edi to stdout
    global fnPrintf
fnPrintf:
    mov eax, 4      ; write sys call
    mov ebx, 1      ; stdout
    mov ecx, edi    ; char string
    mov edx, esi    ; string length
    int 0x80        ; linux sys call
    mov eax, 0      ; return success
    ret             ; return

    ;; Sleep for %edi secs and %esi usecs
    global fnUsleep
fnUsleep:
    mov dword [tv_sec], edi
    mov eax, 1000
    mul esi         ; nano to micro
    mov dword [tv_usec], eax
    mov eax, 162
    mov ebx, timeval
    mov ecx, 0
    int 0x80
    ret

    ;; Exit program
    global fnExit
fnExit:
    mov ebx, 0
    mov eax, 1
    int 0x80
