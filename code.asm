include 'emu8086.inc' ; Includes some common functions

;-------------- Saving Tables --------------
                                                     
; Stores letters from a to z (lower case) 
MOV CX, 26   ; Size of letters in the alphabet
MOV AL, 61h  ; ASCII code for letter 'a'
MOV DI, 400h ; Hold the offset of memory location in the ES  
CLD ; DF = 0 
store_letters:  
STOSB ; Copies a byte from AL to a memory location in ES. DI is used to hold the offset of the memory location in the ES. After the copy, DI is automatically incremented or decremented to point to the next string element in memory.   
INC AL ; Increases AL value by 1, therefore changing the letter 
LOOP store_letters ; Loops if CX after decrementing by 1 not equal 0


; Store numbers from 1 to 26
MOV CX, 26 ; Size of letters in the alphabet
MOV AL, 1  ; Starting from number 1
MOV DI, 460h ;   
 
store_numbers:  
STOSB   
INC AL  
LOOP store_numbers


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
