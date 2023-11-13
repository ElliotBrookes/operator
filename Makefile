C_SOURCES = $(wildcard kernel/*.c kernel/drivers/*.c)
HEADERS = $(wildcard kernel/*.h kernel/drivers/*.h)
OBJ_FILES = ${C_SOURCES:.c=.o}

emulate: assemble compile-kernel create-image run

run:
	qemu-system-x86_64 img/os-img

assemble:
	cd boot
	nasm boot/boot_sect.asm -f bin -o bin/boot_sect.bin
	cd ..

compile-kernel: ${OBJ_FILES}
	nasm kernel/kernel_entry.asm -f elf64 -o bin/kernel_entry.o
	gcc -ffreestanding -c kernel/main.c -o bin/main.o
	ld -o bin/main.bin -Ttext 0x1000 bin/kernel_entry.o $^ --oformat binary

create-image:
	cat bin/boot_sect.bin bin/main.bin > img/os-img


show-hex: assemble
	od -t x1 -A n bin/boot_sect.bin
