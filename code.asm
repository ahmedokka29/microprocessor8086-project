.MODEL SMALL
.STACK
.DATA
ARR DB 255 DUP(?);00H,01H,02H,03H,04H,05H,06H,07H,08H,09H,010H,012H,012H,012H,012H,012H,012H,013H,014H,015H
number DB 0
SOLVE DB 0
numberplace db 10
KEY EQU 0DH
;Messages defenitions
MSG1 DB "KEY IS FOUND AT POSITION $" 
MSG2 DB "KEY NOT FOUND!!! $"
MSG3 DB "ENTER SIZE: $"   
MSG4 DB "ENTER ELEMENT NUMBER  $"
MSG5 DB "____ $"
MSG6 DB "OVERFLOW $"  
MSG7 DB "NOTSORTED ENTER AGAIN $"
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
             
        mov bh,0       
        mov ah,0
        add ax,bx
        cmp ah,0
        jne overflow
 
          

        mov number,al
        
       
        jmp loop_read_number


overflow:
    lea dx, msg6
    mov ah,09h  
       
    int 21h
    jmp P_END
    
invalidcharacter:
    mov ah,09h  
    mov dx,offset messageinvalidcharacter   
    int 21h     

    jmp loop_number_main           
        
numbercomplete:
 
    POP DX
    POP BX
    POP AX
    mov al,number 
    
    RET
ENTER ENDP     
    
    
PRINT PROC          
     
    ;initialize count
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    mov cx,0
    mov dx,0
    label1:
        ; if ax is zero
        cmp ax,0
        je print1     
         
        ;initialize bx to 10
        mov bx,10       
         
        ; extract the last digit
        div bx                 
         
        ;push it in the stack
        push dx             
         
        ;increment the count
        inc cx             
         
        ;set dx to 0
        xor dx,dx
        jmp label1
    print1:
        ;check if count
        ;is greater than zero
        cmp cx,0
        je exit
         
        ;pop the top of stack
        pop dx
         
        ;add 48 so that it
        ;represents the ASCII
        ;value of digits
        add dx,48
         
        ;interrupt to print a
        ;character
        mov ah,02h
        int 21h
         
        ;decrease the count
        dec cx
        jmp print1
exit:
    POP DX
    POP CX
    POP BX
    POP AX
ret
PRINT ENDP
    

NEWLINE PROC ; printing the newline
  push ax 
  push dx
  mov dx,13 
  mov ah,2
  int 21h  
  mov dx,10 ;asci code for brake line 10 ,13
  mov ah,2
  int 21h  
  pop dx
  pop ax   
ret 
NEWLINE ENDP
        
    
P_END: ; end of the program
.EXIT
END
