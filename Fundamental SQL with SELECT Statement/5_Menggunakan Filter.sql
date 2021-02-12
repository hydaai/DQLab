/*Mengambil data dengan kondisi tertentu menggunakan filter*/

USE DQLab

/*---------------- Menggunakan WHERE ----------------*/
/*Instruksi : -Tampilkan table ms_produk dengan syarat 
    nama_produk = Tas Travel Organizer DQLab*/
SELECT * FROM ms_produk
WHERE nama_produk = 'Tas Travel Organizer DQLab'

/*---------------- Menggunakan Operand OR ----------------*/
/*Instruksi : -Tampilkan table ms_produk dengan syarat 
    nama_produk = Gantungan Kunci DQLab atau Tas Travel Organizer DQLab*/
SELECT * FROM ms_produk
WHERE nama_produk = 'Tas Travel Organizer DQLab'
OR nama_produk = 'Gantungan Kunci DQLab'
OR nama_produk = 'Flashdisk DQLab 64 GB'

/*---------------- Filter untuk Angka ----------------*/
/*Instruksi : -Tampilkan table ms_produk dengan syarat
    harga diatas 50ribu*/
SELECT * FROM ms_produk 
WHERE harga > 50000

/*---------------- Menggunakan Operand AND ----------------*/
/*Instruksi : -Tampilkan table ms_produk dengan syarat 
    nama_produk = Gantungan Kunci DQLab
    harga kurang dari 50ribu*/
SELECT * FROM ms_produk
WHERE nama_produk = 'Gantungan Kunci DQLab' 
AND harga < 50000
