.model small

.stack 100h

.data
    
    car db ?  
    
    NMAI db 30h
    NMIN db 30h
    NC db 30h         ;contatori cicli
    
    input db 'inserisci un carattere: ', '$'
    outputMai db 'caratteri maiuscoli: ', '$'
    outputMin db 'caratteri minuscoli: ', '$'
    acapo db ,13,10,'$'
    
.code
    .startup 

        mov ax, @data     ;caricamento segmento dati in ds
        mov ds, ax


        inizio:
        
             

            mov ah, 09h
            mov dx, offset input    ;visualizzaione stringa di input
            int 21h 
            
            mov ah, 01h             
            int 21h 
            mov car, al                ;richiesta input 
            
            mov ah,09h
            mov dx, offset acapo               ;formattazione
            int 21h 
            
            mov al, car
           


            cmp al, 'A'                            ;|
            jge VeroA                              ;| 
            jmp fine                               ;|
                                                   ;|
            VeroA:                                 ;|
                cmp al, 'Z'                        ;|
                jle VeroB                          ;|
                jmp FalsoB                         ;|
                                                   ;|
            VeroB:                                 ;|
                inc NMAI                           ;|
                jmp fine                           ;|
                                                   ;|
            FalsoB:                                ;|
                cmp al, 'a'                        ;|
                jge VeroC                          ;|
                jmp fine                           ;|
                                                   ;|
            VeroC:                                 ;|
                cmp al, 'z'                        ;|
                jle VeroD                          ;|
                jmp fine                           ;|
                                                   ;|
            VeroD:                                 ;|
                inc NMIN                           ;|
                jmp fine                           ;|
                                                   ;|
            fine:                                  ;|
                inc NC                             ;|    
            
            cmp NC, 33h
            jg FINTUT
            jmp inizio 
            
            
            
        FINTUT:
            nop  
            
            
        
        mov ah,09h
        mov dx, offset acapo               ;formattazione
        int 21h         
        
        mov ah, 09h
        mov dx, offset outputMai           ;visualizzaione stringa di output maiuscole
        int 21h
        
        mov ah, 02h
        mov dl, NMAI                       ;visualizzazione contatore maiuscole
        int 21h
        
        mov ah, 09h
        mov dx, offset acapo               ;formattazione
        int 21h
        
        mov ah, 09h
        mov dx, offset outputMin           ;visualizzaione stringa di output minuscole
        int 21h
        
        mov ah, 02h                        ;visualizzazione contatore minuscole
        mov dl, NMIN
        int 21h    
        
        
        mov ah, 4ch
        int 21h
