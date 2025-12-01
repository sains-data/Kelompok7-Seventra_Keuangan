CREATE SCHEMA stg;
GO

-- ==============================================================================
-- 4. PEMBUATAN TABEL STAGING
-- ==============================================================================

-- Staging Master Akun
CREATE TABLE stg.Akun (
    Kode_Akun       VARCHAR(255), 
    Nama_Akun       VARCHAR(255),
    Tipe_Akun       VARCHAR(255),
    Grup_Akun       VARCHAR(255)
);
GO

-- Staging Master Unit Organisasi
CREATE TABLE stg.Unit_Org (
    Kode_Unit       VARCHAR(255), 
    Nama_Unit       VARCHAR(255),
    Nama_Fakultas   VARCHAR(255),
    Tipe_Unit       VARCHAR(255)
);
GO

-- Staging Master Vendor/Pemasok
CREATE TABLE stg.Vendor (
    Kode_Vendor     VARCHAR(255), 
    Nama_Vendor     VARCHAR(255),
    Kategori_Vendor VARCHAR(255),
    Kota            VARCHAR(255)
);
GO

-- Staging Master Sumber Dana
CREATE TABLE stg.Sumber_Dana (
    Kode_Sumber         VARCHAR(255), 
    Deskripsi_Sumber    VARCHAR(255),
    Tipe_Pendanaan      VARCHAR(255)
);
GO

-- Staging Transaksi Finansial
CREATE TABLE stg.Transaksi (
    Tanggal_Transaksi       VARCHAR(255), 
    Kode_Akun_NK            VARCHAR(255), 
    Kode_Unit_NK            VARCHAR(255), 
    Kode_Vendor_NK          VARCHAR(255), 
    Kode_Sumber_NK          VARCHAR(255), 
    ID_Transaksi_Operasional VARCHAR(255), 
    Nilai_Debit             VARCHAR(255), 
    Nilai_Kredit            VARCHAR(255)  
);
GO

-- Staging Anggaran Realisasi
CREATE TABLE stg.Anggaran (
    Periode_Anggaran        VARCHAR(255), 
    Kode_Akun_NK            VARCHAR(255), 
    Kode_Unit_NK            VARCHAR(255), 
    Nilai_Anggaran_Target   VARCHAR(255), 
    Nilai_Realisasi_Aktual  VARCHAR(255)  
);
GO