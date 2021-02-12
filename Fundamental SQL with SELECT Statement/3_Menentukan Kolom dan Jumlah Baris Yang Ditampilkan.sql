/*  -Mempraktekkan perintah SELECT untuk mengambil kolom tertentu dari table
    -Membatasi jumlah data yang akan diambil*/

USE DQLab

/*---------------- Mengambil Satu Kolom dari Table ----------------*/
/*Instruksi : Tampilkan kolom nama_produk dari table ms_produk*/
SELECT
    nama_produk 
FROM ms_produk

/*---------------- Mengambil Lebih dari Satu Kolom ----------------*/
/*Instruksi : Tampilkan kolom kode_produk dan nama_produk dari table ms_produk*/
SELECT
    nama_produk, 
    harga 
FROM ms_produk

/*---------------- Membatasi Pengambilan Jumlah Row Data ----------------*/
/*Instruksi : Ambil 3 data dari table ms_produk*/
SELECT top 3 
    nama_produk 
FROM ms_produk
