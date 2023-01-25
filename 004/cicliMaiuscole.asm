.model small

.stack 100h

.data
    
    car db ?  
    
    NMAI db 30h
    NC db ?         ;contatori cicli
     
    numero db 'inserisci un numero: ', '$' 
    input db 'inserisci un carattere: ', '$'
    outputMai db 'caratteri maiuscoli: ', '$'
    outputMin db 'caratteri minuscoli: ', '$'
    acapo db ,13,10,'$'
    
.code
    .startup  
    
    

        mov ax, @data     ;caricamento segmento dati in ds
        mov ds, ax 
                      
                      
        riprov:
            mov ah, 09h
            mov dx, offset numero    ;visualizzaione stringa di input
            int 21h 
                
            mov ah, 01h             
            int 21h 
            mov NC, al                ;richiesta input 
                
            mov ah,09h
            mov dx, offset acapo               ;formattazione
            int 21h
        
         cmp NC, 30H
         jge c2
         jmp riprov
         
         c2:
            cmp NC, 39h
            jg riprov
            


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
                                                   ;|
            fine:                                  ;|
                                             ;|
                                                   ;|
            FalsoB:                                ;|
                nop
                                            ;|    
            dec NC
            cmp NC, 31h
            jl FINTUT
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
        
        
        mov ah, 4ch
        int 21h
