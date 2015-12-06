! Example assembly program
! RAB 11/05

        _EXIT   = 1             
        _READ   = 3             
        _WRITE  = 4             
        _STDIN  = 0             
        _STDOUT = 1             
.SECT .TEXT                     
start:  ! print prompt, as detailed in next five instructions
        PUSH    buff-prompt     ! third arg is length of prompt
        PUSH    prompt          ! second arg is address of prompt
        PUSH    _STDOUT         ! first arg is standard output
        PUSH    _WRITE          ! name of the OS function being called
        SYS                     ! perform the system call
        ADD     SP,8            ! clean up stack


        
       
1:     
        PUSH    1               ! read one character...
        PUSH    buff            ! into buff...
        PUSH    _STDIN          ! from standard input
        PUSH    _READ
        SYS
        ADD     SP,8            ! clean up stack
        CMPB   (buff),'\n'
        JE 9f
        CMPB    (buff),91 
        JGE     5f
        CMPB   (buff),65
        JLE     5f
        ADDB    (buff),32     ! if input char isnt a newline...
       
        PUSH    1              ! then print input char and newline
        PUSH    buff
        PUSH    _STDOUT         ! on standard output
        PUSH    _WRITE
        SYS
        ADD     SP,8            ! clean up stack
                    ! and go back for another input char
       JMP 1b

5:
        PUSH    1              ! then print input char and newline
        PUSH    buff
        PUSH    _STDOUT         ! on standard output
        PUSH    _WRITE
        SYS
        ADD     SP,8
        JMP 1b  

9:     

        PUSH    0               ! exit with normal exit status
        PUSH    _EXIT           
        SYS                     
        
.SECT .DATA                     
prompt:                         
.ASCII  "Enter a line of characters:  "         
buff:   .BYTE   0
        .BYTE   10
final:
.ASCII "The equivalent lower case is:: "

.SECT .BSS
