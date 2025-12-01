USE DM_Keuangan_DW;
GO


-- ==============================================================================
-- 1. NON-CLUSTERED INDEXES pada DIMENSION TABLES (Optimasi ETL & Filtering Atribut)
-- ==============================================================================

-- Natural Key Index: Mempercepat pencarian Surrogate Key (SK) selama proses ETL.
CREATE NONCLUSTERED INDEX IX_DimVendor_KodeVendor ON dbo.Dim_Vendor (Kode_Vendor);
GO
CREATE NONCLUSTERED INDEX IX_DimAkun_KodeAkun ON dbo.Dim_Pos_Akun (Kode_Akun);
GO

-- Index Atribut Dimensi: Mempercepat Filtering dan Grouping berdasarkan hierarki/atribut.
-- Kebutuhan: Analisis Tipe Akun (misal: semua 'Beban' atau 'Pendapatan').
CREATE NONCLUSTERED INDEX IX_DimAkun_TipeGrup ON dbo.Dim_Pos_Akun (Tipe_Akun, Grup_Akun);
GO
-- Kebutuhan: Filtering waktu (misal: WHERE Tahun=2024).
CREATE NONCLUSTERED INDEX IX_DimWaktu_TahunKuartal ON dbo.Dim_Waktu (Tahun, Kuartal);
GO

-- ==============================================================================
-- 2. COVERING INDEXES pada FACT TABLES (Optimasi KPI)
-- Dibuat pada Foreign Key (FK) dan menyertakan Measures (Nilai)
-- ==============================================================================

-- Covering Index 1: Unit Performance (Mendukung query per Unit/Fakultas)
CREATE NONCLUSTERED INDEX IX_FactTransaksi_UnitCovering
ON dbo.Fact_Transaksi (ID_Unit)
INCLUDE (Nilai_Debit, Nilai_Kredit);
GO

-- Covering Index 2: Akun Performance (Mendukung query per Kategori Akun)
CREATE NONCLUSTERED INDEX IX_FactTransaksi_AkunCovering
ON dbo.Fact_Transaksi (ID_Akun)
INCLUDE (Nilai_Debit, Nilai_Kredit);
GO

-- Covering Index 3: Tren Unit Kerja (Mendukung query Waktu X Unit - KPI Eksekutif)
CREATE NONCLUSTERED INDEX IX_FactTransaksi_TrenUnit
ON dbo.Fact_Transaksi (ID_Waktu, ID_Unit)
INCLUDE (Nilai_Debit, Nilai_Kredit);
GO

-- Covering Index 4: Kinerja Anggaran Unit (KPI Varian Anggaran per Unit)
CREATE NONCLUSTERED INDEX IX_FactAnggaran_UnitCovering
ON dbo.Fact_Anggaran (ID_Unit)
INCLUDE (Nilai_Anggaran, Nilai_Realisasi, Persen_Realisasi);
GO

-- Covering Index 5: Kinerja Anggaran Akun (KPI Varian Anggaran per Akun)
CREATE NONCLUSTERED INDEX IX_FactAnggaran_AkunCovering
ON dbo.Fact_Anggaran (ID_Akun)
INCLUDE (Nilai_Anggaran, Nilai_Realisasi, Persen_Realisasi);
GO

USE DM_Keuangan_DW;
GO

-- Columnstore Index untuk Fact_Transaksi
-- Meliputi semua Foreign Keys dan Measures (Nilai_Debit, Nilai_Kredit)
CREATE NONCLUSTERED COLUMNSTORE INDEX NCCIX_Fact_Transaksi
ON dbo.Fact_Transaksi
(
    ID_Waktu,          -- Foreign Key
    ID_Akun,           -- Foreign Key
    ID_Unit,           -- Foreign Key
    ID_Vendor,         -- Foreign Key
    ID_Sumber,         -- Foreign Key
    Nilai_Debit,       -- Measure
    Nilai_Kredit       -- Measure
    -- ID_Transaksi_Operasional (Degenerate Dimension) biasanya tidak diindeks di CCI 
    -- kecuali jika sering digunakan sebagai filter tunggal.
);
GO

USE DM_Keuangan_DW;
GO

-- Columnstore Index untuk Fact_Anggaran
-- Meliputi semua Foreign Keys dan Measures (Nilai_Anggaran, Nilai_Realisasi)
CREATE NONCLUSTERED COLUMNSTORE INDEX NCCIX_Fact_Anggaran
ON dbo.Fact_Anggaran
(
    ID_Waktu,           -- Foreign Key
    ID_Akun,            -- Foreign Key
    ID_Unit,            -- Foreign Key
    Nilai_Anggaran,     -- Measure
    Nilai_Realisasi,    -- Measure
    Persen_Realisasi    -- Calculated Measure
);
GO