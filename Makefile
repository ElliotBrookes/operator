C_SOURCES = $(wildcard kernel/*.c kernel/drivers/*.c)
HEADERS = $(wildcard kernel/*.h kernel/drivers/*.h)
OBJ_FILES = ${C_SOURCES:.c=.o}

emulate: assemble compile-kernel create-image run

run:
	qemu-system-i386 img/os-img

assemble:
	cd boot
	nasm boot/boot_sect.asm -f bin -o bin/boot_sect.bin
	cd ..

compile-kernel: ${OBJ_FILES}
	nasm kernel/kernel_entry.asm -f elf32 -o bin/kernel_entry.o

	gcc -fno-pie -ffreestanding -m32 -c kernel/main.c kernel/drivers/ports.c kernel/drivers/screen.c
	ld -no-pie -melf_i386 -o bin/main.bin -Ttext 0x1000 bin/kernel_entry.o main.o screen.o ports.o --oformat binary

create-image:
	cat bin/boot_sect.bin bin/main.bin > img/os-img


show-hex: assemble
	od -t x1 -A n bin/boot_sect.bin

show-asm:
	gcc -ffreestanding -S kernel/main.c kernel/drivers/ports.c kernel/drivers/screen.c
