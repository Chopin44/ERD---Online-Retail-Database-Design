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