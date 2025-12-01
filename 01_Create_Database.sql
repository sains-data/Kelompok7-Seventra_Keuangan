-- Create Database
CREATE DATABASE DM_Keuangan_DW
ON PRIMARY
(
    NAME = N'DM_Keuangan_DW_Data',
    FILENAME = N'D:\PRODI\SEMESTER 5\DW_Keuangan\DM_Keuangan_DW_Data.mdf',
    SIZE = 1GB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 256MB
)
LOG ON
(
    NAME = N'DM_Keuangan_DW_Log',
    FILENAME = N'D:\PRODI\SEMESTER 5\DW_Keuangan\DM_Keuangan_DW_Log.ldf',
    SIZE = 256MB,
    MAXSIZE = 2GB,
    FILEGROWTH = 64MB
);
GO

