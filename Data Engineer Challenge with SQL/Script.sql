/*menguji kemampuan dasar SQL*/

USE DQLab

/*---------------- Produk DQLAB MART ----------------*/
/*Instruksi : -Tampilkan produk dari table ms_produk yang memiliki harga antara 50.000 dan 150.000*/ 
SELECT * FROM ms_produk
WHERE harga BETWEEN 5000 AND 150000

/*---------------- Thumb drive di DQLab Mart ----------------*/
/*Instruksi : -Tampilkan produk dari table ms_produk yang mengandung kata Flashdisk*/ 
SELECT * FROM ms_produk
WHERE nama_produk LIKE '%flashdisk%'

/*---------------- Pelanggan Bergelar ----------------*/
/*Instruksi : -Tampilkan nama pelanggan yang memiliki gelar S.H, Ir. dan Drs.*/ 
SELECT * FROM ms_pelanggan
WHERE nama_pelanggan LIKE ('%S.H%')
OR nama_pelanggan LIKE ('%Ir.%')
OR nama_pelanggan LIKE ('%drs.%')

/*---------------- Mengurutkan Nama Pelanggan ----------------*/
/*Instruksi : -Urutkan nama pelanggan dari yang terkecil ke yang terbesar (A ke Z)*/ 
SELECT
    nama_pelanggan
FROM ms_pelanggan
ORDER BY nama_pelanggan

/*---------------- Mengurutkan Nama Pelanggan Tanpa Gelar ----------------*/
/*Instruksi : -Urutkan nama pelanggan dari yang terkecil ke yang terbesar (A ke Z) tanpa gelar*/ 
SELECT
    nama_pelanggan
FROM ms_pelanggan
ORDER BY REPLACE(nama_pelanggan,'Ir. ','')

/*---------------- Nama Pelanggan yang Paling Panjang ----------------*/
/*Instruksi : -Tampilkan nama pelanggan yang mempunyai nama paling panjang*/ 
SELECT
    nama_pelanggan
FROM ms_pelanggan
WHERE LENGTH(nama_pelanggan) = (SELECT MAX(LENGTH(nama_pelanggan)) FROM ms_pelanggan)

/* -jika software yang digunakan mysql, gunakan length
   -jika software yang digunakan sql server, ganti length menjadi len
SELECT
    nama_pelanggan
FROM ms_pelanggan
WHERE LEN(nama_pelanggan) = (SELECT MAX(LEN(nama_pelanggan)) FROM ms_pelanggan)
*/

/*---------------- Nama Pelanggan yang Paling Panjang dengan Gelar ----------------*/
/*Instruksi : -Tampilkan nama pelanggan yang mempunyai nama terpanjang dan terpendek*/ 
SELECT
    nama_pelanggan
FROM ms_pelanggan
WHERE LENGTH(nama_pelanggan) = (SELECT MAX(LENGTH(nama_pelanggan)) FROM ms_pelanggan)
OR LENGTH(nama_pelanggan) = (SELECT MIN(LENGTH(nama_pelanggan)) FROM ms_pelanggan)
ORDER BY LEN(nama_pelanggan) desc

/* -jika software yang digunakan mysql, gunakan length
   -jika software yang digunakan sql server, ganti length menjadi len
SELECT
    nama_pelanggan
FROM ms_pelanggan
WHERE LEN(nama_pelanggan) = (SELECT MAX(LEN(nama_pelanggan)) FROM ms_pelanggan)
OR LEN(nama_pelanggan) = (SELECT MIN(LEN(nama_pelanggan)) FROM ms_pelanggan)
ORDER BY LEN(nama_pelanggan) desc
*/

/*---------------- Kuantitas Produk yang Banyak Terjual ----------------*/
/*Instruksi : -Tampilkan produk yang paling laris*/ 
SELECT 
    a.kode_produk,
    a.nama_produk,
    sum(b.qty) as total_qty
FROM ms_produk a
JOIN tr_penjualan_detail b on a.kode_produk = b.kode_produk 
GROUP BY a.kode_produk, a.nama_produk
HAVING sum(b.qty) = (SELECT SUM(qty) FROM tr_penjualan_detail 
                    GROUP BY kode_produk 
                    ORDER BY SUM(qty) DESC) 
                    limit 1)

/* -jika software yang digunakan mysql, gunakan limit
   -jika software yang digunakan sql server, ganti limit diakhir menjadi top diawal
SELECT 
    a.kode_produk,
    a.nama_produk,
    sum(b.qty) as total_qty
FROM ms_produk a
JOIN tr_penjualan_detail b on a.kode_produk = b.kode_produk 
GROUP BY a.kode_produk, a.nama_produk
HAVING sum(b.qty) = (SELECT top 1 SUM(qty) FROM tr_penjualan_detail 
                    GROUP BY kode_produk 
                    ORDER BY SUM(qty) DESC)
*/

/*---------------- Pelanggan Paling Tinggi Nilai Belanjanya ----------------*/
/*Instruksi : -Tampilkan pelanggan yang belanjanya paling besar*/
SELECT 
    a.kode_pelanggan,
    a.nama_pelanggan,
    sum(c.harga_satuan*c.qty) total_harga
FROM ms_pelanggan a
JOIN tr_penjualan b ON a.kode_pelanggan = b.kode_pelanggan 
JOIN tr_penjualan_detail c ON b.kode_transaksi = c.kode_transaksi
GROUP BY a.kode_pelanggan, a.nama_pelanggan
HAVING sum(c.harga_satuan*c.qty) = 
    (SELECT SUM(c.qty*c.harga_satuan) FROM ms_pelanggan a
    JOIN tr_penjualan b ON a.kode_pelanggan = b.kode_pelanggan 
    JOIN tr_penjualan_detail c ON b.kode_transaksi = c.kode_transaksi
    GROUP BY a.kode_pelanggan 
    ORDER BY SUM(c.qty*c.harga_satuan) DESC) 
    limit 1)

/* -jika software yang digunakan mysql, gunakan limit
   -jika software yang digunakan sql server, ganti limit diakhir menjadi top diawal
SELECT 
    a.kode_pelanggan,
    a.nama_pelanggan,
    sum(c.harga_satuan*c.qty) total_harga
FROM ms_pelanggan a
JOIN tr_penjualan b ON a.kode_pelanggan = b.kode_pelanggan 
JOIN tr_penjualan_detail c ON b.kode_transaksi = c.kode_transaksi
GROUP BY a.kode_pelanggan, a.nama_pelanggan
HAVING sum(c.harga_satuan*c.qty) = 
    (SELECT top 1 SUM(c.qty*c.harga_satuan) FROM ms_pelanggan a
    JOIN tr_penjualan b ON a.kode_pelanggan = b.kode_pelanggan 
    JOIN tr_penjualan_detail c ON b.kode_transaksi = c.kode_transaksi
    GROUP BY a.kode_pelanggan 
    ORDER BY SUM(c.qty*c.harga_satuan) DESC)
*/

/*---------------- Pelanggan yang Belum Pernah Berbelanja ----------------*/
/*Instruksi : -Tampilkan pelanggan yang belum pernah melakukan transaksi*/ 
SELECT 
    kode_pelanggan,
    nama_pelanggan,
    alamat
FROM ms_pelanggan
WHERE kode_pelanggan NOT IN (SELECT kode_pelanggan FROM tr_penjualan)

/*---------------- Transaksi Belanja dengan Daftar Belanja lebih dari 1 ----------------*/
/*Instruksi : -Tampilkan pelanggan yang belanjanya tidak hanya 1 produk*/
SELECT 
    c.kode_transaksi,
    a.kode_pelanggan,
    a.nama_pelanggan,
    b.tanggal_transaksi,
    COUNT(c.kode_produk) jumlah_detail
FROM ms_pelanggan a
JOIN tr_penjualan b ON a.kode_pelanggan = b.kode_pelanggan 
JOIN tr_penjualan_detail c ON b.kode_transaksi = c.kode_transaksi
GROUP BY c.kode_transaksi, a.kode_pelanggan, a.nama_pelanggan, b.tanggal_transaksi
HAVING COUNT(c.kode_produk) > 1
