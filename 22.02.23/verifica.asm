.model small

.stack 100h

.data  

    car db ?
    n db ?
    
    spi1 db 'inserisci due numeri la cui somma sia compresa tra 0 e 9: ', '$'
    input db 'inserisci una frase: ', '$'
    in2 db 'inserisci il carattere per uscire dal programma: ', '$'  
    output db 'Sei uscito dal programma', '$' 
    acapo db 13,10,'$'
    tab db '    ', '$'
    
.code
    .startup 

        mov ax, @data     ;caricamento segmento dati in ds
        mov ds, ax
        
        
        start:   
        
            mov ah, 09h
            mov dx, offset spi1    ;visualizzazione stringa con spiegaione programma
            int 21h
            
            mov ah, 01h
            int 21h                ;leggo il primo carattere e lo sposto in n
            mov n, al
            
            mov ah, 09h
            mov dx, offset tab     ;visualizzazione tab
            int 21h
            
            mov ah, 01h
            int 21h                ;leggo secondo numero
            
            add n, al
            sub n, 30h              ;sommo i due numeri
                   
            mov ah, 09h
            mov dx, offset acapo    ;visualizzazione acapo
            int 21h
            
            mov ah, 09h
            mov dx, offset acapo    ;visualizzazione acapo
            int 21h  
               
            
            cmp n, '0'                ;controllo se e maggiore o uguale a 0
            jge vero1
            jmp start 
        
        vero1:
            cmp n, '9'
            jle vero2                 ;controllo se e minore o uguale di 9
            jmp start
            
        
        vero2:
            nop    
                    
        
        mov ah, 09h
        mov dx, offset acapo    ;visualizzazione acapo
        int 21h  
        
        mov ah, 09h
        mov dx, offset acapo    ;visualizzazione acapo
        int 21h   
        
        mov ah, 09h
        mov dx, offset in2      ;visulizzo stringa in2
        int 21h
        
        mov ah, 01h
        int 21h                 ;leggo carattere per fermare programma
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
            

                   
        ;ciclo di inserimento frase
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
                             
            cmp al, car              ;controllo se l'utente ha inserito il carattere per fermare il programma
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
        
        mov ah, 4ch
        int 21h                 ;restituisco controllo al sistema operativo
        
        end
             
