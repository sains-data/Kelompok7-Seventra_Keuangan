USE DM_Keuangan_DW;
GO

-- Nyalakan pencatat waktu
SET STATISTICS TIME ON;

PRINT '=== MULAI TEST DATA 10.000 BARIS ===';

-- Jalankan Query Berat (Join 5 Tabel sekaligus)
SELECT 
    w.Tahun,
    u.Nama_Fakultas,
    SUM(f.Nilai_Debit) AS Total_Debit
FROM dbo.Fact_Transaksi f
JOIN dbo.Dim_Waktu w ON f.ID_Waktu = w.ID_Waktu
JOIN dbo.Dim_Unit_Org u ON f.ID_Unit = u.ID_Unit
GROUP BY w.Tahun, u.Nama_Fakultas
ORDER BY w.Tahun;

PRINT '=== SELESAI ===';
-- Matikan pencatat waktu
SET STATISTICS TIME OFF;