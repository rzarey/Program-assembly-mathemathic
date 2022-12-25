.model small

readn macro no
mov ah,01h
int 21h
sub al,30h
mov no,al
endm

disp macro msg
mov dx,offset msg
mov ah,09h
int 21h
endm

disp2 macro
mov dl,al
mov ah,02h
int 21h
endm

.data
msg1 db 0dh,0ah,"1.Penjumlahan",0dh,0ah,"2.Pengurangan",0dh,0ah,"3.Perkalian",0dh,0ah,"4.Pembagian",0dh,0ah,"5. Keluar",0dh,0ah,"Masukan pilihan = ","$"
msg2 db 0dh,0ah,"Masukan angka = ","$"
m_sum db 0dh,0ah,"Hasil jumlah = ","$"
m_sub db 0dh,0ah,"Hasil kurang = ","$"
m_mul db 0dh,0ah,"Hasil kali = ","$"
m_div db 0dh,0ah,"Hasil bagi = ","$"
m_exit db 0dh,0ah,"Terima Kasih",0dh,0ah,"$"
ch1 db ?
num1 db ?
num2 db ?

.code
start : mov ax,@data
        mov ds,ax
        disp msg1           
        readn ch1
        cmp ch1,05h         
        jz exit

        disp msg2           ;angka 1
        readn num1

        disp msg2           ;angka 2        
        readn num2

        cmp ch1,01h         ;penjumlahan
        jz f_add

        cmp ch1,02h         ;pengurangan
        jz f_sub

        cmp ch1,03h         ;perkalian
        jz f_mul

        cmp ch1,04h         ;pembagian
        jz f_div

exit :  jmp exit1           ;keluar


f_add:  mov al,num1
        add al,num2
        add al,30h
        disp m_sum
        disp2
        jmp start

f_sub:  mov al,num1
        sub al,num2
        add al,30h
        disp m_sub
        disp2
        jmp start

f_mul:  mov al,num1
        mul num2
        add al,30h
        disp m_mul
        disp2
        jmp start

f_div:  mov ah,00h 
        mov al,num1
        mov bl,num2
        div bl     
        add al,30h
        disp m_div
        disp2
        jmp start

exit1 : disp m_exit
        mov ah,4ch
        int 21h
        end
