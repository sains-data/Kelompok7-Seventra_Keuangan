-- Pastikan Database berada dalam Full Recovery Model untuk mengaktifkan Log Backup

USE master;
ALTER DATABASE DM_Keuangan_DW SET RECOVERY FULL;
GO

----------------------------------------------------
-- 1. FULL BACKUP (Cadangan Penuh) - Tanpa Kompresi
----------------------------------------------------

BACKUP DATABASE DM_Keuangan_DW
TO DISK = N'D:\BackUp_Keuangan_DW\DM_Keuangan_DW_Full.bak' 
WITH
    INIT, -- Menggantikan isi file backup jika sudah ada
    NAME = N'Full Database Backup - DM_Keuangan_DW',
    STATS = 10; -- Menampilkan progress setiap 10%
GO

----------------------------------------------------
-- 2. DIFFERENTIAL BACKUP (Cadangan Diferensial) - Tanpa Kompresi
----------------------------------------------------

BACKUP DATABASE DM_Keuangan_DW
TO DISK = N'D:\BackUp_Keuangan_DW\DM_Keuangan_DW_Diff.bak' 
WITH
    DIFFERENTIAL, -- Opsi ini yang membuat backup menjadi Diferensial
    INIT, -- Menggantikan isi file backup jika sudah ada
    NAME = N'Differential Database Backup - DM_Keuangan_DW',
    STATS = 10;
GO

----------------------------------------------------
-- 3. TRANSACTION LOG BACKUP (Cadangan Log Transaksi) - Tanpa Kompresi
----------------------------------------------------

BACKUP LOG DM_Keuangan_DW
TO DISK = N'D:\BackUp_Keuangan_DW\DM_Keuangan_DW_Log.trn' 
WITH
    INIT, -- Menggantikan isi file backup jika sudah ada
    NAME = N'Transaction Log Backup - DM_Keuangan_DW',
    STATS = 10;
GO