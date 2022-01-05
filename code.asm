.MODEL SMALL
.STACK
.DATA
ARR DB 011H,012H,013H,014H,015H
number DB 0
numberplace db 10
KEY EQU 012H
MSG1 DB "KEY IS FOUND AT POSITION "
RES DB " ","$"
MSG2 DB 'KEY NOT FOUND!!!!!!!!!!!!!. $'
messageinvalidcharacter db 0ah,0dh,"Invalid Character$"
messageinputnumber db 0ah,0dh,"Please Input a number $"


.CODE
.STARTUP
MOV AX,@DATA
MOV DS,AX
MOV number,0 
 
CALL ENTER ;taking an input

;start of binary search
MOV BL,AL    

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
    
SUCCESS:ADD AL,01
ADD AL,'0'
MOV RES,AL
LEA DX,MSG1
JMP DISP

FAIL:LEA DX,MSG2

DISP:MOV AH,09H
INT 21H
MOV AH,4CH  
JMP P_END
;end of binary search
    ENTER PROC NEAR
    
        loop_number_main:
        mov ah,09h  
        mov dx,offset messageinputnumber    
        int 21h     
        
        mov number,0    
    loop_read_number:
    
        mov ah,01h  
                    
        int 21h    
        
        cmp al,0dh 
        je numbercomplete   
        
        cmp al,30h  
                    
        jl invalidcharacter 
     
        cmp al,39h  
        jg invalidcharacter 
              
        sub al,30h  
                                
        mov bl,al   
        
        mov al,number   
        mul numberplace  
                               
        add al,bl       
        mov number,al
             
        jmp loop_read_number
      
invalidcharacter:
    mov ah,09h  
    mov dx,offset messageinvalidcharacter   
    int 21h     

    jmp loop_number_main           
        
numbercomplete:
    
    mov al,number 


    RET
ENTER ENDP
P_END:
.EXIT
END
