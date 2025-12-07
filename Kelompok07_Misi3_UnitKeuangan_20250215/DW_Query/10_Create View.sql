CREATE VIEW dbo.vw_Budget_Vs_Actual
AS
SELECT
    dw.Tahun,
    dw.Kuartal,
    dw.Bulan,
    duo.Nama_Fakultas,
    duo.Nama_Unit,
    dpa.Grup_Akun,
    dpa.Nama_Akun,
    fa.Nilai_Anggaran,
    -- Realisasi diambil dari kolom Nilai_Kredit di Fact_Transaksi, yang biasanya mewakili Pengeluaran
    COALESCE(SUM(ft.Nilai_Kredit), 0) AS Nilai_Realisasi_Transaksi,
    -- Menghitung Varian (Selisih)
    (fa.Nilai_Anggaran - COALESCE(SUM(ft.Nilai_Kredit), 0)) AS Nilai_Varian,
    -- Menghitung Persentase Penyerapan/Realisasi
    CASE
        WHEN fa.Nilai_Anggaran > 0 THEN (COALESCE(SUM(ft.Nilai_Kredit), 0) / fa.Nilai_Anggaran) * 100
        ELSE NULL
    END AS Persen_Penyerapan
FROM dbo.Fact_Anggaran fa
INNER JOIN dbo.Dim_Waktu dw ON fa.ID_Waktu = dw.ID_Waktu
INNER JOIN dbo.Dim_Unit_Org duo ON fa.ID_Unit = duo.ID_Unit
INNER JOIN dbo.Dim_Pos_Akun dpa ON fa.ID_Akun = dpa.ID_Akun
-- Gabungkan dengan Fact_Transaksi untuk mendapatkan Nilai Realisasi aktual
LEFT JOIN dbo.Fact_Transaksi ft
    ON fa.ID_Waktu = ft.ID_Waktu
    AND fa.ID_Akun = ft.ID_Akun
    AND fa.ID_Unit = ft.ID_Unit
WHERE
    duo.Is_Current_Flag = 'Y' -- Menggunakan nama unit/fakultas yang berlaku saat ini
    AND dpa.Is_Current_Flag = 'Y' -- Menggunakan nama akun yang berlaku saat ini
GROUP BY
    dw.Tahun, dw.Kuartal, dw.Bulan, duo.Nama_Fakultas, duo.Nama_Unit,
    dpa.Grup_Akun, dpa.Nama_Akun, fa.Nilai_Anggaran;
GO

CREATE VIEW dbo.vw_Revenue_And_Receivables_Summary
AS
SELECT
    dw.Tahun,
    dw.Bulan,
    dw.Kuartal,
    dpa.Grup_Akun,
    dpa.Tipe_Akun,
    duo.Nama_Unit,
    -- Total Pendapatan/Penerimaan Kas (Nilai_Debit pada Akun Pendapatan)
    SUM(CASE WHEN dpa.Tipe_Akun = 'Pendapatan' THEN ft.Nilai_Debit ELSE 0 END) AS Total_Penerimaan_Kas,
    -- Total Piutang (Nilai_Debit pada Akun Piutang)
    SUM(CASE WHEN dpa.Tipe_Akun = 'Piutang' THEN ft.Nilai_Debit ELSE 0 END) AS Total_Piutang_Terbit,
    -- Total Pembayaran Piutang (Nilai_Kredit yang menutup Piutang)
    SUM(CASE WHEN dpa.Tipe_Akun = 'Piutang' THEN ft.Nilai_Kredit ELSE 0 END) AS Total_Pelunasan_Piutang
FROM dbo.Fact_Transaksi ft
INNER JOIN dbo.Dim_Waktu dw ON ft.ID_Waktu = dw.ID_Waktu
INNER JOIN dbo.Dim_Pos_Akun dpa ON ft.ID_Akun = dpa.ID_Akun
INNER JOIN dbo.Dim_Unit_Org duo ON ft.ID_Unit = duo.ID_Unit
WHERE
    dpa.Is_Current_Flag = 'Y'
    AND dpa.Tipe_Akun IN ('Pendapatan', 'Piutang') -- Filter hanya untuk Akun yang relevan
GROUP BY
    dw.Tahun, dw.Bulan, dw.Kuartal, dpa.Grup_Akun, dpa.Tipe_Akun, duo.Nama_Unit;
GO


CREATE VIEW dbo.vw_Top_Vendor_Spending
AS
SELECT
    dw.Tahun,
    dpa.Grup_Akun,
    dpa.Nama_Akun,
    dv.Nama_Vendor,
    dv.Kategori_Vendor,
    dv.Kota,
    -- Total pengeluaran kepada vendor (Nilai_Kredit pada Akun Biaya)
    SUM(CASE WHEN dpa.Tipe_Akun = 'Biaya' THEN ft.Nilai_Kredit ELSE 0 END) AS Total_Pengeluaran_Ke_Vendor
FROM dbo.Fact_Transaksi ft
INNER JOIN dbo.Dim_Waktu dw ON ft.ID_Waktu = dw.ID_Waktu
INNER JOIN dbo.Dim_Vendor dv ON ft.ID_Vendor = dv.ID_Vendor -- Hanya menampilkan transaksi yang terhubung ke Vendor
INNER JOIN dbo.Dim_Pos_Akun dpa ON ft.ID_Akun = dpa.ID_Akun
WHERE
    dv.Is_Current_Flag = 'Y' -- Menggunakan nama vendor yang berlaku saat ini
    AND dpa.Is_Current_Flag = 'Y'
    AND dpa.Tipe_Akun = 'Biaya' -- Filter hanya untuk transaksi yang merupakan biaya/pengeluaran
    AND ft.ID_Vendor IS NOT NULL -- Pastikan hanya transaksi yang memiliki Vendor
GROUP BY
    dw.Tahun, dpa.Grup_Akun, dpa.Nama_Akun, dv.Nama_Vendor, dv.Kategori_Vendor, dv.Kota;
GO
