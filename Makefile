boot:
	qemu-system-x86_64 img/os-img

assemble:
	nasm boot_sect.asm -f bin -o bin/boot_sect.bin

compile-kernel:
	nasm kernel_entry.asm -f elf64 -o bin/kernel_entry.o
	gcc -ffreestanding -c main.c -o main.o
	ld -o bin/main.bin -Ttext 0x1000 bin/kernel_entry.o main.o --oformat binary

create-image:
	cat bin/boot_sect.bin bin/main.bin > img/os-img

emulate: assemble compile-kernel create-image boot

show-hex: assemble
	od -t x1 -A n bin/boot_sect.bin
