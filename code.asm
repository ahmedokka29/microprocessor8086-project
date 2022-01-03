.MODEL SMALL
.STACK
.DATA

number DB 0
numberplace db 10
messageinvalidcharacter db 0ah,0dh,"Invalid Character$"
messageinputnumber db 0ah,0dh,"Please Input a number $"

.CODE
.STARTUP

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
