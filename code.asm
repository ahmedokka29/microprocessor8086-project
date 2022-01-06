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

SUCCESS:
MOV SOLVE,AL
LEA DX,MSG1
MOV AH,09H
INT 21H
MOV AL,SOLVE 
INC AL
MOV AH,0 
CALL PRINT

JMP P_END

FAIL:LEA DX,MSG2
MOV AH,09H
INT 21H

  
JMP P_END


    ENTER PROC NEAR
        PUSH AX
        PUSH BX
        PUSH DX
        loop_number_main:
        
        MOV NUMBER,0    
    loop_read_number:
    
        MOV AH,01H  
                    
        INT 21H    
        
        CMP AL,0DH 
        JE numbercomplete   
        
        CMP AL,30H  
                    
        JL invalidcharacter 
     
        CMP AL,39h  
        JG invalidcharacter 
        
        
        SUB AL,30h  
                                
        MOV BL,AL   
        
        MOV AL,number   
        MUL numberplace  
             
        MOV BH,0       
        MOV AH,0
        ADD AX,BX
        CMP AH,0
        JNE overflow
 
          

        MOV number,AL
        
       
        JMP loop_read_number


overflow:
    LEA DX, msg6
    MOV AH,09H  
       
    INT 21h
    JMP P_END
    
invalidcharacter:
    MOV AH,09h  
    MOV DX,offset messageinvalidcharacter   
    INT 21h     

    JMP loop_number_main           
        
numbercomplete:
 
    POP DX
    POP BX
    POP AX
    mov al,number 
    
    RET
ENTER ENDP
    
P_END: ; end of the program
.EXIT
END

PRINT PROC          
     
    ;initialize count
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    MOV CX,0
    MOV DX,0
    label1:
        ; if ax is zero
        CMP AX,0
        JE print1     
         
        ;initialize bx to 10
        MOV BX,10       
         
        ; extract the last digit
        DIV BX                 
         
        ;push it in the stack
        PUSH DX             
         
        ;increment the count
        INC CX             
         
        ;set dx to 0
        XOR DX,DX
        JMP label1
    print1:
        ;check if count
        ;is greater than zero
        CMP CX,0
        JE exit
         
        ;pop the top of stack
        POP DX
         
        ;add 48 so that it
        ;represents the ASCII
        ;value of digits
        ADD DX,48
         
        ;interrupt to print a
        ;character
        MOV AH,02h
        INT 21h
         
        ;decrease the count
        DEC CX
        JMP print1
exit:
    POP DX
    POP CX
    POP BX
    POP AX
RET
PRINT ENDP
    

NEWLINE PROC ; printing the newline
  PUSH AX 
  PUSH DX
  MOV DX,13 
  MOV AH,2
  INT 21h  
  MOV DX,10 ;asci code for brake line 13 ,10
  MOV AH,2
  INT 21h  
  POP DX
  POP AX   
RET 
NEWLINE ENDP
