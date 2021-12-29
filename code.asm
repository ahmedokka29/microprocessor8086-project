include 'emu8086.inc' ;come functions library




;-------------- Starting the program --------------
        
; Displays welcome message
LEA DX, welcome_msg
MOV AH, 9
INT 21h
    

LEA DX, welcome_msg2
MOV AH, 9
INT 21h





welcome_msg db "Welcome to Encryption and Decryption Platform $"
welcome_msg2 db 0Dh,0Ah, "====================================================== $"



end
