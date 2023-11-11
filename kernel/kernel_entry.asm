; Ensures that we call the main() function of the kernel code instead of any other preceding asm
[bits 32]
[extern main]

    call main
    jmp $
