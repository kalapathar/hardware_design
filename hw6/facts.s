	.file	"facts.C"
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.globl	ans
	.bss
	.align 8
	.type	ans, @object
	.size	ans, 8
ans:
	.zero	8
	.text
	.globl	_Z9factoriali
	.type	_Z9factoriali, @function
_Z9factoriali:
.LFB1107:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$1, -4(%rbp)
.L3:
	movl	-20(%rbp), %eax
	addl	$1, %eax
	cmpl	-4(%rbp), %eax
	jle	.L2
	pxor	%xmm0, %xmm0
	cvtsi2sd	-4(%rbp), %xmm0
	movsd	ans(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, ans(%rip)
	addl	$1, -4(%rbp)
	jmp	.L3
.L2:
	movsd	ans(%rip), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1107:
	.size	_Z9factoriali, .-_Z9factoriali
	.section	.rodata
.LC0:
	.string	"n\tn!"
.LC1:
	.string	"----------------"
.LC3:
	.string	"\t"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1108:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$.LC0, %esi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	movl	$.LC1, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	movl	$0, -4(%rbp)
.L7:
	cmpl	$5, -4(%rbp)
	jg	.L6
	movsd	.LC2(%rip), %xmm0
	movsd	%xmm0, ans(%rip)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEi
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	_Z9factoriali
	movsd	%xmm0, -24(%rbp)
	movl	$.LC3, %esi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movsd	-24(%rbp), %xmm0
	movq	%rax, %rdi
	call	_ZNSolsEd
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	addl	$1, -4(%rbp)
	jmp	.L7
.L6:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1108:
	.size	main, .-main
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB1118:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L11
	cmpl	$65535, -8(%rbp)
	jne	.L11
	movl	$_ZStL8__ioinit, %edi
	call	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, %edx
	movl	$_ZStL8__ioinit, %esi
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	call	__cxa_atexit
.L11:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1118:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_ans, @function
_GLOBAL__sub_I_ans:
.LFB1119:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1119:
	.size	_GLOBAL__sub_I_ans, .-_GLOBAL__sub_I_ans
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_ans
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 5.1.1 20150618 (Red Hat 5.1.1-4)"
	.section	.note.GNU-stack,"",@progbits
