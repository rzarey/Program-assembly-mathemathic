;=============================================================
;															
;				program untuk menghitung luas 
;				bangun ruang (persegi, persegi panjang, 
;				segitiga sama sisi, segitiga sama kaki,
;				segitiga siku-siku, trapesium, jajar genjang,
;				dan lingkaran)
;
;															
;															
;					Oleh : Reyhanssan Islamey
;															
;															
;=============================================================

org 100h

section .data
prompt_menu db "Menu:", 10, 13, 10, 13, "1. Hitung luas persegi", 10, 13, "2. Hitung luas persegi panjang", 10, 13, "3. Hitung luas segitiga sama sisi", 10, 13, "4. Hitung luas segitiga sama kaki", 10, 13, "5. Hitung luas segitiga siku-siku", 10, 13, "6. Hitung luas trapesium", 10, 13, "7. Hitung luas jajar genjang", 10, 13, "8. Hitung luas lingkaran", 10, 13, "Pilih menu (1-8): ", 0
prompt_luas_persegi db "Masukkan panjang sisi persegi: ", 0
hasil_luas_persegi db "Luas persegi: ", 0
prompt_luas_persegi_panjang db "Masukkan panjang persegi panjang: ", 0
prompt_lebar_persegi_panjang db "Masukkan lebar persegi panjang: ", 0
hasil_luas_persegi_panjang db "Luas persegi panjang: ", 0
prompt_luas_segitiga_ss db "Masukkan alas segitiga sama sisi: ", 0
hasil_luas_segitiga_ss db "Luas segitiga sama sisi: ", 0
prompt_luas_segitiga_sk db "Masukkan alas segitiga sama kaki: ", 0
prompt_tinggi_segitiga_sk db "Masukkan tinggi", 0
hasil_luas_segitiga_sk db "Luas segitiga sama kaki: ", 0
prompt_luas_segitiga_ssik db "Masukkan alas segitiga siku-siku: ", 0
prompt_tinggi_segitiga_ssik db "Masukkan tinggi segitiga siku-siku: ", 0
hasil_luas_segitiga_ssik db "Luas segitiga siku-siku: ", 0
prompt_luas_trapesium db "Masukkan panjang sisi atas trapesium: ", 0
prompt_luas_trapesium2 db "Masukkan panjang sisi bawah trapesium: ", 0
prompt_tinggi_trapesium db "Masukkan tinggi trapesium: ", 0
hasil_luas_trapesium db "Luas trapesium: ", 0
prompt_luas_jajar_genjang db "Masukkan alas jajar genjang: ", 0
prompt_tinggi_jajar_genjang db "Masukkan tinggi jajar genjang: ", 0
hasil_luas_jajar_genjang db "Luas jajar genjang: ", 0
prompt_luas_lingkaran db "Masukkan jari-jari lingkaran: ", 0
hasil_luas_lingkaran db "Luas lingkaran: ", 0

section .bss
sisi_persegi resb 2
panjang_persegi_panjang resb 2
lebar_persegi_panjang resb 2
alas_segitiga_ss resb 2
alas_segitiga_sk resb 2
tinggi_segitiga_sk resb 2
alas_segitiga_ssik resb 2
tinggi_segitiga_ssik resb 2
sisi_atas_trapesium resb 2
sisi_bawah_trapesium resb 2
tinggi_trapesium resb 2
alas_jajar_genjang resb 2
tinggi_jajar_genjang resb 2
jari2 resb 2

section .text
	mov	ah, 09h					; Menampilkan menu
	mov	dx, offset prompt_menu
	int	21h

;=============================================================
;															
;															
;															
;=============================================================

Cek_Bangun_Ruang_02:			; Proses untuk memastikan inputan user
	mov	ah, 01h					; Membaca inputan user
    int	21h
    sub	al, '0'
    mov	bl, al					; Memindahkan inputan user ke bl

    mov	ah, 01h					; Membaca inputan user
    int	21h
    sub	al, '0'
    mov	cl, al					; Memindahkan inputan user ke cl

Cek_Bangun_Ruang:				; Proses untuk memastikan inputan user
    cmp	bl, 01h
    jne	Bangun_Ruang_02
    jmp	Hitung_Luas_Persegi

Bangun_Ruang_02:
	cmp	bl, 02h
	jne	Bangun_Ruang_03
	jmp	Hitung_Luas_Persegi_Panjang

Bangun_Ruang_03:
	cmp	bl, 03h
		jne	Bangun_Ruang_04
	jmp	Hitung_Luas_Segitiga_Sama_Sisi

Bangun_Ruang_04:
	cmp	bl, 04h
	jne	Bangun_Ruang_05
	jmp	Hitung_Luas_Segitiga_Sama_Kaki

Bangun_Ruang_05:
	cmp	bl, 05h
	jne	Bangun_Ruang_06
	jmp	Hitung_Luas_Segitiga_Siku_Siku

Bangun_Ruang_06:
	cmp	bl, 06h
	jne	Bangun_Ruang_07
	jmp	Hitung_Luas_Trapesium

Bangun_Ruang_07:
	cmp	bl, 07h
	jne	Bangun_Ruang_08
	jmp	Hitung_Luas_Jajar_Genjang

Bangun_Ruang_08:
	cmp	bl, 08h
	je	Hitung_Luas_Lingkaran
	
Hitung_Luas_Persegi:			    ; Proses untuk menghitung luas persegi
	mov	ah, 09h					    ; Menampilkan prompt
	mov	dx, offset prompt_luas_persegi
	int	21h
	
	mov	ah, 01h				    	; Membaca inputan user
	int	21h
	sub	al, '0'
	mov	[sisi_persegi], al		    ; Memindahkan inputan user ke sisi_persegi
	
	mov	al, [sisi_persegi]
	mul	al
	mov	ah, 04h
	mov	dx, offset hasil_luas_persegi
	int	21h
	mov	ax, al
	add	ax, '0'
	int	21h
	jmp	Selesai

Hitung_Luas_Persegi_Panjang:	    ; Proses untuk menghitung luas persegi panjang
	mov	ah, 09h					    ; Menampilkan prompt
	mov	dx, offset prompt_luas_persegi_panjang
	int	21h
	
	mov	ah, 01h				    	; Membaca inputan user
	int	21h
	sub	al, '0'
	mov	[panjang_persegi_panjang], al	; Memindahkan inputan user ke panjang_persegi_panjang
	
	mov	ah, 09h					    ; Menampilkan prompt
	mov	dx, offset prompt_luas_persegi_panjang2
	int	21h
	
	mov	ah, 01h					    ; Membaca inputan user
	int	21h
	sub	al, '0'
	mov	[lebar_persegi_panjang], al	    ; Memindahkan inputan user ke lebar_persegi_panjang
	
	mov	al, [panjang_persegi_panjang]
	mul	al
	mov	al, [lebar_persegi_panjang]
	mul	al
	mov	ah, 04h
	mov	dx, offset hasil_luas_persegi_panjang
	int	21h
	mov	ax, al
	add	ax, '0'
	int	21h
	jmp	Selesai

Hitung_Luas_Segitiga_Sama_Sisi:	    ; Proses untuk menghitung luas segitiga sama sisi
	mov	ah, 09h					    ; Menampilkan prompt
	mov	dx, offset prompt_luas_segitiga_ss
	int	21h
	
	mov	ah, 01h					    ; Membaca inputan user
	int	21h
	sub	al, '0'
	mov	[alas_segitiga_ss], al	    ; Memindahkan inputan user ke alas_segitiga_ss
	
	mov	al, [alas_segitiga_ss]
	mul	al
	mov	ah, 04h
	mov	dx, offset hasil_luas_segitiga_ss
	int	21h
	mov	ax, al
	add	ax, '0'
	int	21h
	jmp	Selesai

Hitung_Luas_Segitiga_Sama_Kaki:	    ; Proses untuk menghitung luas segitiga sama kaki
	mov	ah, 09h					    ; Menampilkan prompt
	mov	dx, offset prompt_luas_segitiga_sk
	int	21h
	
	mov	ah, 01h				    	; Membaca inputan user
	int	21h
	sub	al, '0'
	mov	[alas_segitiga_sk], al	    ; Memindahkan inputan user ke alas_segitiga_sk
	
	mov	ah, 09h					    ; Menampilkan prompt
	mov	dx, offset prompt_luas_segitiga_sk2
	int	21h
	
	mov	ah, 01h					    ; Membaca inputan user
	int	21h
	sub	al, '0'
	mov	[tinggi_segitiga_sk], al	; Memindahkan inputan user ke tinggi_segitiga_sk
		mov	al, [alas_segitiga_sk]
	mul	al
	mov	al, [tinggi_segitiga_sk]
	mul	al
	shr	ax, 01h
	mov	ah, 04h
	mov	dx, offset hasil_luas_segitiga_sk
	int	21h
	mov	ax, al
	add	ax, '0'
	int	21h
	jmp	Selesai

Hitung_Luas_Segitiga_Siku_Siku:	    ; Proses untuk menghitung luas segitiga siku-siku
	mov	ah, 09h					    ; Menampilkan prompt
	mov	dx, offset prompt_luas_segitiga_sss
	int	21h
	
	mov	ah, 01h					    ; Membaca inputan user
	int	21h
	sub	al, '0'
	mov	[alas_segitiga_sss], al	    ; Memindahkan inputan user ke alas_segitiga_sss
	
	mov	ah, 09h	    				; Menampilkan prompt
	mov	dx, offset prompt_luas_segitiga_sss2
	int	21h
	
	mov	ah, 01h					    ; Membaca inputan user
	int	21h
	sub	al, '0'
	mov	[tinggi_segitiga_sss], al   ; Memindahkan inputan user ke tinggi_segitiga_sss
	
	mov	al, [alas_segitiga_sss]
	mul	al
	mov	al, [tinggi_segitiga_sss]
	mul	al
	shr	ax, 01h
	mov	ah, 04h
	mov	dx, offset hasil_luas_segitiga_sss
	int	21h
	mov	ax, al
	add	ax, '0'
	int	21h
	jmp	Selesai

Hitung_Luas_Trapesium:			    ; Proses untuk menghitung luas trapesium
	mov	ah, 09h					    ; Menampilkan prompt
	mov	dx, offset prompt_luas_trapesium
	int	21h
	
	mov	ah, 01h				    	; Membaca inputan user
	int	21h
	sub	al, '0'
	mov	[alas_atas_trapesium], al	; Memindahkan inputan user ke alas_atas_trapesium
	
	mov	ah, 09h			    		; Menampilkan prompt
	mov	dx, offset prompt_luas_trapesium2
	int	21h
	
	mov	ah, 01h		    			; Membaca inputan user
	int	21h
	sub	al, '0'
	mov	[alas_bawah_trapesium], al	; Memindahkan inputan user ke alas_bawah_trapesium
	
	mov	ah, 09h	    				; Menampilkan prompt
	mov	dx, offset prompt_luas_trapesium3
	int	21h
	
	mov	ah, 01h					    ; Membaca inputan user
	int	21h
	sub	al, '0'
	mov	[tinggi_trapesium], al	    ; Memindahkan inputan user ke tinggi_trapesium
	
	mov	al, [alas_atas_trapesium]
	add	al, [alas_bawah_trapesium]
	shr	al, 01h
	mul	al
	mov	al, [tinggi_trapesium]
	mul	al
	mov	ah, 04h
	mov	dx, offset hasil_luas_trapesium
	int	21h
	mov	ax, al
	add	ax, '0'
	int	21h
	jmp	Selesai

Hitung_Luas_Jajar_Genjang:	    	; Proses untuk menghitung luas jajar genjang
	mov	ah, 09h			    		; Menampilkan prompt
	mov	dx, offset prompt_luas_jajar_genjang
	int	21h
	
	mov	ah, 01h		    			; Membaca inputan user
	int	21h
	sub	al, '0'
	mov	[alas_jajar_genjang], al	; Memindahkan inputan user ke alas_jajar_genjang
	
	mov	ah, 09h	    				; Menampilkan prompt
	mov	dx, offset prompt_luas_jajar_genjang2
	int	21h
	
	mov	ah, 01h					    ; Membaca inputan user
	int	21h
   	sub	al, '0'
	mov	[tinggi_jajar_genjang], al	; Memindahkan inputan user ke tinggi_jajar_genjang
	
	mov	al, [alas_jajar_genjang]
	mul	al
	mov	al, [tinggi_jajar_genjang]
	mul	al
	mov	ah, 04h
	mov	dx, offset hasil_luas_jajar_genjang
	int	21h
	mov	ax, al
	add	ax, '0'
	int	21h
	jmp	Selesai

Hitung_Luas_Lingkaran:  			; Proses untuk menghitung luas lingkaran
	mov	ah, 09h 					; Menampilkan prompt
	mov	dx, offset prompt_luas_lingkaran
	int	21h
	
	mov	ah, 01h					    ; Membaca inputan user
	int	21h
	sub	al, '0'
	mov	[jari_lingkaran], al		; Memindahkan inputan user ke jari_lingkaran
	
	mov	al, [jari_lingkaran]
	mul	al
	mov	al, [pi]
	mul	al
	mov	ah, 04h
	mov	dx, offset hasil_luas_lingkaran
	int	21h
	mov	ax, al
	add	ax, '0'
	int	21h
	jmp	Selesai

Selesai:					    	; Proses untuk mengakhiri program
	mov	ah, 04ch		    		; Menutup program
	int	21h

section	.data
	
	jari_lingkaran		db	?
	pi					db	3.14
	hasil_luas_lingkaran	db	?
	prompt_luas_lingkaran	db	'Masukkan jari-jari lingkaran : $'
	alas_jajar_genjang	db	?
	tinggi_jajar_genjang	db	?
	hasil_luas_jajar_genjang	db	?
	prompt_luas_jajar_genjang	db	'Masukkan alas jajar genjang : $'
	prompt_luas_jajar_genjang2	db	'Masukkan tinggi jajar genjang : $'
	alas_atas_trapesium	db	?
	alas_bawah_trapesium	db	?
	tinggi_trapesium	db	?
	hasil_luas_trapesium	db	?
	prompt_luas_trapesium	db	'Masukkan alas atas trapesium : $'
	prompt_luas_trapesium2	db	'Masukkan alas bawah trapesium : $'
	prompt_luas_trapesium3	db	'Masukkan tinggi trapesium : $'
	sisi_a				db	?
	sisi_b				db	?
	tinggi				db	?
	hasil_luas_segitiga_siku_siku	db	?
	prompt_luas_segitiga_siku_siku	db	'Masukkan sisi a segitiga : $'
	prompt_luas_segitiga_siku_siku2	db	'Masukkan sisi b segitiga : $'
	prompt_luas_segitiga_siku_siku3	db	'Masukkan tinggi segitiga : $'
	alas				db	?
	tinggi_segitiga		db	?
	hasil_luas_segitiga_sama_kaki	db	?
	prompt_luas_segitiga_sama_kaki	db	'Masukkan alas segitiga : $'
	prompt_luas_segitiga_sama_kaki2	db	'Masukkan tinggi segitiga : $'
	alas_segitiga		db	?
	tinggi_segitiga_sama_sisi	db	?
	hasil_luas_segitiga_sama_sisi	db	?
	prompt_luas_segitiga_sama_sisi	db	'Masukkan alas segitiga : $'
	prompt_luas_segitiga_sama_sisi2	db	'Masukkan tinggi segitiga : $'
	panjang				db	?
	lebar				db	?
	hasil_luas_persegi_panjang	db	?
	prompt_luas_persegi_panjang	db	'Masukkan panjang persegi panjang : $'
	prompt_luas_persegi_panjang2	db	'Masukkan lebar persegi panjang : $'
	sisi				db	?
	hasil_luas_persegi	db	?
	prompt_luas_persegi	db	'Masukkan sisi persegi : $'





