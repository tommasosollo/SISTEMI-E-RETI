.model small
.stack 100h

.data
    a db ?
    b db ?
    c db ?
    max db ?
    input1 db 'inserisci a',,13,10,'$'
    input2 db 'inserisci b',,13,10,'$'
    input3 db 'inserisci c',,13,10,'$'   ;dichiaro le variabili
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
        
        mov ah, 09h
        mov dx,offset input3      ;stampo richiesta di input 
        int 21h
        
        mov ah,01h
        int 21h                 ;input
        mov c,al
        
        mov ah, 09h
        mov dx, offset capo     ;formattazione
        int 21h
        
        mov bl, a
        mov max, bl
                
        mov al, b
        
        cmp al, max
        jg bMaggioreMax
        
        bMinoreMax:
            jmp end
        
        bMaggioreMax:
            mov max, al
            jmp end
        
        end:
        
        mov al, c
        
        cmp al, max
        jg cMaggioreMax
        
        cMinoreMax:
            jmp end1
        
        cMaggioreMax:
            mov max, al
            jmp end1
        
        end1: 
          
        mov ah, 09h
        mov dx, offset capo
        int 21h  
          
        mov ah, 02h
        mov dl, max
        int 21h
        
        mov ah, 09h
        mov dx, offset output
        int 21h
            
        mov ah, 4ch
        int 21h

end
