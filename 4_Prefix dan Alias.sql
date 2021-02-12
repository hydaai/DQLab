/*Penggunaan prefix dan alias pada data*/

USE DQLab

/*---------------- Menggunakan Prefix pada Nama Kolom ----------------*/
/*Instruksi : Ambil kolom nama_produk dengan prefik nama table (ms_produk)*/
SELECT
    ms_produk.kode_produk 
FROM ms_produk

/*---------------- Menggunakan Alias pada Kolom ----------------*/
/*Instruksi : Ubah kolom no_urut menjadi nomor dan kolom nama_produk menjadi nama*/
SELECT
    no_urut AS nomor,
    nama_produk AS nama 
FROM ms_produk

/*---------------- Menghilangkan Keyword 'AS' ----------------*/
/*Instruksi : Ubah kolom no_urut menjadi nomor dan kolom nama_produk menjadi nama tanpa menggunakan AS*/
SELECT
    no_urut nomor,
    nama_produk nama 
FROM ms_produk

/*---------------- Menggabungkan Prefix dan Alias ----------------*/
/*Instruksi : Ambil kolom harga dengan alias harga_jual dilengkapi dengan prefik nama table (ms_produk)*/
SELECT
    ms_produk.harga as harga_jual
FROM ms_produk

/*---------------- Menggunakan Alias pada Table ----------------*/
/*Instruksi : Ubah table ms_produk menjadi t2*/
SELECT * FROM ms_produk t2

/*---------------- Menggunakan Prefix pada Nama Kolom ----------------*/
/*Instruksi :   -Ubah table ms_produk menjadi t2 without AS
                -Ambil kolom nama_produk dan harga dengan prefik alias*/
SELECT
    t2.nama_produk,
    t2.harga
FROM ms_produk t2
