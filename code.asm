.MODEL SMALL
.STACK
.DATA
number DB 0
numberplace db 10
     ENTER PROC NEAR ;Entering a multi digit number
        mov number,0 
    loop_read_number:
    
        mov ah,01h  
                    
        int 21h    
        
        cmp al,0dh 
        je numbercomplete   
        
        
        sub al,30h  
                                
        mov bl,al   
        
        mov al,number   
        mul numberplace  
                        
        
        add al,bl       
        mov number,al
        
       
        jmp loop_read_number
    
    
         
        
numbercomplete:
mov al,number
RET
ENTER ENDP
    .exit
    end
