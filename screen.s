	.file	"screen.c"
	.text
	.globl	set_cursor
	.type	set_cursor, @function
set_cursor:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -4(%rbp)
	movl	$14, %esi
	movl	$980, %edi
	call	port_byte_out@PLT
	movl	-4(%rbp), %eax
	sarl	$8, %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$981, %edi
	call	port_byte_out@PLT
	movl	$15, %esi
	movl	$980, %edi
	call	port_byte_out@PLT
	movl	-4(%rbp), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$981, %edi
	call	port_byte_out@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	set_cursor, .-set_cursor
	.globl	get_cursor
	.type	get_cursor, @function
get_cursor:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$14, %esi
	movl	$980, %edi
	call	port_byte_out@PLT
	movl	$981, %edi
	call	port_byte_in@PLT
	movzbl	%al, %eax
	sall	$8, %eax
	movl	%eax, -4(%rbp)
	movl	$15, %esi
	movl	$980, %edi
	call	port_byte_out@PLT
	movl	$981, %edi
	call	port_byte_in@PLT
	movzbl	%al, %eax
	addl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addl	%eax, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	get_cursor, .-get_cursor
	.globl	get_row_from_offset
	.type	get_row_from_offset, @function
get_row_from_offset:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$1717986919, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$5, %edx
	sarl	$31, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	get_row_from_offset, .-get_row_from_offset
	.globl	get_offset
	.type	get_offset, @function
get_offset:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-8(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	addl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	get_offset, .-get_offset
	.globl	set_char_at_video_memory
	.type	set_char_at_video_memory, @function
set_char_at_video_memory:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movl	%esi, -24(%rbp)
	movb	%al, -20(%rbp)
	movq	$753666, -8(%rbp)
	movl	-24(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-20(%rbp), %eax
	movb	%al, (%rdx)
	movl	-24(%rbp), %eax
	cltq
	leaq	2(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$15, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	set_char_at_video_memory, .-set_char_at_video_memory
	.globl	move_offset_to_new_line
	.type	move_offset_to_new_line, @function
move_offset_to_new_line:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	get_row_from_offset
	addl	$1, %eax
	movl	%eax, %esi
	movl	$0, %edi
	call	get_offset
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	move_offset_to_new_line, .-move_offset_to_new_line
	.globl	clear_screen
	.type	clear_screen, @function
clear_screen:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L12
.L13:
	movl	-4(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, %esi
	movl	$0, %edi
	call	set_char_at_video_memory
	addl	$1, -4(%rbp)
.L12:
	cmpl	$1999, -4(%rbp)
	jle	.L13
	movl	$0, %edi
	call	set_cursor
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	clear_screen, .-clear_screen
	.globl	print_char
	.type	print_char, @function
print_char:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, %eax
	movb	%al, -20(%rbp)
	movl	$0, %eax
	call	get_cursor
	movl	%eax, -4(%rbp)
	movsbl	-20(%rbp), %eax
	movl	-4(%rbp), %edx
	movl	%edx, %esi
	movl	%eax, %edi
	call	set_char_at_video_memory
	movl	-4(%rbp), %eax
	addl	$2, %eax
	movl	%eax, %edi
	call	set_cursor
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	print_char, .-print_char
	.globl	print_string
	.type	print_string, @function
print_string:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$120, %edi
	call	print_char
	movl	$120, %edi
	call	print_char
	movl	$0, -4(%rbp)
	jmp	.L16
.L17:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	print_char
	addl	$1, -4(%rbp)
.L16:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L17
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	print_string, .-print_string
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
