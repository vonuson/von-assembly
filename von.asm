; practice x86 assembly code
;
; Author: Von Uson
; Date: May 5, 2023

section .text:
    global _start           ; global directive is NASM specific, used to export symbols in your code
_start:                     ; tell linker where the entry point in the code is
    ; write syscall - ssize_t write(int fd, const void *buf, size_t count); 
    mov eax, 0x4            ; use write syscall
    mov ebx, 1              ; use stdout as the fd
    mov ecx, message        ; use message as the buf
    mov edx, message_length ; use the message_length as count
    int 0x80                ; invoke the syscall
    ; exit syscall void _exit(int status);
    mov eax, 0x1            ; use exit syscall
    mov ebx, 0              ; use 0 as status
    int 0x80                ; invoke the syscall

section .data:
    message: db "Hello World! - Von", 0xA
    message_length equ $-message