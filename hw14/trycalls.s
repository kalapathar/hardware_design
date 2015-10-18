	.file	"trycalls.c"
	.text
	.globl	_Z4iteri
	.type	_Z4iteri, @function
_Z4iteri:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$1, -8(%rbp)
	movl	$1, -4(%rbp)
.L3:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jg	.L2
	movl	-8(%rbp), %eax
	imull	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
	addl	$1, -4(%rbp)
	jmp	.L3
.L2:
	movl	-8(%rbp), %eax
	cltq
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z4iteri, .-_Z4iteri
	.globl	_Z5recuri
	.type	_Z5recuri, @function
_Z5recuri:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movl	%edi, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jg	.L6
	movl	$1, %eax
	jmp	.L7
.L6:
	movl	-20(%rbp), %eax
	movslq	%eax, %rbx
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	_Z5recuri
	imulq	%rbx, %rax
.L7:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z5recuri, .-_Z5recuri
	.section	.rodata
.LC0:
	.string	"iter(%d) returns %d\n"
.LC1:
	.string	"recur(%d) returns %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$10, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	_Z4iteri
	movq	%rax, %rdx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	_Z5recuri
	movq	%rax, %rdx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 5.1.1 20150618 (Red Hat 5.1.1-4)"
	.section	.note.GNU-stack,"",@progbits
