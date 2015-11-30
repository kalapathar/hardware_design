_EXIT=1
_READ=3
_WRITE=4
_STDIN=0
_STDOUT=1
BUFFSIZE=80

.SECT .TEXT
start:
PUSH   endr-prompt   !print prompt
PUSH    prompt
PUSH    _STDOUT
PUSH    _WRITE
SYS
ADD     SP,8 
PUSH    BUFFSIZE
PUSH    buff
PUSH   _STDIN
PUSH   _READ
SYS
ADD SP,8
MOV	DX,AX
ADD	DX,buff		! set DX to addr of first byte after input
MOV	BX,buff




PUSH AX
PUSH BX

PUSH _STDOUT
PUSH _WRITE
SYS
ADD SP,8

PUSH    0
PUSH   _EXIT
SYS


























.SECT .DATA
prompt: .ASCII "Enter an Upper Case letter:"
endr:

.SECT .BSS
buff: .SPACE BUFFSIZE
endbuff: