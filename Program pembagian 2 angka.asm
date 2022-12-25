.model small
.data
msg1 db 0ah,0dh,"Masukan angka pertama :$" 
msg2 db 0ah,0dh,"Masukan angka kedua :$" 
sum db 0ah,0dh,"Hasil :$"
.code
    mov ax,@data 
    mov ds,ax
    mov dx,offset msg1 
    mov ah,09h
    int 21h
    mov ah,01h 
    int 21h
    mov bh,al
    mov ah,01h 
    int 21h
    mov bl,al
    mov dx,offset msg2 
    mov ah,09h
    int 21h
    mov ah,01h 
    int 21h
    mov ch,al
    mov ah,01h 
    int 21h
    mov cl,al
    mov al,bl 
    mov ah,00h 
    add al,cl 
    aaa
    add ax,3030h 
    mov bl,al
    mov al,ah 
    mov ah,00h 
    add al,bh 
    add al,ch 
    aaa
    add ax,3030h 
    mov bh,al
    mov cl,ah
    mov dx,offset sum 
    mov ah,09h
    int 21h
    mov dl,cl 
    mov ah,02h 
    int 21h
    mov dl,bh 
    mov ah,02h 
    int 21h
    mov dl,bl 
    mov ah,02h 
    int 21h
    mov ah,4ch 
    int 21h
    end