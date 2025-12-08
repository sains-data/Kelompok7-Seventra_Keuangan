# 💰 Data Mart - Unit Keuangan

*Tugas Besar Pergudangan Data - Kelompok [7]*

| No. | NIM | Nama Lengkap |
| :---: | :---: | :--- |
| 1 | 122450079 | *Renisha Putri Giani* |
| 2 | 123450041 | *Raihana Adelia Putri* |
| 3 | 123450114 | *Desman Velius Halawa* |
| 4 | 123450077 | *Wan Nashwa Alhasni Yuska* |

---

## 📝 Deskripsi Proyek (Project Description)

Proyek ini adalah implementasi *Data Mart Dimensional* untuk Unit Keuangan Itera. Data Mart ini dirancang untuk menyediakan sumber data yang bersih, terintegrasi, dan mudah diakses, berfokus pada analisis *transaksi anggaran, pengeluaran, dan realisasi dana*. Tujuan utamanya adalah mendukung pelaporan kinerja keuangan yang cepat dan tepat waktu melalui model data yang optimal.

---

## 🏢 Business Domain: Unit Keuangan

Fokus Data Mart ini adalah pada fungsi manajerial dan operasional keuangan Institusi:

1.  **Pengelolaan Anggaran:** Analisis kepatuhan, pemantauan Varian Anggaran vs Realisasi, dan pelaporan sisa anggaran.
2.  **Manajemen Arus Kas:** Pemantauan tren Pendapatan (Debit) dan Pengeluaran (Kredit) bulanan atau kuartalan.
3.  **Analisis Pengeluaran:** Melacak pengeluaran berdasarkan Unit Organisasi, Pos Akun (COA), dan Vendor/Pemasok.

---

## 🏛️ Architecture & Key Features

| Komponen | Detail |
| :--- | :--- |
| **Approach** | **Kimball** (Dimensional Modeling - Star Schema) |
| **Database** | SQL Server on Azure VM |
| **ETL Tool** | SQL Server Integration Services (SSIS) |
| **Visualization** | Power BI Desktop |

### Data Model (Tabel dan Metrik Utama)

**Fact Tables:**
* `Fact_Transaksi`: Berisi detail setiap entri jurnal (Debit/Kredit) untuk analisis arus kas.
* `Fact_Anggaran`: Berisi target anggaran vs. nilai realisasi untuk analisis varian kinerja.

**Dimension Tables:**
* `Dim_Waktu`: Kalender waktu (Tahun Fiskal, Kuartal, Bulan, Tanggal).
* `Dim_Unit_Org`: Informasi Unit Pelaksana Anggaran (Fakultas, Biro, UPA).
* `Dim_Pos_Akun`: *Chart of Accounts* (COA) untuk klasifikasi keuangan.
* `Dim_Vendor`: Data pemasok/pihak ketiga.
* `Dim_Sumber_Dana`: Klasifikasi sumber dana (Rutin, Hibah, Proyek, dsb).

### Key Performance Indicators (KPIs)

* **Persentase Realisasi Anggaran** per Unit dan per Pos Akun.
* **Varian Anggaran** (Selisih Anggaran vs Realisasi).
* **Tren Arus Kas** (Debit dan Kredit) bulanan/kuartalan.
* **Total Pengeluaran** berdasarkan Kategori Vendor.

---

## 📂 Repository Structure
docs/
  01-requirements/
  02-design/
  03-implementation/
presentations/
sql/
  01_Create_Database.sql
  02_Create_Dimension.sql
  03_Create_Facts.sql
  04_Indexing.sql
  05_Partition.sql
  06_Staging.sql
  07_ETL_Load_Final.sql
  08_Data_Quality_Checks.sql
  09_Test_Queries.sql
  10_Create_View.sql
  11_Security.sql
etl/
  packages/
  dashboards/
  PowerBI files
tests/
  test scripts


---

## ⏳ Project Timeline (Data Mart Keuangan)

* **Misi 1** (Analisis Kebutuhan & Desain Konseptual): Selesai **[17-11-2025]**
* **Misi 2** (Desain Logis & Skema Database): Selesai **[24-11-2025]**
* **Misi 3** (Implementasi ETL, Pengujian & Visualisasi): Selesai **[01-12-2025]**

