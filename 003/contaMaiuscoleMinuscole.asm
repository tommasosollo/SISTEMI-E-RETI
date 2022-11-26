;scelta del modello
.model small       
;dimensionamento memoria
.stack 100h            

;inizio segmento dati
.data
    car1 db ?
    car2 db ?
    NMAI db 30h
    NMIN db 30h
    
    input db 'inserisci un carattere: ', '$'
    outputMai db 'caratteri maiuscoli: ', '$'
    outputMin db 'caratteri minuscoli: ', '$'
    acapo db ,13,10,'$' 
                     
;inizio segmento codice
.code
    .start up
        mov ax, @data     ;caricamento segmento dati in ds
        mov ds, ax        
        
        mov ah, 09h
        mov dx, offset input    ;visualizzaione stringa di input
        int 21h 
        
        mov ah, 01h             
        int 21h                 ;richiesta input
        mov car1, al
        
        mov ah,09h
        mov dx, offset acapo    ;formattazione
        int 21h   
       
        
        mov ah, 09h
        mov dx, offset input    ;visualizzaione stringa di input
        int 21h 
        
        mov ah, 01h
        int 21h                 ;richiesta input
        mov car2, al
        
        mov ah,09h
        mov dx, offset acapo    ;formattazione
        int 21h 
        
                   
                   
        
        mov al, car1            
                                               ;-
        cmp al, 'A'                            ;|
        jge Vero1A                             ;| 
        jmp fine                               ;|
                                               ;|
        Vero1A:                                ;|
            cmp al, 'Z'                        ;|
            jle Vero1B                         ;|
            jmp Falso1B                        ;|
                                               ;|
        Vero1B:                                ;|
            inc NMAI                           ;|
            jmp fine                           ;|
                                               ;|
        Falso1B:                               ;|
            cmp al, 'a'                        ;|
            jge Vero1C                         ;|
            jmp fine                           ;|
                                               ;|
        Vero1C:                                ;|
            cmp al, 'z'                        ;|
            jle Vero1D                         ;|
            jmp fine                           ;|
                                               ;|
        Vero1D:                                ;|
            inc NMIN                           ;|
            jmp fine                           ;|
                                               ;|
        fine:                                  ;|
            nop                                ;|
                                               ;|
        mov al, car2                           ;|
                                               ;|
        cmp al, 'A'                            ;|
        jge Vero2A                             ;|
        jmp fine2                              ;|      ;algoritmo
                                               ;|
        Vero2A:                                ;|
            cmp al, 'Z'                        ;|
            jle Vero2B                         ;|
            jmp Falso2B                        ;|
                                               ;|
        Vero2B:                                ;|
            inc NMAI                           ;|
            jmp fine2                          ;|
                                               ;|
        Falso2B:                               ;|
            cmp al, 'a'                        ;|
            jge Vero2C                         ;|
            jmp fine2                          ;|
                                               ;|
        Vero2C:                                ;|
            cmp al, 'z'                        ;|
            jle Vero2D                         ;|
            jmp fine2                          ;|
                                               ;|
        Vero2D:                                ;|
            inc NMIN                           ;|
            jmp fine2                          ;|
                                               ;|
        fine2:                                 ;|
            nop                                ;-
            
               
                 
                 
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
            
        
        
end
        
            
        
