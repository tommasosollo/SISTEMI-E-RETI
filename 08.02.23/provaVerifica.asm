.model small

.stack 100h

.data
    
    car db 30h  
    
    spiega db 'scrivi una parola e premi spazio quando la parola e finita', '$'
    input db 'inserisci una parola: ', '$'  
    acapo db 13,10,'$'
    
.code
    .startup 

        mov ax, @data     ;caricamento segmento dati in ds
        mov ds, ax
              
        mov ah, 09h
        mov dx, offset spiega    ;visualizzaione stringa di input
        int 21h
        
        
        mov ah, 09h
        mov dx, offset acapo    ;visualizzaione acapo
        int 21h  
        
        mov ah, 09h
        mov dx, offset acapo    ;visualizzaione acapo
        int 21h        
        
        
        mov ah, 09h
        mov dx, offset input    ;visualizzaione stringa di input
        int 21h 
            

                  

        inizio: 
            mov ah, 01h             
            int 21h 
            mov car, al                ;richiesta input 
            
            mov al, car 
            
            
            cmp al, ' '
            je FINTUT


            jmp inizio 
            
            
            
        FINTUT:
            nop  
            
            
     
