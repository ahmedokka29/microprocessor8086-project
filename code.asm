.MODEL SMALL
.STACK
.DATA
ARR DB 127 DUP(?);define array with maximmum size 127 
OCUR DB 128 DUP(0)
number DB 0
SOLVE DB 0
numberplace db 10
KEY DB 0DH;the input key
;Messages defenitions                
WEL DB "WELCOME TO BINARY SEARCH PROGRAM",13,10,"$"
MSG1 DB "KEY IS FOUND AT POSITION $" 
MSG2 DB "KEY NOT FOUND!!! $"
MSG3 DB "ENTER SIZE: $"   
MSG4 DB "ENTER ELEMENT NUMBER  $"
MSG5 DB "____ $"
MSG6 DB "OVERFLOW ENTER AGAIN","$" 
MSG7 DB "NOTSORTED ENTER AGAIN $"
MSG8 DB "Enter Key $"      
MSG9 DB "ZERO SIZE ENTER AGAIN",13,10,"$"
MSG10 DB "NUMBER OF OCURRENCES IS ","$"
INDEX DB 0
SIZE DB 0
OCC DB 0   
messageinvalidcharacter db "Invalid Character$"
messageinputnumber db "Please Input a number $"


.CODE
.STARTUP    
MOV AX,@DATA ;intialize the data segement
MOV DS,AX
STR:
MOV number,0    


LEA DX,WEL ; display welcome messege
MOV AH,09H
INT 21H ;fetch the instruction in 21h addrees
JMP BEGIN
RE:
LEA DX,MSG9 ; display welcome messege
MOV AH,09H
INT 21H ;fetch the instruction in 21h addrees
BEGIN:
LEA DX,MSG3 ; display welcome messege
MOV AH,09H
INT 21H ;fetch the instruction in 21h addrees
                                              
                                              
CALL ENTER ; call function to inter the size
CMP AL,0
JE  RE
CALL NEWLINE
MOV SIZE,AL


MOV CL,0 



;array elements begin
ARR_LOOP: 

CMP CL,SIZE
JE ARR_END 


LEA DX,MSG4
MOV AH,09H
INT 21H

MOV AL,CL   ;mov cl to al
INC AL      ;increment AL by 1
MOV AH,0    ;set AH = 0
CALL PRINT  ;call the print proc
LEA DX,MSG5 ;load effective address of msg5 to DX
MOV AH,09H
INT 21H


CALL ENTER      ;call it to enter the elements of the arr
CALL NEWLINE    ;call the new line proc
CMP AL,INDEX    ;compare the new intered element with the previos one
JL NOTSORTED    ;if the new element is less than the old it prints nonsorted and make u enter it again
MOV INDEX,AL    ;after entering the new element it keeps its vvalue INDEX
 
MOV CH,0
MOV SI,CX
MOV ARR[SI],AL
INC CL   
MOV AH,0    
MOV SI,AX
INC OCUR[SI]
JMP ARR_LOOP
    
    NOTSORTED:
    LEA DX,MSG7 ;load effective address to the dx
    MOV AH,09H
    INT 21H         ;fetch the instruction in 21h
    CALL NEWLINE    ;print brake line
    JMP ARR_LOOP    ;continue the loop

ARR_END:
LEA DX,MSG8      ;load effective address to the dx
MOV AH,09H
INT 21H          ;fetch the instruction in 21h
CALL ENTER       ;call it to enter the elements of the arr
CALL NEWLINE     ;print brake line
MOV KEY,AL       ;put the key that enters in al to key
;array elements end
         
 
MOV BL,SIZE     ;mov the size of the array to BL
DEC BL           ; decrement the BL by 1

MOV BH,00
MOV CL,KEY      ;put the key at CL
MOV CH,0
MOV SI,CX
MOV AL,OCUR[SI] 
MOV OCC,AL
AGAIN:CMP BH,BL ;binary search
JA FAIL         ;jump to fail
MOV AL,BH
ADD AL,BL
SHR AL,1
MOV AH,00
MOV SI,AX

CMP CL,ARR[SI]  ;compare the SIth element with CL

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
INT 21H          ;fetch the instruction in 21h
MOV AL,SOLVE 
INC AL           ;increment the AL by 1
MOV AH,0 
CALL PRINT
CALL NEWLINE
LEA DX,MSG10
MOV AH,09H
INT 21H 
MOV AL,OCC  
MOV AH,0 
CALL PRINT
 

JMP P_END        ;jump to the end of the program

FAIL:LEA DX,MSG2     ;key not found
MOV AH,09H
INT 21H

  
JMP P_END


    ENTER PROC NEAR
        PUSH AX
        PUSH BX
        PUSH DX
        PUSH CX 
        MOV CX,0
        loop_number_main:
        CALL NEWLINE
        
        MOV number,0    
    loop_read_number:
    
        MOV AH,01H  
                    
        INT 21H    
        
        CMP AL,0DH      ;compare AL with ASCII code of ENTER
        JE numbercomplete
        
        INC CX   
        
        CMP AL,30H      ;compare AL with ASCII code of zero 
                    
        JL invalidcharacter 
     
        CMP AL,39h      ;compare AL with ASCII code of 9
        JG invalidcharacter 
        
        
        SUB AL,30h       ;subtract ASCII code of zero from AL
                                
        MOV BL,AL   
        
        MOV AL,number  
        MUL numberplace  
             
        MOV BH,0       
        MOV AH,0
        ADD AX,BX
        CMP AH,0
        JNE overflow
 
          

        MOV number,AL
        CMP number,0
        JL overflow
        
       
        JMP loop_read_number


overflow:
    LEA DX, msg6     ;load effective address to the dx
    MOV AH,09H       ;print the message
       
    INT 21h
    JMP loop_number_main
    
invalidcharacter:
    MOV AH,09h  
    MOV DX,offset messageinvalidcharacter   
    INT 21h     

    JMP loop_number_main           
        
numbercomplete:
    CMP CX,0
    JE loop_number_main
    POP CX
    POP DX
    POP BX
    POP AX
    mov al,number 
    
    RET
ENTER ENDP     
    
    
PRINT PROC     ;procedure to print a number     
     
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
        DIV BX       ;put the result at AX and the remendier to DX                 
         
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
         
        ;add 48 = 30h so that it
        ;represents the ASCII
        ;value of digits
        ADD DX,30h
         
        ;interrupt to print a
        ;character
        MOV AH,02h
        INT 21h
         
        ;decrease the count
        DEC CX
        JMP print1
exit:       ;free the stack
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
        
    
P_END: ; end of the program
.EXIT
END
