USE DM_Keuangan_DW;
GO

-- ==================================================
-- 1. Membuat FUNGSI PARTISI (Partition Function)
-- ==================================================
CREATE PARTITION FUNCTION PF_Tahunn (INT)
AS RANGE RIGHT FOR VALUES 
(
    20210101, -- Data < 2021 masuk Partisi 1
    20220101, -- Data 2021 masuk Partisi 2
    20230101, -- Data 2022 masuk Partisi 3
    20240101, -- Data 2023 masuk Partisi 4
    20250101  -- Data 2024 masuk Partisi 5 (Data >= 2025 masuk Partisi 6)
);
GO

-- ==================================================
-- 2. Membuat SKEMA PARTISI (Partition Scheme)
-- ==================================================
-- Mengarahkan semua potongan data tadi ke filegroup PRIMARY
CREATE PARTITION SCHEME PS_Tahunn
AS PARTITION PF_Tahunn
ALL TO ([PRIMARY]);
GO