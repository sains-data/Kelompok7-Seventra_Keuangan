-- Create User Roles
USE DM_Keuangan_DW;
GO

-- 1. Create Database Roles
CREATE ROLE db_executive_finance;
CREATE ROLE db_financial_analyst;
CREATE ROLE db_finance_viewer;
CREATE ROLE db_etl_operator;
GO

-- Grant Permissions for Executive Finance
GRANT SELECT ON SCHEMA::dbo TO db_executive_finance; -- Akses baca ke semua objek (termasuk semua Dim, Fact, dan View)
GRANT EXECUTE ON SCHEMA::dbo TO db_executive_finance; -- Untuk menjalankan Stored Procedure (misalnya Master ETL)
GO

-- Grant Permissions for Financial Analyst
GRANT SELECT ON SCHEMA::dbo TO db_financial_analyst; -- Akses baca ke semua Dim, Fact, dan View
-- Asumsi ada Schema STG untuk data staging/penyiapan. Analis mungkin butuh akses ke sana.
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::stg TO db_financial_analyst;
GO

-- Grant Permissions for Finance Viewer (Read-only)
GRANT SELECT ON dbo.vw_Budget_Vs_Actual TO db_finance_viewer;
GRANT SELECT ON dbo.vw_Revenue_And_Receivables_Summary TO db_finance_viewer;
GRANT SELECT ON dbo.vw_Top_Vendor_Spending TO db_finance_viewer;
-- Berikan akses ke dimensi Waktu dan Unit Organisasi agar mereka dapat memfilter laporan
GRANT SELECT ON dbo.Dim_Waktu TO db_finance_viewer;
GRANT SELECT ON dbo.Dim_Unit_Org TO db_finance_viewer;
GO


-- Grant Permissions for ETL Operator
GRANT EXECUTE ON SCHEMA::dbo TO db_etl_operator; -- Untuk menjalankan Stored Procedure ETL
-- Izin penuh untuk memuat/memperbarui data di semua tabel Dimensi dan Fakta
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO db_etl_operator;
GO


 
--- Create User and Assigns Roles
-- Create SQL Logins
CREATE LOGIN executive_finance_user WITH PASSWORD = 'DW_Keu@ngan_2025'; 
CREATE LOGIN analyst_finance_user WITH PASSWORD = '$D!W!_FiNance%89'; 
CREATE LOGIN viewer_finance_user WITH PASSWORD = 'UnitK3u@ngan#DM'; 
CREATE LOGIN etl_finance_service WITH PASSWORD = 'Keu@ngan_Dw#ItrA'; 
GO

USE DM_Keuangan_DW;
GO

-- Create Database Users
CREATE USER executive_finance_user FOR LOGIN executive_finance_user;
CREATE USER analyst_finance_user FOR LOGIN analyst_finance_user;
CREATE USER viewer_finance_user FOR LOGIN viewer_finance_user;
CREATE USER etl_finance_service FOR LOGIN etl_finance_service;
GO

-- Assign to Roles
ALTER ROLE db_executive_finance ADD MEMBER executive_finance_user;
ALTER ROLE db_financial_analyst ADD MEMBER analyst_finance_user;
ALTER ROLE db_finance_viewer ADD MEMBER viewer_finance_user;
ALTER ROLE db_etl_operator ADD MEMBER etl_finance_service;
GO


--- Implementasi Data Masking
USE DM_Keuangan_DW;
GO

-- Dynamic Data Masking untuk kolom sensitif di Dim_Unit_Org
ALTER TABLE dbo.Dim_Unit_Org
ALTER COLUMN Kode_Unit ADD MASKED WITH (FUNCTION = 'default()');
GO

-- Dynamic Data Masking untuk kolom sensitif di Dim_Vendor
ALTER TABLE dbo.Dim_Vendor
ALTER COLUMN Nama_Vendor ADD MASKED WITH (FUNCTION = 'partial(1,"XX-XX-",2)');
GO

-- Grant UNMASK permission untuk roles spesifik (menggunakan roles yang sudah kita buat)
GRANT UNMASK TO db_executive_finance;
GRANT UNMASK TO db_financial_analyst;
GO


--- Audit Trail
USE DM_Keuangan_DW;
GO

-- 1. Create Audit Table (DATABASE LEVEL - Sudah benar di DM_Keuangan_DW)
CREATE TABLE dbo.AuditLog (
    AuditID BIGINT IDENTITY(1,1) PRIMARY KEY,
    EventTime DATETIME2 DEFAULT SYSDATETIME(),
    UserName NVARCHAR(128) DEFAULT SUSER_SNAME(),
    EventType NVARCHAR(50), -- SELECT, INSERT, UPDATE, DELETE
    SchemaName NVARCHAR(128),
    ObjectName NVARCHAR(128),
    SqlStatement NVARCHAR(MAX),
    RowsAffected INT,
    IPAddress VARCHAR(50),
    ApplicationName NVARCHAR(128) DEFAULT APP_NAME()
);
GO

-- 2. Create Audit Triggers 

CREATE TRIGGER trg_Audit_Fact_Transaksi
ON dbo.Fact_Transaksi
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @EventType NVARCHAR(50);
    DECLARE @RowsAffected INT;
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        SET @EventType = 'UPDATE';
    ELSE IF EXISTS (SELECT * FROM inserted)
        SET @EventType = 'INSERT';
    ELSE IF EXISTS (SELECT * FROM deleted)
        SET @EventType = 'DELETE';
    SET @RowsAffected = @@ROWCOUNT;
    INSERT INTO dbo.AuditLog (EventType, SchemaName, ObjectName, RowsAffected)
    VALUES (@EventType, 'dbo', 'Fact_Transaksi', @RowsAffected);
END;
GO

CREATE TRIGGER trg_Audit_Fact_Anggaran
ON dbo.Fact_Anggaran
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @EventType NVARCHAR(50);
    DECLARE @RowsAffected INT;
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        SET @EventType = 'UPDATE';
    ELSE IF EXISTS (SELECT * FROM inserted)
        SET @EventType = 'INSERT';
    ELSE IF EXISTS (SELECT * FROM deleted)
        SET @EventType = 'DELETE';
    SET @RowsAffected = @@ROWCOUNT;
    INSERT INTO dbo.AuditLog (EventType, SchemaName, ObjectName, RowsAffected)
    VALUES (@EventType, 'dbo', 'Fact_Anggaran', @RowsAffected);
END;
GO


-- Pindah ke Master Database sebelum membuat Audit Server
USE master; 
GO

-- 3. Enable SQL Server Audit (Server-level) - HARUS DI MASTER
CREATE SERVER AUDIT DataWarehouse_Finance_Audit
TO FILE 
(
    FILEPATH = N'D:\LogAudit\'  
    ,MAXSIZE = 100 MB 
    ,MAX_ROLLOVER_FILES = 10 
)
WITH (ON_FAILURE = CONTINUE);
GO

-- 4. Mengaktifkan Audit Server - HARUS DI MASTER
ALTER SERVER AUDIT DataWarehouse_Finance_Audit WITH (STATE = ON);
GO


USE DM_Keuangan_DW;
GO

-- 5. Create Database Audit Specification - HARUS DI DATABASE TARGET
CREATE DATABASE AUDIT SPECIFICATION DataWarehouse_Finance_DB_Audit
FOR SERVER AUDIT DataWarehouse_Finance_Audit
ADD (SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo BY public); -- Audit semua operasi CRUD di schema dbo oleh semua pengguna
GO

-- 6. Mengaktifkan Spesifikasi Audit Database - HARUS DI DATABASE TARGET
ALTER DATABASE AUDIT SPECIFICATION DataWarehouse_Finance_DB_Audit WITH (STATE = ON);
GO

