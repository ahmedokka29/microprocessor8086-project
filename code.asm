.MODEL SMALL
.STACK
.DATA
ARR DB 255 DUP(?);define array with maximmum size 255 
number DB 0
SOLVE DB 0
numberplace db 10
KEY EQU 0DH;the input key
;Messages defenitions
MSG1 DB "KEY IS FOUND AT POSITION $" 
MSG2 DB "KEY NOT FOUND!!! $"
MSG3 DB "ENTER SIZE: $"   
MSG4 DB "ENTER ELEMENT NUMBER  $"
MSG5 DB "____ $"
MSG6 DB "OVERFLOW $"  
MSG7 DB "NOTSORTED ENTER AGAIN $"
MSG8 DB "Enter Key $"
INDEX DB 0
SIZE DB 0   
messageinvalidcharacter db "Invalid Character$"
messageinputnumber db "Please Input a number $"

.CODE
.STARTUP    
      
    
P_END: ; end of the program
.EXIT
END
