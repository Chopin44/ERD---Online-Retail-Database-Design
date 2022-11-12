-- membuat sebuah database stok
CREATE DATABASE STOK;

-- Menggunakan database stok untuk kita kelola
use STOK;

-- membuat tabel pelanggan
CREATE TABLE pelanggan (
	id int PRIMARY KEY NOT NULL auto_increment,
	nama VARCHAR(25)
);


-- membuat tabel kategori
CREATE TABLE kategori (
	id int PRIMARY KEY NOT NULL auto_increment,
	jenis VARCHAR(25)
);

-- membuat tabel barang
CREATE TABLE barang (
	id int PRIMARY KEY NOT NULL auto_increment,
	nama_barang VARCHAR(25),
	harga int,
	kategori_id int,
	FOREIGN KEY (kategori_id) REFERENCES kategori(id)
);

-- membuat tabel nota
CREATE TABLE nota (
	id int PRIMARY KEY NOT NULL auto_increment,
	pelanggan_id int,
	FOREIGN KEY (pelanggan_id) REFERENCES pelanggan(id),
	barang_id int,
	FOREIGN KEY (barang_id) REFERENCES barang(id),
	jumlah_brg int,
	tgl_pembelian date
);


-- menampilkan field-field tabel
DESC pelanggan;
DESC kategori;
DESC barang;
DESC nota;

-- isi record ke dalam tabel pelanggan
INSERT INTO pelanggan (nama) VALUES ("Bejo"), ("Deno");

-- tampilkan isi record tabel pelanggan
SELECT * FROM pelanggan;

-- hapus record nama bejo
DELETE FROM pelanggan WHERE nama="Bejo";

-- tampilkan isi record tabel pelanggan
SELECT * FROM pelanggan;

--  ganti atau update isi tabel

UPDATE pelanggan set nama = "Denna" WHERE id = "2";

-- tampilkan isi record tabel pelanggan
SELECT * FROM pelanggan;

-- Isi lagi recordnyaa
INSERT INTO pelanggan (nama) VALUES ("Sukma"), ("Ayu"), ("Reina"), ("Bima"), ("Eko"), ("Budi"), ("Bejo"), ("Rahayu"), ("Kevin");

-- tampilkan isi record tabel pelanggan
SELECT * FROM pelanggan;

-- membuat tabel dummy
CREATE TABLE error (
	id int PRIMARY KEY NOT NULL auto_increment,
	nama VARCHAR(25)
);


-- menambah kolom tabel
ALTER TABLE error add email VARCHAR(25);

-- liat fieldnya
DESC error;

-- lalu hapus
DROP TABLE error;

-- // membuat database dummy
CREATE DATABASE dummy;

-- hapus DATABASE dummy
drop DATABASE dummy;

-- Isi record tabel kategori
INSERT INTO kategori (jenis) VALUES ("Elektronik"), ("Makanan"), ("Minuman"), ("Pakaian"), ("Material");

-- liat record tabel kategori
SELECT * FROM kategori;

-- isi record tabel barang
INSERT INTO barang (nama_barang, harga, kategori_id) VALUES ("Asus ROG", 14000000, 1), ("Samsung S22", 12000000, 1), ("Bakso", 10000, 2), ("Seblak", 5000, 2), ("Mie Ayam", 5000, 2), ("Susu Coklat", 3000, 3), ("Air Putih", 1000, 2), ("Batik", 70000, 4), ("Semen 5kg", 100000, 5), ("Pasir 5kg", 200000, 5);

-- liat record tabel barang
SELECT * FROM barang;

-- isi record tabel nota
INSERT INTO nota (pelanggan_id, barang_id, jumlah_brg, tgl_pembelian) VALUES (2, 1, 1, now()), (3, 2, 2, now()), (2, 3, 1, "2022-11-02"), (2, 1, 1, "2022-11-01"), (2, 4, 4, "2022-11-02"), (4, 4, 4, now()), (5, 1, 1, "2022-10-29"), (5, 4, 2, now()), (5, 2, 3, "2022-10-30"), (5, 2, 1, "2022-10-28");

-- liat record tabel nota
SELECT * FROM nota;

-- Case 1, menampilkan 1 pelanggan dengan 3 barang berbeda
SELECT pelanggan.nama, barang.nama_barang, nota.jumlah_brg, nota.tgl_pembelian
FROM ((nota
INNER JOIN pelanggan ON nota.pelanggan_id = pelanggan.id)
INNER JOIN barang ON nota.barang_id = barang.id) HAVING pelanggan.nama = "Denna";

-- Case 2, melihat prduk yang paling sering dibeli
SELECT barang.nama_barang, nota.barang_id, count(jumlah_brg) as jml_terjual from nota INNER JOIN barang ON nota.barang_id = barang.id GROUP by barang.nama_barang  HAVING count(jumlah_brg) > 1;

-- Case 3, kategori yang barangnya banyak
SELECT kategori.jenis, sum(jumlah_brg) as total_brg_terjual from ((nota INNER JOIN barang ON nota.barang_id = barang.id) INNER JOIN kategori ON barang.kategori_id = kategori.id) GROUP by jenis;

-- Case 4, nominal transaksi per bulan
SELECT pelanggan.nama, nota.tgl_pembelian, COUNT(nota.tgl_pembelian) as jml_transaksi_bulanan FROM nota INNER JOIN pelanggan ON nota.pelanggan_id = pelanggan.id GROUP by tgl_pembelian;



