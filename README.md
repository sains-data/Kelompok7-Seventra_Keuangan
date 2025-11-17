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

## 🏢 Domain Bisnis (Business Domain)

Unit Keuangan Itera bertanggung jawab atas pengelolaan seluruh siklus keuangan institusi, mulai dari perencanaan *anggaran, pencatatan **pengeluaran, hingga pelaporan **realisasi dana* dan akuntabilitas keuangan. Domain ini sangat membutuhkan data historis dan konsisten untuk memantau *kepatuhan anggaran* dan *efisiensi operasional* unit.

---

## 🏗 Arsitektur (Architecture)

* *Pendekatan (*Approach):** *Kimball Dimensional Modeling* (Menggunakan Star Schema).
* *Platform Database:* *SQL Server* di atas *Azure Virtual Machine* (VM).
* *Proses ETL:* *SQL Server Integration Services (SSIS)*.

---

## 💡 Fitur Utama (Key Features)

### Tabel Dimensi (Konteks)

* *DIM\_WAKTU*: Konteks kalender (Tahun, Kuartal, Bulan).
* *DIM\_KODE\_AKUN*: Klasifikasi dan detail akun anggaran.
* *DIM\_PEGAWAI*: Atribut SDM (NIP, Nama, Jabatan).
* *DIM\_VENDOR*: Informasi pihak ketiga/penyedia.
* *DIM\_UNIT\_KERJA*: Hierarki Unit/Prodi untuk pertanggungjawaban.
* *DIM\_SUMBER\_DANA*: Asal dana (DIPA, PNBP, Hibah).
* *DIM\_JENIS\_TRANSAKSI*: Klasifikasi detail transaksi (Belanja Modal, Penerimaan SPP, dll.).

### Tabel Fakta (Metrik)

* *FACT\_TRANSAKSI\_PENGELUARAN*: Merekam nilai setiap pengeluaran.
* *FACT\_TRANSAKSI\_PENERIMAAN*: Merekam nilai setiap penerimaan.
* *FACT\_REALISASI\_ANGGARAN: *Snapshot status anggaran (Anggaran Awal, Realisasi Kumulatif).
* *FACT\_GAJI\_PEGAWAI*: Detail biaya gaji dan tunjangan.
* *FACT\_ARUS\_KAS: Pergerakan kas (*Debit, Kredit, Saldo Akhir).

### Indikator Kinerja Utama (KPI)

| Kategori | KPI (Indikator Kinerja) | Target | Freq. Pengukuran |
| :--- | :--- | :---: | :---: |
| Efisiensi Anggaran | *Tingkat Realisasi Anggaran* | $> 95\%$ | Triwulan & Tahunan |
| Kualitas & Akurasi Data | *Persentase *Error dalam Data Transaksi** | $< 0.5\%$ | Bulanan |
| Kualitas & Akurasi Data | *Ketetapan Waktu Pelaporan Keuangan* | $100\%$ | Bulanan & Tahunan |
| Kecepatan Layanan | *Waktu Rata-rata Pemrosesan Tagihan* | $< 5$ hari kerja | Bulanan |
| Kecepatan Layanan | *Frekuensi Ketidaksesuaian Catatan* | $< 2$ kasus/periode | Bulanan |
| Kecepatan Layanan | *Waktu Rata-rata Pemrosesan Pencairan Dana* | $< 3$ hari kerja | Harian/Mingguan |
| Kepatuhan | *Tingkat Kesesuaian Terhadap Standar Audit* | $> 90\%$ | Tiap Semester |
| Kepuasan Pengguna | *Skor Survei Kepuasan Unit Kerja* | $> 4.0 / 5.0$ | Tiap Semester |

---

## 📚 Dokumentasi (Documentation)

* [*Kebutuhan Bisnis* (Business Requirements)](docs/01-requirements/)
* [*Dokumen Desain* (Design Documents)](docs/02-design/)
Link Gdocs : https://docs.google.com/document/d/1kc9Az6AgZd3U4pCPtT8yO5pkTkEcp1vaQaw4dYswCLk/edit?usp=sharing
---

## 🗓 Linimasa (Timeline)

* *Misi 1:* 17 November 2025 
* *Misi 2:* 24 November 2025
* *Misi 3:* 1 Desember 2025
