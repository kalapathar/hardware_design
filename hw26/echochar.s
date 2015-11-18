! Example assembly program
! Rab 11/05
_EXIT=1
_READ=3
_WRITE=4
_STDIN=0
_STDOUT=1
.SECT .TEXT
start:               
PUSH 	buff-prompt
PUSH 	prompt
PUSH 	_STDOUT
PUSH 	_WRITE
SYS
ADD 	SP,8

1: PUSH 	1
   PUSH 	buff
   PUSH    _STDIN
   PUSH    _READ
   SYS
   ADD	    SP,8
   CMPB     (buff), '\n'
   JE       9f
   PUSH 	2
   PUSH 	buff
   PUSH 	_STDOUT
   PUSH 	_WRITE
   SYS
   ADD 		SP,8
   JMP	 	1b

9: PUSH 	0
   PUSH 	_EXIT
   SYS

   .SECT .DATA
   prompt:
   .ASCII "Enter a line of characters: "
   buff:  .BYTE   0
          .BYTE   10
   .SECT   .BSS

