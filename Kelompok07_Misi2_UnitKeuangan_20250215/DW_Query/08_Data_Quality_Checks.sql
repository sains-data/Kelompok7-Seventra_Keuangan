USE DM_Keuangan_DW;
GO

PRINT '=== LAPORAN DATA QUALITY CHECK ===';

-- Cek 1: Pastikan tidak ada Transaksi yang "Anak Hilang" (Tidak punya Waktu/Akun/Unit)
SELECT 'Data Transaksi Yg Tidak Punya Tanggal' AS Isu, COUNT(*) AS Jumlah 
FROM dbo.Fact_Transaksi WHERE ID_Waktu IS NULL
UNION ALL
SELECT 'Data Transaksi Yg Tidak Punya Akun', COUNT(*) 
FROM dbo.Fact_Transaksi WHERE ID_Akun IS NULL
UNION ALL
SELECT 'Data Transaksi Yg Tidak Punya Unit', COUNT(*) 
FROM dbo.Fact_Transaksi WHERE ID_Unit IS NULL;

-- Cek 2: Pastikan tidak ada Duplikasi di Dimensi Utama (Contoh: Akun)
SELECT Kode_Akun, COUNT(*) AS Jumlah_Duplikat
FROM dbo.Dim_Pos_Akun
GROUP BY Kode_Akun
HAVING COUNT(*) > 1;

-- Cek 3: Validasi Logika Bisnis (Debit/Kredit tidak boleh negatif aneh-aneh)
SELECT 'Transaksi Nilai Negatif' AS Isu, COUNT(*) AS Jumlah
FROM dbo.Fact_Transaksi 
WHERE Nilai_Debit < 0 OR Nilai_Kredit < 0;

PRINT 'Jika semua hasil Jumlah = 0 atau tabel kosong, berarti Kualitas Data BAGUS (100%).';