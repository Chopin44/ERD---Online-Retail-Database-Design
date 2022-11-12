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


-- membuat tabel dummy
CREATE TABLE error (
	id int PRIMARY KEY NOT NULL auto_increment,
	nama VARCHAR(25)
);