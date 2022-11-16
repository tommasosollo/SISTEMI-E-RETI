.model small
.stack 100h

.data
    a db ?
    b db ?
    input1 db 'inserisci il primo numero',,13,10,'$'
    input2 db 'inserisci il secondo numero',,13,10,'$'   ;dichiaro le variabili
    output db ' e il maggiore',,13,10,'$'
    capo db 13,10,'$'

.code
    .startup 
        mov ax,@data       ;sposto .data in data segment
        mov ds,ax
        
        mov ah, 09h
        mov dx, offset input1    ;stampo richiesta di input
        int 21h
        
        mov ah, 01h
        int 21h             ;input
        mov a, al
        
        mov ah, 09h
        mov dx, offset capo       ;formattazione
        int 21h
        
        mov ah, 09h
        mov dx,offset input2      ;stampo richiesta di input 
        int 21h
        
        mov ah,01h
        int 21h                 ;input
        mov b,al
        
        mov ah, 09h
        mov dx, offset capo     ;formattazione
        int 21h
                
        mov al,b                ;sposto b in al
        
    
        cmp a,al
        jg stampaA              ;confronto le variabili
    
        stampaB:
            mov ah,02h
            mov dl,b            ;istruzioni se a e' minore
            int 21h
            jmp end
        
        stampaA:
            mov ah,02h
            mov dl,a            ;istruzioni se a e' maggiore
            int 21h
            
        
        end:
            mov ah, 09h
            mov dx,offset output     ;scrittura stringa output
            int 21h
            
        mov ah, 4ch
        int 21h

end

