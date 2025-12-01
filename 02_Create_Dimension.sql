USE DM_Keuangan_DW;
GO

-- ==============================================================================
-- 2. PEMBUATAN TABEL DIMENSI (DENGAN SCD TIPE 2)
-- ==============================================================================

-- 2.1 Tabel Dimensi Pos Akun (Dim_Pos_Akun) - SCD Tipe 2
CREATE TABLE dbo.Dim_Pos_Akun (
    ID_Akun       INT           PRIMARY KEY IDENTITY(1,1) NOT NULL, 
    Kode_Akun     VARCHAR(20)   NOT NULL, -- Natural Key (Tanpa UNIQUE)
    Nama_Akun     VARCHAR(100)  NOT NULL,                             
    Tipe_Akun     VARCHAR(50)   NOT NULL,                             
    Grup_Akun     VARCHAR(50)   NOT NULL,
    Start_Date      DATE            NOT NULL DEFAULT '2021-01-01',   -- Kolom SCD Tipe 2
    End_Date        DATE            NULL,                           -- Kolom SCD Tipe 2
    Is_Current_Flag CHAR(1)         NOT NULL DEFAULT 'Y'            -- Kolom SCD Tipe 2
);
GO

-- 2.2 Tabel Dimensi Unit Organisasi (Dim_Unit_Org) - SCD Tipe 2
CREATE TABLE dbo.Dim_Unit_Org (
    ID_Unit         INT           PRIMARY KEY IDENTITY(1,1) NOT NULL, 
    Kode_Unit       VARCHAR(10)   NOT NULL, -- Natural Key (Tanpa UNIQUE)
    Nama_Unit       VARCHAR(100)  NOT NULL,                             
    Nama_Fakultas   VARCHAR(100)  NULL,                               
    Tipe_Unit       VARCHAR(50)   NOT NULL,
    Start_Date      DATE            NOT NULL DEFAULT '2021-01-01',   -- Kolom SCD Tipe 2
    End_Date        DATE            NULL,                           -- Kolom SCD Tipe 2
    Is_Current_Flag CHAR(1)         NOT NULL DEFAULT 'Y'            -- Kolom SCD Tipe 2
);
GO

-- 2.3 Tabel Dimensi Vendor/Pemasok (Dim_Vendor) - SCD Tipe 2
CREATE TABLE dbo.Dim_Vendor (
    ID_Vendor         INT           PRIMARY KEY IDENTITY(1,1) NOT NULL, 
    Kode_Vendor       VARCHAR(20)   NOT NULL, -- Natural Key (Tanpa UNIQUE)
    Nama_Vendor       VARCHAR(100)  NOT NULL,                             
    Kategori_Vendor   VARCHAR(50)   NULL,                               
    Kota              VARCHAR(100)  NULL,
    Start_Date      DATE            NOT NULL DEFAULT '2021-01-01',   -- Kolom SCD Tipe 2
    End_Date        DATE            NULL,                           -- Kolom SCD Tipe 2
    Is_Current_Flag CHAR(1)         NOT NULL DEFAULT 'Y'            -- Kolom SCD Tipe 2
);
GO

-- 2.4 Tabel Dimensi Sumber Dana (Dim_Sumber_Dana) - SCD Tipe 2
CREATE TABLE dbo.Dim_Sumber_Dana (
    ID_Sumber         INT           PRIMARY KEY IDENTITY(1,1) NOT NULL, 
    Kode_Sumber       VARCHAR(10)   NOT NULL, -- Natural Key (Tanpa UNIQUE)
    Deskripsi_Sumber  VARCHAR(100)  NOT NULL,                             
    Tipe_Pendanaan    VARCHAR(20)   NOT NULL,
    Start_Date      DATE            NOT NULL DEFAULT '2021-01-01',   -- Kolom SCD Tipe 2
    End_Date        DATE            NULL,                           -- Kolom SCD Tipe 2
    Is_Current_Flag CHAR(1)         NOT NULL DEFAULT 'Y'            -- Kolom SCD Tipe 2
);
GO

-- 2.5 Tabel Dimensi Waktu (Dim_Waktu) - SCD Tipe 0
CREATE TABLE dbo.Dim_Waktu (
    ID_Waktu          INT           PRIMARY KEY NOT NULL, 
    Tanggal           DATE          NOT NULL UNIQUE,               
    Tahun             INT           NOT NULL,              
    Kuartal           VARCHAR(5)    NOT NULL,               
    Bulan             VARCHAR(15)   NOT NULL,              
    Hari_Kerja_Flag   BIT           NOT NULL DEFAULT 1      
);
GO



