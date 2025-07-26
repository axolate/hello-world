.code16

.section .text
.global _start
_start:
    cli
    xor %ax, %ax
    mov %ax, %ds
    mov %ax, %es
    mov $0x2000, %sp
    xor %ax, %ax
    cld
    
    lea text, %si
    call print

    hlt
print:
    lodsb
    cmpb $0, %al
    je 1f

    movb $0x0E, %ah
    int $0x10

    jmp print
1: ret
text:
    .asciz "Hello, world!"

.fill 510-(.-_start), 1, 0
.word 0xAA55
