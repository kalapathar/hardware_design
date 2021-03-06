! This code takes a first line of input for translation. The first character represents the letter to be translated and the final character is the letter to be translated to.
!The next lines are the sentences where translations needs to occur. If the user inputs a new blank line at any point, then the program exits. Finally all the translations that 
!that occured along with the number of characters, spaces, words, punctuations are printed on the standard output.
!Deepak Shah
!December 13,2015


_EXIT=1
_READ=3
_WRITE=4
_STDIN=0
_STDOUT=1
BUFFSIZE=80
_GETCHAR=117
_STDERR=2

.SECT .TEXT
start:
PUSH prompt2-prompt        !third argument for Write Sys CALL
PUSH prompt                ! Second Argument which contains the address of buffer
PUSH _STDOUT               !First Argument for Standard System Output
PUSH _WRITE
SYS
ADD SP,8
CALL printnl               !Calls the printnl function from ~cs241/as88/lib.s to print a new line 



PUSH BUFFSIZE              ! second argument for getline which contains the size of buffer
PUSH buff                  !first argument for getline which contains the address of a buffer
CALL getline               !Calls the function getline and returns the number of characters read
ADD SP,4
MOV BX,AX                  !Value of AX is 0 if was no input, AX is copied to BX
CMP BX,0
JE 2f                      !If no input, exit the program




PUSH prompt3-prompt2       !Number of bytes in the location prompt2
PUSH prompt2               !the starting address to print from
PUSH _STDOUT            
PUSH _WRITE
SYS                        !Prints the text on output
ADD SP,8

PUSH buff                  !Buff is the starting address of the input 
CALL gettrans              !Calls gettrans with buff as argument. Get trans assigns inchar and outchar
ADD SP,2                   !Clean the stack

!By now, inchar and outchar holds the character to replace and character to be replaced with.
!Loop for asking the user to input the sentences that needs to be translated.

1:
PUSH BUFFSIZE          
PUSH buff
CALL getline
ADD SP,4
MOV BX,AX
CMP BX,0                 !If no input from user, exit the loop and print summary
JE 2f
PUSH buff                
CALL translate           !translates the charaters as per the outchar and inchar. Also keeps track 
ADD SP,2                 !of characters, lines, punctuations, whitespaces and words.

PUSH BX                   !Prints the BX bytes of translated text starting from the address buff 
PUSH buff
PUSH _STDOUT
PUSH _WRITE
SYS
ADD SP,8
CALL printnl              !prints a new line after the translation output. Uses library function from CS241 directory.
JMP 1b                     !Go for next line-loops over until there is no input from the user.

2:
CALL print_summary          !Prints the summary of all translations occured.
PUSH 0
PUSH _EXIT
SYS

PUSH 0                      !Exits from the program.
PUSH _EXIT
SYS


!Grab the input line 
getline:
PUSH BP  
MOV BP,SP               
PUSH BX
PUSH DX
MOV DX,6(BP)      !Move the second argument, the size of buffer to DX
ADD DX,4(BP)      !Add the address of buffer so that DX contains the end of buffer
SUB DX,1           !Subtract 1 from DX so 
MOV BX,4(BP)       !Move the first argument, the address of the buffer into BX
MOV CX,0             !Initialise CX, the counter register to 0

1:
CMP DX,CX   !If the size of buffer-1 bytes =counter, then exit loop
JE 4f         
PUSH _GETCHAR  !read one character
SYS
ADD SP,2
CMP AX,10        !if no character read, the output from _GETCHAR is -1 and exit loop
JE 4f
MOVB (BX),AL      !Move the read character into the address pointed by BX.
INC BX          !Increase BX
INC CX          !Increase CX
CMP AX, '\n'    !Compare to new line and if new line found, exit loop
JNE 1b           !Jump if not equal to 1


4:
MOVB CL,(nullb)      !Add a nullbyte at the end of string
MOVB (BX),CL         !Mov that null byte at the end of buffer
MOV AX,BX            !Mov into AX register the address of buffer
SUB AX,4(BP)         !Subtract the adress of buff so that AX contains the total number of characters read
POP DX               !Restore registers
POP BX
POP BP
RET                   !Return from the function
!End of getline function
!gettrans function stores the value for inchar and outchar 

gettrans:
PUSH BP
PUSH BX
PUSH CX

MOV BP,SP
MOV BX, 8(BP)
MOVB CL, (BX)
MOVB (inchar), CL
PUSH inchar
CALL strlen                    !Checks to see if both the input characters are of same length of not i.e 1
ADD SP,2                      !Ignores the space between the characters to jump to the next letter
CMP AX,1
JNE 2f

ADD BX,2
MOVB CL,(BX)
MOVB (outchar), CL               !Moves the character into the address pointed by outchar
PUSH outchar
CALL strlen                          
ADD SP,2
CMP AX,1
JNE 2f

1:
POP CX
POP BX
POP BP
MOV AX,1
RET

2:
POP CX                            !Restores the registers and exits the function
POP BX
POP BP
MOV AX,0
RET

!End of gettrans function

!Tracks the number of translations, characters, words, newlines input and 
!also translates the charaters as per the outchar and inchar

translate:
PUSH BP
PUSH BX
PUSH CX
MOV BP,SP
PUSH DX
MOV BX,8(BP)          !Holds the first argument, the address of the buff 
MOV DX,(inword)       !DX holds the value 0 



1:
CMPB (BX),0          !Compares to see if next byte is  a null byte
JE 4f                !If true, then exits the function
PUSH BX              !Argument for isspace-BX-address of the byte
CALL isspace         !Helper function-finds if the input character is a space or tabs 
ADD SP,2
CMP AX,1             !if character is a space, AX is 1 and spacect increases by 1
JNE 3f
ADD (spacect),1

3:
PUSH BX
CALL ispunctuation      !Checks to see if the input character is a punctuation.
ADD SP,2
CMP AX,1                 
JNE 6f
ADD (puntct),1           !If the character is a punctuation, puntct increases by 1
6:
MOVB CL,(inchar)          !CL holds the byte initially in inchar
CMPB (BX),65              !Compares the ASCII value of the byte. If not in the range of 65-122,DX holds 0 meaning that the character is out of a word
JL 9f
CMPB (BX),122
JG 9f
CMP DX,0
JNE 8f
ADD (wordct),1             !This line runs only when the charater is outside a word. So wordct is increased by 1

8:
MOV DX,1                    !If charater ASCII is from range 65-122, DX holds a 1.
JMP 5f
9:
MOV DX,0                   !DX holds 0 for ASCII values outside 65-122.
5:
CMPB (BX),'\n'             
JNE 7f
ADD (linect),1              !If BX points to a new line, linect increases by 1.

7:
CMPB (BX),CL                 !If (inchar)==(BX), then translation happens
JNE 2f
MOVB CL,(outchar)            !CL holds the (outchar). Character is translated.
MOVB (BX),CL                  !Replacement in the actual string
ADD (transct),1               !If character is replaced, transct increases by 1
2:
ADD (charct),1                 !This line runs all time. charct holds the number of charaters
INC BX
JMP 1b                         !Loop back for next character

4:
MOV AX,BX                      !AX holds the location of the last character              
MOV (inword),DX
POP DX                         !Restore Registers and Exit from translate function
POP CX
POP BX
POP BP
RET






!Function that returns 1 if the character is a space or tab and 0 otherwise.
isspace:         
	PUSH	BP
	PUSH 	BX
	MOV 	BP,SP
	MOV		BX,6(BP)

	CMPB	(BX),32
	JE		7f

	CMPB	(BX),9
	JE		7f

	CMPB	(BX),10
	JE		7f

	CMPB	(BX),11
	JE		7f

	CMPB	(BX),12
	JE		7f

	CMPB 	(BX),13
	JE 		7f

	MOV 	AX,0
	POP 	BX
	POP		BP
	RET
	
7:	MOV 	AX,1                      !Returns from the function 
	POP 	BX
	POP		BP
	RET

! check if the character is a punctuation mark
ispunctuation:
	PUSH	BP
	PUSH 	BX

	MOV 	BP,SP
	MOV		BX,6(BP)

	CMPB	(BX),33
	JE		7f

	CMPB	(BX),39
	JE		7f

	CMPB	(BX),40
	JE		7f

	CMPB	(BX),41
	JE		7f

	CMPB	(BX),44
	JE		7f

	CMPB	(BX),45
	JE		7f

	CMPB 	(BX),46
	JE 		7f

	CMPB	(BX),47
	JE		7f

	CMPB 	(BX),58
	JE 		7f

	CMPB	(BX),59
	JE		7f

	CMPB 	(BX),63
	JE 		7f

	CMPB	(BX),96
	JE		7f

	MOV 	AX,0
	POP 	BX
	POP		BP
	RET

7:	MOV 	AX,1
	POP 	BX
	POP		BP
	RET	


!Prints the summary of the translations, the number of words, spaces, characters, punctuation encountered.
print_summary:

PUSH characters-summary
PUSH summary
PUSH _STDERR
PUSH _WRITE
SYS
ADD SP,8
CALL printnl



PUSH (charct)
PUSH _STDOUT
CALL printdec
ADD SP,4

PUSH words-characters
PUSH characters
PUSH _STDERR
PUSH _WRITE
SYS
ADD SP,8
CALL printnl

PUSH (transct)
PUSH _STDOUT
CALL printdec
ADD SP,4

PUSH whitespace-translations
PUSH translations
PUSH _STDERR
PUSH _WRITE
SYS
ADD SP,8
CALL printnl

PUSH (wordct)
PUSH _STDOUT
CALL printdec
ADD SP,4

PUSH lines-words
PUSH words
PUSH _STDERR
PUSH _WRITE
SYS
ADD SP,8
CALL printnl

PUSH (linect)
PUSH _STDOUT
CALL printdec
ADD SP,4

PUSH translations-lines
PUSH lines
PUSH _STDERR
PUSH _WRITE
SYS
ADD SP,8
CALL printnl




PUSH (puntct)
PUSH _STDOUT
CALL printdec
ADD SP,4


PUSH 18
PUSH punctuation
PUSH _STDERR
PUSH _WRITE
SYS
ADD SP,8
CALL printnl

PUSH (spacect)
PUSH _STDOUT
CALL printdec
ADD SP,4


PUSH punctuation-whitespace
PUSH whitespace
PUSH _STDERR
PUSH _WRITE
SYS
ADD SP,8
CALL printnl


.SECT .DATA
nullb: .BYTE 0
prompt: .ASCII "Enter the translation characters: "
prompt2: .ASCII "Enter the sentences to be translated: "
prompt3: 
summary: .ASCII "Summary "
characters: .ASCII " characters"
words: .ASCII " words"
lines: .ASCII " lines"
translations: .ASCII " translations"
whitespace: .ASCII " whitespace characters"
punctuation: .ASCII " punctuation marks"

.SECT .BSS
buff: .SPACE BUFFSIZE !Input 
endbuff:
inchar: .BYTE 0        !the character to be replaced
outchar: .BYTE 0        !the character put  its place
charct: .WORD 0          !the number of characters
wordct: .WORD 0          !the number of words
linect: .WORD 0          !the number of lines
inword: .WORD 0           !to find if we are in a word!
transct: .WORD 0          !Number of translations occured
spacect: .WORD 0          !To store the number of spaces encountered
puntct: .WORD 0           !To store the number of punctuations encountered
