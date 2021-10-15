global start

section .text
bits 32
start:
    ;Print 'OK'
    ;mov ah, 0x0e
    ;mov al, 'H'
    ;int 0x10

    mov dword [0xb8000], 0x2f4b2f4f

    hlt
    jmp $

times 510 - ($-$$) db 0
dw 0xaa55


