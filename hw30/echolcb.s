_EXIT=1
_READ=3
_WRITE=4
_STDIN=0
_STDOUT=1
BUFFSIZE=80
_GETCHAR=117

.SECT .TEXT
start:
PUSH   endr-prompt   !print prompt
PUSH    prompt
PUSH    _STDOUT
PUSH    _WRITE
SYS
ADD     SP,8 
PUSH _GETCHAR
SYS
ADD SP,2

MOV	DX,AX
ADD	DX,buff		! set DX to addr of first byte after input
MOV	BX,buff

ADDB (BX),32
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