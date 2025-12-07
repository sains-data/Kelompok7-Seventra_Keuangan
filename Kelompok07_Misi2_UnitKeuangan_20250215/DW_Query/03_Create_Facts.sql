-- ==============================================================================
-- 3. PEMBUATAN TABEL FAKTA
-- ==============================================================================

-- 3.1 Tabel Fact_Transaksi
CREATE TABLE dbo.Fact_Transaksi (
    ID_Fakta_Transaksi       BIGINT        PRIMARY KEY IDENTITY(1,1) NOT NULL, 
    -- Foreign Keys
    ID_Waktu                 INT           NOT NULL, 
    ID_Akun                  INT           NOT NULL, 
    ID_Unit                  INT           NOT NULL, 
    ID_Vendor                INT           NULL,     
    ID_Sumber                INT           NOT NULL, 
    -- Degenerate Dimension
    ID_Transaksi_Operasional VARCHAR(50)   NULL,     
    -- Measures
    Nilai_Debit              DECIMAL(15,2) NOT NULL, 
    Nilai_Kredit             DECIMAL(15,2) NOT NULL,  
    -- Metadata
    SourceSystemVar          VARCHAR(50)   NOT NULL DEFAULT 'SourceSystem',
    LoadDate                 DATETIME      DEFAULT GETDATE(),

    -- Foreign Key Constraints
    CONSTRAINT FK_FT_Waktu  FOREIGN KEY (ID_Waktu) REFERENCES dbo.Dim_Waktu(ID_Waktu),
    CONSTRAINT FK_FT_Akun   FOREIGN KEY (ID_Akun) REFERENCES dbo.Dim_Pos_Akun(ID_Akun),
    CONSTRAINT FK_FT_Unit   FOREIGN KEY (ID_Unit) REFERENCES dbo.Dim_Unit_Org(ID_Unit),
    CONSTRAINT FK_FT_Vendor FOREIGN KEY (ID_Vendor) REFERENCES dbo.Dim_Vendor(ID_Vendor),
    CONSTRAINT FK_FT_Sumber FOREIGN KEY (ID_Sumber) REFERENCES dbo.Dim_Sumber_Dana(ID_Sumber)
);
GO


-- 3.2 Tabel Fact_Anggaran
CREATE TABLE dbo.Fact_Anggaran (
    ID_Fakta_Anggaran     BIGINT        PRIMARY KEY IDENTITY(1,1) NOT NULL, 
    -- Foreign Keys
    ID_Waktu              INT           NOT NULL, 
    ID_Akun               INT           NOT NULL, 
    ID_Unit               INT           NOT NULL, 
    -- Measures
    Nilai_Anggaran        DECIMAL(15,2) NOT NULL, 
    Nilai_Realisasi       DECIMAL(15,2) NOT NULL, 
    Persen_Realisasi      DECIMAL(5,2)  NULL,     
    -- Metadata
    LoadDate              DATETIME      DEFAULT GETDATE(),

    -- Foreign Key Constraints
    CONSTRAINT FK_FactAnggaran_Waktu FOREIGN KEY (ID_Waktu) REFERENCES dbo.Dim_Waktu(ID_Waktu),
    CONSTRAINT FK_FactAnggaran_Akun  FOREIGN KEY (ID_Akun) REFERENCES dbo.Dim_Pos_Akun(ID_Akun),
    CONSTRAINT FK_FactAnggaran_Unit  FOREIGN KEY (ID_Unit) REFERENCES dbo.Dim_Unit_Org(ID_Unit)
);
GO
