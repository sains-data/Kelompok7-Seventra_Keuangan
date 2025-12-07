USE DM_Keuangan_DW;
GO

-- ====================================================================
-- FILE: 07_ETL_Load_Final.sql
-- DESKRIPSI: Proses memindahkan data dari Staging ke Data Warehouse
-- TANGGAL: 01 Desember 2025
-- ====================================================================

PRINT '=== MULAI PROSES ETL LOAD ===';

-- ====================================================================
-- TAHAP 1: MENGISI TABEL DIMENSI (MASTER DATA)
-- ====================================================================

-- 1.1 Isi Dimensi Akun
INSERT INTO dbo.Dim_Pos_Akun (Kode_Akun, Nama_Akun, Tipe_Akun, Grup_Akun, Start_Date, Is_Current_Flag)
SELECT DISTINCT 
    Kode_Akun, 
    Nama_Akun, 
    Tipe_Akun, 
    Grup_Akun, 
    '2021-01-01', 
    'Y'           
FROM stg.Akun
WHERE NOT EXISTS (SELECT 1 FROM dbo.Dim_Pos_Akun WHERE Kode_Akun = stg.Akun.Kode_Akun);
PRINT 'Dimensi Akun Berhasil Diisi';

-- 1.2 Isi Dimensi Unit Organisasi
INSERT INTO dbo.Dim_Unit_Org (Kode_Unit, Nama_Unit, Nama_Fakultas, Tipe_Unit, Start_Date, Is_Current_Flag)
SELECT DISTINCT 
    Kode_Unit, 
    Nama_Unit, 
    Nama_Fakultas, 
    Tipe_Unit,
    '2021-01-01',
    'Y'
FROM stg.Unit_Org
WHERE NOT EXISTS (SELECT 1 FROM dbo.Dim_Unit_Org WHERE Kode_Unit = stg.Unit_Org.Kode_Unit);
PRINT 'Dimensi Unit Organisasi Berhasil Diisi';

-- 1.3 Isi Dimensi Vendor
INSERT INTO dbo.Dim_Vendor (Kode_Vendor, Nama_Vendor, Kategori_Vendor, Kota, Start_Date, Is_Current_Flag)
SELECT DISTINCT 
    Kode_Vendor, 
    Nama_Vendor, 
    Kategori_Vendor, 
    Kota,
    '2021-01-01',
    'Y'
FROM stg.Vendor
WHERE NOT EXISTS (SELECT 1 FROM dbo.Dim_Vendor WHERE Kode_Vendor = stg.Vendor.Kode_Vendor);
PRINT 'Dimensi Vendor Berhasil Diisi';

-- 1.4 Isi Dimensi Sumber Dana
INSERT INTO dbo.Dim_Sumber_Dana (Kode_Sumber, Deskripsi_Sumber, Tipe_Pendanaan, Start_Date, Is_Current_Flag)
SELECT DISTINCT 
    Kode_Sumber, 
    Deskripsi_Sumber, 
    Tipe_Pendanaan,
    '2021-01-01',
    'Y'
FROM stg.Sumber_Dana
WHERE NOT EXISTS (SELECT 1 FROM dbo.Dim_Sumber_Dana WHERE Kode_Sumber = stg.Sumber_Dana.Kode_Sumber);
PRINT 'Dimensi Sumber Dana Berhasil Diisi';

-- Catatan: Dimensi Waktu diisi secara terpisah/manual menggunakan Import Wizard karena data khusus.

-- ====================================================================
-- TAHAP 2: MENGISI TABEL FAKTA (TRANSAKSI & ANGGARAN)
-- ====================================================================

-- 2.1 Isi Tabel Fact_Transaksi
-- Logika: Join berdasarkan ID untuk Waktu/Akun/Unit, dan Kode untuk Vendor
INSERT INTO dbo.Fact_Transaksi 
(
    ID_Waktu, ID_Akun, ID_Unit, ID_Vendor, ID_Sumber, 
    ID_Transaksi_Operasional, Nilai_Debit, Nilai_Kredit
)
SELECT 
    w.ID_Waktu,
    a.ID_Akun,
    u.ID_Unit,
    v.ID_Vendor,
    s.ID_Sumber,
    t.ID_Transaksi_Operasional,
    CAST(t.Nilai_Debit AS DECIMAL(15,2)),
    CAST(t.Nilai_Kredit AS DECIMAL(15,2))
FROM stg.Transaksi t
JOIN dbo.Dim_Waktu w        ON CAST(t.Tanggal_Transaksi AS INT) = w.ID_Waktu
JOIN dbo.Dim_Pos_Akun a     ON CAST(t.Kode_Akun_NK AS INT) = a.ID_Akun
JOIN dbo.Dim_Unit_Org u     ON CAST(t.Kode_Unit_NK AS INT) = u.ID_Unit
LEFT JOIN dbo.Dim_Vendor v  ON t.Kode_Vendor_NK = v.Kode_Vendor -- Join pakai Kode (Huruf)
JOIN dbo.Dim_Sumber_Dana s  ON CAST(t.Kode_Sumber_NK AS INT) = s.ID_Sumber;

PRINT 'Tabel Fact_Transaksi Berhasil Diisi';


-- 2.2 Isi Tabel Fact_Anggaran
-- Logika: Join berdasarkan ID untuk Waktu/Akun/Unit
INSERT INTO dbo.Fact_Anggaran 
(
    ID_Waktu, ID_Akun, ID_Unit, 
    Nilai_Anggaran, Nilai_Realisasi, Persen_Realisasi
)
SELECT 
    w.ID_Waktu,
    a.ID_Akun,
    u.ID_Unit,
    CAST(ang.Nilai_Anggaran_Target AS DECIMAL(15,2)),
    CAST(ang.Nilai_Realisasi_Aktual AS DECIMAL(15,2)),
    -- Rumus Persen Realisasi (Handling division by zero)
    CASE 
        WHEN CAST(ang.Nilai_Anggaran_Target AS DECIMAL(15,2)) = 0 THEN 0 
        ELSE (CAST(ang.Nilai_Realisasi_Aktual AS DECIMAL(15,2)) / CAST(ang.Nilai_Anggaran_Target AS DECIMAL(15,2))) * 100 
    END
FROM stg.Anggaran ang
JOIN dbo.Dim_Waktu w    ON CAST(ang.Periode_Anggaran AS INT) = w.ID_Waktu
JOIN dbo.Dim_Pos_Akun a ON CAST(ang.Kode_Akun_NK AS INT) = a.ID_Akun
JOIN dbo.Dim_Unit_Org u ON CAST(ang.Kode_Unit_NK AS INT) = u.ID_Unit;

PRINT 'Tabel Fact_Anggaran Berhasil Diisi';

PRINT '=== PROSES ETL SELESAI ===';
GO