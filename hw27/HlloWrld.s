

	_EXIT	= 1		!  1
	_WRITE	= 4		!  2
	_STDOUT	= 1		!  3
.SECT .TEXT			!  4
start:				!  5
	MOV	CX,b-a	!  6
	PUSH	CX		!  7
	PUSH	b		!  8
	PUSH	_STDOUT		!  9
	PUSH	_WRITE		! 10
	SYS			! 11
	ADD	SP,8		! 12
	SUB	CX,AX		! 13
	PUSH	CX		! 14
	PUSH	_EXIT		! 15
	SYS			! 16
.SECT .DATA			! 17
a:				! 18
.ASCII	"Hello \n"		! 19
b:                  !20
.ASCII   "Goodbye\n"  !21
de:	.BYTE	0		! 22
.SECT .BSS           !23
