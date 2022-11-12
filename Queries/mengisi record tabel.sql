-- isi record ke dalam tabel pelanggan
INSERT INTO pelanggan (nama) VALUES ("Bejo"), ("Deno");

-- Isi lagi recordnyaa
INSERT INTO pelanggan (nama) VALUES ("Sukma"), ("Ayu"), ("Reina"), ("Bima"), ("Eko"), ("Budi"), ("Bejo"), ("Rahayu"), ("Kevin");

-- Isi record tabel kategori
INSERT INTO kategori (jenis) VALUES ("Elektronik"), ("Makanan"), ("Minuman"), ("Pakaian"), ("Material");

-- isi record tabel barang
INSERT INTO barang (nama_barang, harga, kategori_id) VALUES ("Asus ROG", 14000000, 1), ("Samsung S22", 12000000, 1), ("Bakso", 10000, 2), ("Seblak", 5000, 2), ("Mie Ayam", 5000, 2), ("Susu Coklat", 3000, 3), ("Air Putih", 1000, 2), ("Batik", 70000, 4), ("Semen 5kg", 100000, 5), ("Pasir 5kg", 200000, 5);

-- isi record tabel nota
INSERT INTO nota (pelanggan_id, barang_id, jumlah_brg, tgl_pembelian) VALUES (2, 1, 1, now()), (3, 2, 2, now()), (2, 3, 1, "2022-11-02"), (2, 1, 1, "2022-11-01"), (2, 4, 4, "2022-11-02"), (4, 4, 4, now()), (5, 1, 1, "2022-10-29"), (5, 4, 2, now()), (5, 2, 3, "2022-10-30"), (5, 2, 1, "2022-10-28");