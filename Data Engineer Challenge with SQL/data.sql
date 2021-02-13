USE DQLab

CREATE TABLE ms_produk(
    no_urut INT,
    kode_produk VARCHAR(256),
    nama_produk VARCHAR(256),
    harga INT
)
INSERT into ms_produk 
(no_urut, kode_produk, nama_produk, harga)
VALUES 
(1, 'prod-01','Kotak Pensil DQLab', 62500),
(2, 'prod-02','Flashdisk DQLab 64 GB', 55000),
(3, 'prod-03','Gift Voucher DQLab 100rb', 100000),
(4, 'prod-04','Flashdisk DQLab 32 GB', 40000),
(5, 'prod-05','Gift Voucher DQLab 250rb', 250000),
(6, 'prod-06','Pulpen Multifunction + Laser DQLab', 92500),
(7, 'prod-07','Tas Travel Organizer DQLab', 48000),
(8, 'prod-08','Gantungan Kunci DQLab', 15800),
(9, 'prod-09','Buku Planner Agenda DQLab', 92000),
(10, 'prod-10','Sticky Notes DQLab 500 sheets', 55000)

CREATE TABLE ms_pelanggan(
    no_urut INT,
    kode_cabang VARCHAR(256),
    kode_pelanggan VARCHAR(256),
    nama_pelanggan VARCHAR(256),
    alamat VARCHAR(256)
)
INSERT into ms_pelanggan 
(no_urut, kode_cabang, kode_pelanggan, nama_pelanggan, alamat)
VALUES 
(1, 'jkt-001', 'cust0001', 'Eva Novianti, S.H.', 'Vila Sempilan, No. 67'),
(2, 'jkt-002', 'cust0002', 'Heidi Goh', 'Ruko Sawit Permai 72 No. 1'),
(3, 'jkt-001', 'cust0003', 'Unang Handoko', 'Vila Sempilan No. 1'),
(4, 'jkt-001', 'cust0004', 'Jokolono Sukarman', 'Permata Intan Berkilau Residence, Blok C5-7'),
(5, 'bdg-001', 'cust0005', 'Tommy Sinaga', 'Avatar Village, Blok C8 No. 888'),
(6, 'bdg-001', 'cust0006', 'Irwan Setianto', 'Rukan Gunung Seribu, Blok O1 - No. 1'),
(7, 'jkt-001', 'cust0007', 'Agus Cahyono', 'Jalan Motivasi Tinggi, Blok F4 - No. 8'),
(8, 'jkt-001', 'cust0008', 'Maria Sirait', 'Cluster Akasia Residence, Blok AA No. 3'),
(9, 'jkt-002', 'cust0009', 'Ir. Ita Nugraha', 'Perumahan Sagitarius, Gang Kelapa No. 6'),
(10, 'bdg-001', 'cust0010', 'Djoko Wardoyo, Drs.', 'Bukit Pintar Data, Blok A1 No. 1')

CREATE TABLE tr_penjualan_detail(
    kode_transaksi VARCHAR(256),
    kode_produk VARCHAR(256),
    qty INT,
    harga_satuan INT
)
INSERT into tr_penjualan_detail
(kode_transaksi, kode_produk, qty, harga_satuan)
VALUES
('tr-0001', 'prod-04', 3, 40000),
('tr-0001', 'prod-02', 1, 55000),
('tr-0002', 'prod-08', 2, 15800),
('tr-0003', 'prod-10', 1, 55000),
('tr-0004', 'prod-09', 1, 92000),
('tr-0005', 'prod-06', 1, 92500),
('tr-0006', 'prod-08', 2, 15800),
('tr-0007', 'prod-08', 2, 15800),
('tr-0008', 'prod-07', 1, 50000),
('tr-0009', 'prod-01', 2, 62500),
('tr-0010', 'prod-04', 3, 48000),
('tr-0010', 'prod-08', 1, 15800),
('tr-0010', 'prod-04', 1, 40000)

CREATE TABLE tr_penjualan(
    kode_transaksi VARCHAR(256),
    tanggal_transaksi DATETIME,
    kode_cabang VARCHAR(256),
    kode_pelanggan VARCHAR(256),
    no_urut INT,
    kode_prod VARCHAR(256),
    qty INT,
    harga INT
)
INSERT into tr_penjualan
(kode_transaksi, tanggal_transaksi, kode_cabang, kode_pelanggan, no_urut, kode_prod, qty, harga)
VALUES
('tr-0001', '2019-06-07 10:09:46', 'jkt-001', 'cust0007', 1, 'prod-01', 5, 62000),
('tr-0001', '2019-06-07 10:09:46', 'jkt-001', 'cust0007', 2, 'prod-03', 1, 95000),
('tr-0001', '2019-06-07 10:09:46', 'jkt-001', 'cust0007', 3, 'prod-09', 3, 93000),
('tr-0001', '2019-06-07 10:09:46', 'jkt-001', 'cust0007', 4, 'prod-04', 3, 40000),
('tr-0002', '2019-06-07 13:05:12', 'jkt-001', 'cust0001', 1, 'prod-03', 2, 95000),
('tr-0002', '2019-06-07 13:05:12', 'jkt-001', 'cust0001', 2, 'prod-10', 4, 55000),
('tr-0002', '2019-06-07 13:05:12', 'jkt-001', 'cust0001', 3, 'prod-07', 1, 48000),
('tr-0003', '2019-06-08 22:09:46', 'jkt-001', 'cust0004', 1, 'prod-02', 2, 55000),
('tr-0004', '2019-06-08 22:09:46', 'jkt-001', 'cust0004', 1, 'prod-10', 5, 55000),
('tr-0004', '2019-06-08 22:09:46', 'jkt-001', 'cust0004', 2, 'prod-04', 4, 40000),
('tr-0005', '2019-06-09 22:09:46', 'jkt-001', 'cust0003', 1, 'prod-09', 3, 92000),
('tr-0005', '2019-06-09 22:09:46', 'jkt-001', 'cust0003', 2, 'prod-01', 1, 62500),
('tr-0005', '2019-06-09 22:09:46', 'jkt-001', 'cust0003', 3, 'prod-04', 2, 41000),
('tr-0006', '2019-06-09 22:09:46', 'jkt-001', 'cust0008', 1, 'prod-05', 4, 250000),
('tr-0006', '2019-06-09 22:09:46', 'jkt-001', 'cust0008', 2, 'prod-08', 2, 15800)
