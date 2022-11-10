;scelta del modello
.MODEL small       
;scelta dello stack
.STACK 100h

.DATA
n1 db 3
n2 db 3
somma db ?
output db 'la somma e',,13,10,'$'

.CODE
.STARTUP

mov ax,@data  ;sposto .data in data segment
mov ds,ax

mov al,n1      ;somma di n1, n2
add al,n2

mov somma, al   ;sposto risultato in somma

add somma, 30h  ;aggiungo 30h alla somma
            
mov ah, 09h
mov dx, offset output  ;scrivo stringa output
int 21h
            
mov ah,02h
mov dl,somma   ;visualizzazione somma
int 21h

mov ah,4ch     ;contrtollo SO
int 21h

end
