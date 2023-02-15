.model small

.stack 100h

.data  

    car db ?
    
    spiega db 'scrivi una frase e premi invio quando la frase e finita', '$'
    input db 'inserisci una frase: ', '$'
    in2 db 'inserisci il carattere per uscire dal programma', '$'  
    output db 'Sei uscito dal programma', '$' 
    acapo db 13,10,'$'
    
.code
    .startup 

        mov ax, @data     ;caricamento segmento dati in ds
        mov ds, ax
              
        mov ah, 09h
        mov dx, offset spiega    ;visualizzazione stringa con spiegaione programma
        int 21h
        
        
        mov ah, 09h
        mov dx, offset acapo    ;visualizzazione acapo
        int 21h  
        
        mov ah, 09h
        mov dx, offset acapo    ;visualizzazione acapo
        int 21h   
        
        mov ah, 09h
        mov dx, offset in2
        int 21h
        
        mov ah, 01h
        int 21h
        mov car, al
        
        mov ah, 09h
        mov dx, offset acapo
        int 21h     
        
        
        mov ah, 09h
        mov dx, offset input    ;visualizzazione stringa di input
        int 21h 
        
        mov ah, 09h
        mov dx, offset acapo    ;visualizzazione acapo
        int 21h
            

                   

        inizio: 
            mov ah, 01h             
            int 21h 
        
            cmp al, 013
            je capo
            jmp nocap
            
            capo:
                mov ah, 09h
                mov dx, offset acapo
                int 21h 
                
            nocap:
                             
            cmp al, car               ;se l'utente inserisce spazio il programma si ferma
            je FINTUT
            jmp inizio 
            
            
            
        FINTUT:
            nop    
               
        mov ah, 09h
        mov dx, offset acapo    ;visualizzazione acapo
        int 21h 
               
        mov ah, 09h
        mov dx, offset output    ;visualizzazione stringa di output
        int 21h   
        
        
        
        end
             
