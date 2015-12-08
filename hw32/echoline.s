_EXIT=1
_READ=3
_WRITE=4
_STDIN=0
_STDOUT=1
BUFFSIZE=80
_GETCHAR=117

.SECT .TEXT
start:
PUSH endpr-prompt
PUSH prompt
PUSH _STDOUT
PUSH _WRITE
SYS
ADD SP,8


PUSH BUFFSIZE
PUSH buff
CALL getline
ADD SP,4

!MOV (buff),AX
PUSH AX
PUSH buff
PUSH _STDOUT
PUSH _WRITE
SYS
ADD SP,8

PUSH 0
PUSH _EXIT
SYS


getline:
PUSH BP
MOV BP,SP
PUSH BX
PUSH CX
MOV CX,6(BP)
ADD CX,4(BP)
SUB CX,1
MOV BX,4(BP)

1:
PUSH _GETCHAR
SYS
ADD SP,2
MOVB (BX),AL

!PUSH 1
!PUSH buff
!PUSH _STDOUT
!PUSH _WRITE
!SYS
!ADD SP,8

CMPB (BX), '\n'
JE 4f 
INC BX
CMP BX,CX
JE 4f
JMP 1b


4:
MOV AX,BX
SUB AX,4(BP)
POP CX
POP BX
POP BP
RET


.SECT .DATA
prompt: .ASCII "Enter a line of characters"
endpr:

.SECT .BSS
buff: .SPACE BUFFSIZE
endbuff: