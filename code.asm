.MODEL SMALL
.STACK
.DATA
ARR DB 127 DUP(?);define array with maximmum size 127 
number DB 0
SOLVE DB 0
numberplace db 10
KEY DB 0DH;the input key
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
MOV AX,@DATA ;intialize the data segement
MOV DS,AX
STR:
MOV number,0
LEA DX,MSG3 ; display welcome messege
MOV AH,09H
INT 21H ;fetch the instruction in 21h addrees

CALL ENTER ; call function to inter the size
MOV SIZE,AL


MOV CL,0 



;array elements begin
ARR_LOOP: 

CMP CL,SIZE
JE ARR_END 


LEA DX,MSG4
MOV AH,09H
INT 21H

MOV AL,CL
INC AL
MOV AH,0
CALL PRINT
LEA DX,MSG5
MOV AH,09H
INT 21H


CALL ENTER 
CALL NEWLINE
CMP AL,INDEX
JL NOTSORTED
MOV INDEX,AL
 
MOV CH,0
MOV SI,CX
MOV ARR[SI],AL
INC CL
JMP ARR_LOOP
    
    
    NOTSORTED:
    LEA DX,MSG7
    MOV AH,09H
    INT 21H
    JMP ARR_LOOP
ARR_END:
LEA DX,MSG8
MOV AH,09H
INT 21H
CALL ENTER
MOV KEY,AL
;array elements end

MOV BL,SIZE
DEC BL    

MOV BH,00
MOV CL,KEY
        
AGAIN:CMP BH,BL
JA FAIL
MOV AL,BH
ADD AL,BL
SHR AL,1
MOV AH,00
MOV SI,AX

CMP CL,ARR[SI]

JAE BIG
DEC AL
MOV BL,AL
JMP AGAIN

BIG:JE SUCCESS
INC AL
MOV BH,AL
JMP AGAIN


    
P_END: ; end of the program
.EXIT
END
