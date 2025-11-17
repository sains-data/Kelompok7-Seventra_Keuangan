
**MISI 1: DESAIN KONSEPTUAL DAN LOGIKAL**

## <a name="_fmfucohkzyxa"></a>**Step 1 – Business Requirements Analysis**
### <a name="_ri1jq1iz9p6x"></a>**Tujuan:**
Memahami kebutuhan analitik dan proses bisnis unit keuangan .
1. ### <a name="_dl064evae86q"></a>**Identifikasi Stakeholders**

|No.|**Stakeholder**|**Perat Utama di Unit Keuangan**|
| :-: | :-: | :-: |
|1\.|**Pengguna Data Mart**||
|1\.1|Staff Keuangan|Entry data, verifikasi transaksi, pembuat laporan harian/mingguan|
|1\.2|Kepala Subbagian (Kasubag) Keuangan|Monitoring realisasi anggaran harian, mingguan, dan bulanan.|
|2|**Desicion Makers**||
|2\.1|Kepala Unit Keuangan|Pengambil keputusan utama terkait alokasi, efisiensi, dan kepatuhan anggaran.|
|2\.2|Wakil Rektor Bidang Umum dan Keuangan|Menentukan kebijakan strategis keuangan dan mengesahkan rencana anggaran tahunan.|
|2\.3|Ketua Jurusan/Kepala Unit Pengguna Anggaran|Membuat keputusan realisasi belanja di unit masing-masing.|


1. Analisis Proses Bisnis

1. Analisis Proses Bisnis

   Proses bisnis utama dari Unit Keuangan ITERA mencakup siklus pengelolaan keuangan dari perencanaan hingga pelaporan:

1. **Penganggaran (Budgeting):** Penyusunan, pengajuan, dan penetapan alokasi dana per unit/aktivitas.
1. **Manajemen Pendapatan (Revenue Management):** Pengelolaan pemasukan dana (UKT, PNBP, Hibah, DIPA).
1. **Pengeluaran Keuangan (Expenditure Management):** Proses pengajuan, persetujuan, dan realisasi belanja (Gaji, Operasional, Modal).
1. **Akuntansi dan Pelaporan:** Melakukan pembukuan, rekonsiliasi bank, dan menyusun laporan keuangan rutin (LRA, Neraca, Laporan Arus Kas).
1. **Pengendalian dan Kepatuhan:** Memastikan semua transaksi sesuai dengan peraturan yang berlaku (perbendaharaan, pajak, dan internal ITERA).


1. **Identifikasi key performance indicators (KPI)**



|**Kategori Anggaran**|**KPI**|**Target**|**Freq. Pengukuran**|**Proses Bisnis Terkait**|
| :-: | :-: | :-: | :-: | :-: |
|**A**|**Efisiensi Anggaran**||||
|1\.|Tingkat Realisasi Anggaran|> 95%|Triwulan dan Tahunan|Perencanaan, Pengelaran|
|**B**|**Kualitas dan Akurasi Data**||||
|2\.|Persentase error dalam data transaksi|<0.5%|Bulanan|Akuntansi& Pelaporan|
|3\.|Ketetepatan Waktu Pelaporan Keuangan|100%|Bulanan & Tahunan|Akuntansi& Pelaporan|
|**C.**|**Kecepatan Layanan**||||
|4\.|Waktu Rata-rata Pemrosesan Tagihan (dari terima hingga bayar)|<5 hari kerja|Bulanan||
|5\.|Frekuensi ketidaksesuaian antara catatan internal dan eksternal|<2 kasus per periode|Bulanan||
|6\.|Waktu rata-rata pemrosesan pencairan dana|<3 hari kerja|Harian||
|**D.**|**Kepatuhan**||||
|7\.|Tingkat kesesuaian terhadap standar audit dan peraturan keuangan|>90% dalam 30 hari|Tiap Semeter|Pengendalian & Kepatuhan|
|**E.**|**Kepuasan Pengguna Layanan Keuangan**||||
|8\.|Skor survei kepuasan unit kerja|> 4.0 / 5.0|Tiap Semeter||


1. **Kebutuhan Analitik**
1. **Pertanyaan Bisnis**

   Daftar pertanyaan bisnis yang perlu dijawab

1. Bagaimana tren realisasi anggaran dibandingkan dengan rencana (per bulan/per unit)?
1. Unit kerja mana yang memiliki deviasi anggaran paling besar?
1. Berapa rata-rata waktu pemrosesan pencairan dana per jenis kegiatan?
1. Apa sumber pendapatan terbesar ITERA dan bagaimana tren pertumbuhannya?
1. Berapa persentase kesalahan pencatatan transaksi keuangan?
1. Bagaimana distribusi pengeluaran berdasarkan kategori (gaji, operasional, proyek, penelitian, dll)?
1. Bagaimana pola arus kas (cash flow) harian, mingguan, dan bulanan?
1. Kategori belanja apa yang paling sering mengalami keterlambatan pembayaran?
1. Apa faktor yang paling mempengaruhi keterlambatan pelaporan keuangan?
1. Bagaimana tingkat kepuasan unit kerja terhadap layanan keuangan?
1. Apa saja jenis *error* transaksi yang paling sering terjadi (misalnya: salah kode akun, salah jumlah)?
1. Sumber dana mana yang memberikan kontribusi terbesar terhadap total revenue?


1. **Jenis Laporan Yang Dibutuhkan**

   |**Jenis Laporan**|**Frekuensi**|**Pengguna Utama**|**Fokus Utama**|
   | :-: | :-: | :-: | :-: |
   |Laporan Progres Realisasi|Weekly|Kepala Unit Keuangan|Penggunaan dana dan efisiensi anggaran|
   |Laporan Rekonsiliasi Bank|Bulanan||Kesesuaian saldo internal dan eksternal|
   |Laporan Arus Kas (CFO)|Bulanan|Kepala Unit Keuangan, WR|Arus kas operasional, investasi, dan pendanaan.|
   |Laporan Kepatuhan Anggaran|Bulanan||Daftar transaksi dengan potensi pelanggaran kode akun/batas anggaran.|
   |Laporan Keuangan Institusi|Tahunan||LRA, Neraca, Laporan Operasional.|

1. **Level Agregasi dan Granularitas Data**

   |**Dimensi**|**Level Agregasi yang Dibutuhkan**|**Granularitas Data yang Harus Tersedia**|
   | :-: | :-: | :-: |
   |Waktu|Bulanan, Triwulan, Tahunan|Tanggal Transaksi (**Harian**)|
   |Anggaran|Akun Utama (misal: Belanja Pegawai), Unit Kerja, Jenis Sumber Dana|Detail Akun, Nomor Transaksi, Pos Anggaran|
   |Organisasi|Institusi/Fakultas/Unit|Nomor Identitas Pegawai/Unit, ID Vendor/Supplier|
   |Transaksi|Total per Kategori Belanja/Pendapatan|Setiap entri bukti transaksi|
















## <a name="_ehm196d5ujku"></a>**Step 2: Data Source Identification**
Tujuan: Mengidentifikasi dan menganalisis seluruh sumber data yang digunakan dalam kegiatan operasional dan pelaporan Unit Keuangan ITERA, guna memastikan data yang masuk ke *data mart* memiliki kualitas tinggi, konsisten, dan relevan untuk kebutuhan analitik.

1. **Identifikasi Sumber Data**
1. **Database operasional (OLTP)**

   *Online Transaction Processing* *database* yang digunakan untuk mencatat transaksi harian. Ini kemungkinan berisi data paling *granular* (detail) dari semua proses bisnis yang telah diidentifikasi (Penganggaran, Manajemen Pendapatan, Pengeluaran, Akuntansi).

   |No.|Nama System|Deskripsi|Tabel|
   | :- | :- | :- | :- |
   |1|Sistem Informasi Keuangan|Sistem utama pengelolaan transaksi keuangan institusi|<p>1. Transaksi Pengeluaran</p><p>2. Transaksi Penerimaan</p><p>3. Master Kode Akun</p><p>4. Master Unit</p><p>5. Anggaran</p>|
   |2|Sistem Akuntansi|Pencatatan jurnal dan pembukuan||
   |3|Sistem Penggajian|Manajemen gaji pegawai|<p>1. Data Gaji</p><p>2. Tunjangan</p><p>3. Potongan</p><p>4. Master Pegawai</p>|
   |4|Sistem pencatatan aset dan barang milik negara|Sistem pencatatan aset dan barang milik negara|<p>1. Aset Tetap</p><p>2. Pengadaan</p><p>3. Mutasi Barang</p>|
   |5|Sistem pencairan dana|Sistem pencairan dana|<p>1. SPM</p><p>2. Detail Pembayaran</p>|

1. **File Excel/CSV**

   Digunakan untuk data yang mungkin berasal dari eksternal atau dikelola secara mandiri (misalnya, data anggaran awal atau rekonsiliasi spesifik).

   |No.|Nama File|Deskripsi|Sumber|Frekunesi Update|
   | :- | :- | :- | :- | :- |
   |1|Laporan Bank Harian|Mutasi rekening bank||Harian|
   |2|Data UKT Mahasiswa|Pembayaran UKT per semester||Per Semester|
   |3|Rekapitulasi Tagihan Vendor|Tagihan dari supplier/vendor||Per Minggu|
   |4|Data PNBP|Penerimaan Negara Bukan Pajak||Per Bulan|
   |5|Target dan Realisasi Anggaran|Monitoring anggaran per unit||Per Bulan|

1. **Manual data entry**

   Data yang dimasukkan langsung ke dalam sistem atau *data mart* secara manual.

   |No.|Jenis Data|Deskripsi|Input Oleh|Frekunesi Update|
   | :- | :- | :- | :- | :- |
   |1|Bukti Transaksi|Scan/foto kwitansi, nota, invoice||Harian|
   |2|Jurnal Penyesuaian|Koreksi dan adjustment||Per Semester|
   |3|Data Survei Kepuasan|Feedback dari unit kerja||Per Semester|
   |4|Catatan Kas Kecil|Pengeluaran kas kecil||Harian|
   |5|Memo dan Disposisi|Persetujuan dan otorisasi||Per Peristiwa|


1. **Data Source Analysis**

   Tujuan: memahami struktur, kualitas, dan perilaku data di masing-masing sumber.

1. **Struktur dan schema data source**

`	`**A. SIMKEU (Sistem Informasi Keuangan)**

`	`**Tabel: TransaksiPengeluaran**

|**Atribut**|**Tipe Data**|**Deskripsi**|
| :- | :-: | :-: |
|id\_transaksi|bigint|PK|
|tanggal\_transaksi|date|Tanggal transaksi|
|no\_bukti|varchar(50)|Nomor bukti pengeluaran|
|kode\_akun|varchar(20)|FK ke MasterKodeAkun|
|id\_unit\_kerja|int|FK ke unit kerja|
|uraian|text|Deskripsi transaksi|
|jumlah|numeric(15,2)|Nominal pengeluaran|
|id\_sumber\_dana|int|FK ke sumber dana (DIPA/PNBP/Hibah)|
|status\_approval|varchar(20)|Draft/Approved/Rejected|
|created\_by|varchar(50)|User yang input|
|created\_date|timestamp|Waktu input data|

**Tabel: TransaksiPenerimaan**

|**Atribut**|**Tipe Data**|**Deskripsi**|
| :-: | :-: | :-: |
|id\_penerimaan|bigint|PK|
|tanggal\_terima|date|Tanggal penerimaan|
|no\_bukti|varchar(50)|Nomor bukti penerimaan|
|kode\_akun|varchar(20)|FK ke MasterKodeAkun|
|jenis\_pendapatan|varchar(50)|UKT, PNBP, Hibah|
|sumber\_dana|varchar(100)|Mahasiswa/Bank/Instansi|
|jumlah|numeric(15,2)|Nominal pendapatan|
|keterangan|text|Deskripsi penerimaan|
|id\_unit\_kerja|int|FK ke unit kerja|
|created\_date|timestamp|Waktu input data|

**Tabel: MasterKodeAkun**	

|**Atribut**|**Tipe Data**|**Deskripsi**|
| :-: | :-: | :-: |
|kode\_akun|varchar(20)|PK - Kode akun anggaran|
|nama\_akun|varchar(200)|Nama akun|
|kategori\_belanja|varchar(50)|Pegawai/Barang/Modal/Sosial|
|kelompok\_akun|varchar(100)|Gaji/Operasional/Aset/dll|
|level\_akun|int|Hierarki level (1-5)|
|parent\_kode|varchar(20)|FK ke kode akun parent|
|is\_active|boolean|Status aktif|
|created\_date|timestamp|Waktu pembuatan|

**Tabel: Anggaran**

|**Atribut**|**Tipe Data**|**Deskripsi**|
| :-: | :-: | :-: |
|id\_anggaran|bigint|PK|
|tahun\_anggaran|int|Tahun anggaran (2024, 2025)|
|kode\_akun|varchar(20)|FK ke MasterKodeAkun|
|id\_unit\_kerja|int|FK ke unit kerja|
|pagu\_awal|numeric(15,2)|Alokasi awal|
|revisi|numeric(15,2)|Jumlah revisi (NULL jika tidak ada)|
|pagu\_final|numeric(15,2)|Pagu setelah revisi|
|realisasi|numeric(15,2)|Total realisasi saat ini|
|sisa\_anggaran|numeric(15,2)|Calculated: pagu\_final - realisasi|
|persentase\_realisasi|numeric(5,2)|Calculated: (realisasi/pagu\_final)\*100|
|created\_date|timestamp|Waktu pembuatan|

**Tabel: MasterUnitKerja**

|**Atribut**|**Tipe Data**|**Deskripsi**|
| :-: | :-: | :-: |
|id\_unit|int|PK|
|kode\_unit|varchar(10)|Kode unit (FT, FS, BAUK)|
|nama\_unit|varchar(200)|Nama lengkap unit|
|jenis\_unit|varchar(50)|Fakultas/Direktorat/Lembaga|
|kepala\_unit|varchar(100)|Nama pejabat|
|parent\_unit|int|FK ke unit induk (NULL jika top level)|
|is\_active|boolean|Status aktif|

**Tabel: MasterSumberDana**

|**Atribut**|**Tipe Data**|**Deskripsi**|
| :-: | :-: | :-: |
|id\_sumber\_dana|int|PK|
|kode\_sumber|varchar(10)|DIPA/PNBP/HIBAH/BLU|
|nama\_sumber|varchar(100)|Nama lengkap sumber dana|
|jenis|varchar(50)|APBN/Non-APBN|
|keterangan|text|Deskripsi detail|
|is\_active|boolean|Status aktif|

`	`**B. Sistem Penggajian**

`	`**Tabel: GajiPegawai**	

|**Atribut**|**Tipe Data**|**Deskripsi**|
| :-: | :-: | :-: |
|id\_gaji|bigint|PK|
|nip|varchar(18)|FK ke MasterPegawai|
|bulan|int|Bulan gaji (1-12)|
|tahun|int|Tahun gaji|
|gaji\_pokok|numeric(12,2)|Gaji pokok sesuai golongan|
|tunjangan\_kinerja|numeric(12,2)|Tunjangan kinerja|
|tunjangan\_struktural|numeric(12,2)|Tunjangan jabatan|
|tunjangan\_fungsional|numeric(12,2)|Tunjangan fungsional|
|tunjangan\_lainnya|numeric(12,2)|Tunjangan tambahan|
|tunjangan\_total|numeric(12,2)|Total semua tunjangan|
|potongan\_pajak|numeric(12,2)|PPh 21|
|potongan\_bpjs|numeric(12,2)|BPJS Kesehatan & Ketenagakerjaan|
|potongan\_lainnya|numeric(12,2)|Potongan lain|
|potongan\_total|numeric(12,2)|Total potongan|
|gaji\_bersih|numeric(12,2)|Gaji\_pokok + tunjangan - potongan|
|tanggal\_bayar|date|Tanggal transfer gaji|
|status\_bayar|varchar(20)|Pending/Paid/Failed|
|created\_date|timestamp|Waktu input data|

**Tabel: MasterPegawai**

|**Atribut**|**Tipe Data**|**Deskripsi**|
| :-: | :-: | :-: |
|nip|varchar(18)|PK - Nomor Induk Pegawai|
|nama\_pegawai|varchar(200)|Nama lengkap|
|golongan|varchar(10)|III/a, III/b, IV/c, dll|
|jabatan|varchar(100)|Dosen/Tendik/Pejabat|
|id\_unit\_kerja|int|FK ke unit kerja|
|status\_pegawai|varchar(20)|PNS/PPPK/Non-PNS|
|tanggal\_masuk|date|Tanggal mulai bekerja|
|is\_active|boolean|Status aktif|

`	`**C. e-SPM (Surat Perintah Membayar)**
### <a name="_pfhwv8gk0xgf"></a>**Tabel: SPM**


|**Atribut**|**Tipe Data**|**Deskripsi**|
| :- | :-: | :-: |
|id\_spm|bigint|PK|
|no\_spm|varchar(50)|Nomor SPM|
|tanggal\_spm|date|Tanggal SPM|
|jenis\_spm|varchar(20)|SPM-LS/SPM-UP/SPM-TU/SPM-GU|
|id\_transaksi|bigint|FK ke TransaksiPengeluaran|
|id\_unit\_kerja|int|FK ke unit kerja|
|nilai\_spm|numeric(15,2)|Nominal SPM|
|penerima|varchar(200)|Nama penerima|
|rekening\_penerima|varchar(50)|Nomor rekening|
|bank\_penerima|varchar(100)|Nama bank|
|keterangan|text|Uraian pembayaran|
|status|varchar(20)|Draft/Submit/Approved/Paid|
|tanggal\_submit|timestamp|Waktu submit|
|tanggal\_approve|timestamp|Waktu approval|

`	`**Tabel: SP2D**

|**Atribut**|**Tipe Data**|**Deskripsi**|
| :-: | :-: | :-: |
|id\_sp2d|bigint|PK|
|no\_sp2d|varchar(50)|Nomor SP2D dari KPPN|
|id\_spm|bigint|FK ke SPM|
|tanggal\_sp2d|date|Tanggal terbit SP2D|
|nilai\_sp2d|numeric(15,2)|Nominal yang dicairkan|
|ntp|nvarchar(50)|Nomor Transaksi Penerimaan Negara|
|tanggal\_cair|date|Tanggal dana masuk rekening|
|created\_date|timestamp|Waktu input data|


`	`**D. SIMAK BMN (Barang Milik Negara)**

`	`**Tabel: AsetTetap**

|**Atribut**|**Tipe Data**|**Deskripsi**|
| :-: | :-: | :-: |
|id\_aset|bigint|PK|
|kode\_aset|varchar(30)|Kode barang|
|nama\_aset|varchar(200)|Nama barang|
|kategori\_aset|varchar(50)|Tanah/Gedung/Kendaraan/Peralatan|
|tanggal\_perolehan|date|Tanggal beli/terima|
|nilai\_perolehan|numeric(15,2)|Harga perolehan|
|id\_unit\_kerja|int|FK ke unit kerja pengguna|
|kondisi|varchar(20)|Baik/Rusak Ringan/Rusak Berat|
|lokasi|varchar(200)|Lokasi penempatan|
|masa\_manfaat|int|Tahun (untuk penyusutan)|
|nilai\_penyusutan|numeric(15,2)|Akumulasi penyusutan|
|nilai\_buku|numeric(15,2)|Nilai perolehan - penyusutan|
|status|varchar(20)|Aktif/Dipinjamkan/Dihapus|
|created\_date|timestamp|Waktu input data|

`	`**E. File Excel/CSV**
### <a name="_kotq3fm4fd6c"></a>**Struktur: Mutasi Rekening Bank**

|**Atribut**|**Tipe Data**|**Deskripsi**|
| :-: | :-: | :-: |
|tanggal\_transaksi|date|Tanggal transaksi|
|keterangan|varchar(500)|Keterangan dari bank|
|debet|numeric(15,2)|Pengeluaran (NULL jika tidak ada)|
|kredit|numeric(15,2)|Pemasukan (NULL jika tidak ada)|
|saldo|numeric(15,2)|Saldo akhir|
|kode\_transaksi|varchar(20)|Kode dari bank (optional)|
|cabang|varchar(50)|Nama cabang bank|

###
### <a name="_mfr6464g9esh"></a><a name="_y6dbj27jccqx"></a>**Struktur: Data UKT Mahasiswa**

|**Atribut**|**Tipe Data**|**Deskripsi**|
| :-: | :-: | :-: |
|nim|varchar(15)|Nomor Induk Mahasiswa|
|nama\_mahasiswa|varchar(200)|Nama lengkap|
|program\_studi|varchar(100)|Nama prodi|
|semester|int|Semester aktif|
|golongan\_ukt|varchar(10)|UKT I, UKT II, ... UKT VIII|
|nominal\_ukt|numeric(12,2)|Nominal UKT per semester|
|tanggal\_bayar|date|Tanggal pembayaran|
|jumlah\_bayar|numeric(12,2)|Nominal yang dibayar (bisa cicilan)|
|status\_bayar|varchar(20)|Lunas/Cicilan/Belum Bayar|
|sisa\_tagihan|numeric(12,2)|Tagihan yang belum dibayar|

`	`**Update Schedule untuk Data Mart:**

1. **Daily Update:** Transaksi harian, saldo bank, arus kas
1. **Weekly Update:** Rekapitulasi mingguan, status tagihan
1. **Monthly Update:** Gaji, rekonsiliasi, laporan bulanan
1. **Quarterly Update:** Analisis realisasi anggaran
1. **Annual Update:** Laporan tahunan, master data cleanup

1. **Volume dan Growth Rate Data**

   Sistem keuangan ITERA memiliki volume yang besar karena aktivitas transaksi berjalan setiap hari.

   |**Kategori Volume Data Terbesar**|**Keterangan**|
   | :- | :- |
   |Pendapatan dan Pengeluaran|dapat mencapai ribuan transaksi per tahun, dengan kenaikan signifikan menjelang penutupan tahun anggaran.|
   |SPP, SPTJM, SPPD|meningkat saat periode perjalanan dinas dan kegiatan akademik.|
   |PBJ (Paket pekerjaan)|bertambah setiap kali ada kegiatan barang/jasa, terutama saat akhir semester.|

1. **Kualitas data (completeness, accuracy)**

   Kualitas data pada sistem keuangan masih bervariasi karena sumber data berasal dari kombinasi database operasional, file Excel, dan dokumen pendukung yang diunggah manual. Dari sisi **completeness**, beberapa atribut penting seperti tanggal verifikasi, nomor SPTJM, kode unit kerja, dan lampiran dokumen sering belum terisi lengkap ketika transaksi masih berada pada tahap awal proses. Pada data SPP dan SPTJM, kolom seperti *nilai realisasi*, *nama penyedia*, atau *kode kegiatan* kadang kosong karena baru dilengkapi setelah proses pemeriksaan. Untuk data persediaan dan inventaris, nilai aset dan lokasi barang juga tidak selalu terisi secara konsisten akibat perbedaan standar pencatatan antar unit.

   Dari sisi **accuracy**, ditemukan ketidaksesuaian nilai transaksi antara file Excel pendukung dengan data pada sistem ketika proses input dilakukan secara manual. Beberapa dokumen yang diunggah ulang menyebabkan perbedaan antara nomor dokumen dan nilai transaksi. Selain itu, format tanggal yang tidak seragam menyebabkan interpretasi data yang salah dalam beberapa kasus. Pada data PBJ, nama penyedia atau nilai kontrak kadang dituliskan dalam format berbeda, sehingga menimbulkan ketidakakuratan ketika digabungkan ke dalam sistem. Ketidaktepatan ini perlu diperbaiki melalui standardisasi format dan proses validasi data pada tahap ETL.

1. **Frekuensi update data**

   |**Sumber Data**|**Frekuensi Update**|**Waktu Update**|**Metode Update**|**Latency**|
   | :-: | :-: | :-: | :-: | :-: |
   |SIMKEU - Transaksi|Real-time|Jam kerja (08:00–16:00)|OLTP Insert/Update|< 1 menit|
   |Sistem Penggajian|Bulanan|Tanggal 1–5 setiap bulan|Batch Process|1–2 hari|
   |Laporan Bank|Harian|Setiap pagi (09:00)|Manual Download & Upload|1 hari|
   |Data UKT|Per Semester|Awal semester|Batch Import|1–2 minggu|
   |e-SPM|Real-time|Jam kerja|API Integration|< 5 menit|
   |SIMAK BMN|Harian|End of day (16:00)|Scheduled Job|1 hari|
   |Manual Entry|Harian/Ad-hoc|Jam kerja|Form Submission|1–3 hari|

1. **Data Profiling**
1. **Analisis distribusi data**
1) Distribusi Transaksi Pengeluaran per Kategori
1) Distribusi Transaksi per Bulan
- Peak Months: September (25%), Oktober (20%), November (18%)
- Low Months: Januari (3%), Februari (4%)
- Pola: Meningkat signifikan pada akhir tahun anggaran
1) Distribusi per Unit Kerja

   Top 5 Unit dengan Transaksi Terbanyak:

- Fakultas Teknologi dan Industri (30%)
- Fakultas Sains (25%)
- Unit Operasional (20%)
- Direktorat SDM (15%)
- Lainnya (10%)
1. Identifikasi null values dan outlier
1. Deteksi duplikasi

   |**Sumber Data**|**Metode Deteksi**|**% Duplikasi**|**Root Cause**|
   | :-: | :-: | :-: | :-: |
   |**TransaksiPengeluaran**|Cek: tanggal + kode\_akun + jumlah + unit|1\.2%|Double entry saat approval|
   |**TransaksiPenerimaan**|Cek: no\_bukti + tanggal|0\.8%|Import berulang dari Excel|
   |**LaporanBank**|Cek: tanggal + keterangan + jumlah|2\.5%|Download file berulang|
   |**Bukti Transaksi (scan)**|Cek: filename + upload\_date|3%|Re-upload dokumen|

1. **Konsistensi format data**
1) **Inkonsistensi Format yang Teridentifikasi**

   |**Field**|**Variasi Format**|**Contoh**|**Standard yang Direkomendasikan**|
   | :-: | :-: | :-: | :-: |
   |**Tanggal**|5 format berbeda|DD/MM/YYYY, YYYY-MM-DD, DD-MM-YY, YYYYMMDD, DD Month YYYY|YYYY-MM-DD (ISO 8601)|
   |**Nomor Bukti**|3 format|BKK/2024/001, BKK-001-2024, 001/BKK/2024|[JENIS]/YYYY/[COUNTER]|
   |**Kode Akun**|Inkonsisten|5211\.01, 5211-01, 521101|[KODE].[SUB] (5211.01)|
   |**Nominal**|2 format|1000000, 1.000.000|Numeric tanpa separator di DB|
   |**NIP**|3 format|19800101\.200501.1.001, 198001012005011001, 19800101 200501 1 001|[18\_DIGIT] (198001012005011001)|
   |**Nama Unit**|Tidak standar|FT, Fak. Teknik, Fakultas Teknik, F.Teknik|Full name (Fakultas Teknik)|

1) **Rekomendasi Standardisasi**

   Immediate Actions:

1. Data Cleansing: ETL process untuk normalisasi format
1. Validation Rules: Implementasi di form input
1. Reference Data: Master table untuk lookup values
1. Training: SOP bagi staff untuk input data

Long-term Solutions:

1. UI Improvement: Dropdown, datepicker, auto-format
1. API Integration: Standardized data exchange format
1. Data Governance: Policy dan monitoring kualitas data

|**Data Source**|**Type**|**Volume**|**Update Frequency**|
| :- | :- | :- | :- |
|Transaksi Pendapatan-Pengeluaran|SQL Server / OLTP|± 150K rows / tahun|Daily (operasional)|
|SPP & SPTJM|Excel/PDF|± 20K dokumen|Weekly (bergantung pengajuan)|
|Perjalanan Dinas|Excel|± 10K baris|Weekly|
|Paket Pekerjaan (PBJ)|Sistem PBJ / Excel|± 5K entri|Monthly / sesuai kegiatan|
|Log Verifikasi Dokumen|SQL Server|± 50K log|Real-time|
|Dokumen Pendukung (Upload)|PDF / Image|± 30K file|Daily|
|Data Vendor / Penyedia|Excel|± 2K baris|Monthly|






## <a name="_h2n3rz1yvhq2"></a>**Step 3: Conceptual Design- ERD** 
Tujuan: Membuat model konseptual yang merepresentasikan entitas bisnis 

Aktivitas: 

1. **Identifikasi Entitas** 
1. **Entitas utama (mahasiswa, dosen, mata kuliah, dll)** 

	

   |**No**|**Nama Entitas**|**Deskripsi**|
   | :- | :-: | :-: |
   |1|Transaksi\_Pengeluaran|Transaksi pengeluaran/belanja institusi|
   |2|Transaksi\_Penerimaan|Transaksi penerimaan/pendapatan institusi|
   |3|Master\_Kode\_Akun|Daftar kode akun anggaran|
   |4|Master\_Unit\_Kerja|Daftar unit kerja/organisasi|
   |5|Master\_Sumber\_Dana|Sumber dana (DIPA, PNBP, Hibah)|
   |6|Anggaran|Pagu dan realisasi anggaran|
   |7|Master\_Pegawai|Data pegawai institusi|
   |8|Gaji\_Pegawai|Rincian gaji bulanan pegawai|
   |9|SPM|Surat Perintah Membayar|
   |10|SP2D|Surat Perintah Pencairan Dana|
   |11|Vendor|Supplier/penyedia barang dan jasa|
   |12|Aset\_Tetap|Barang milik negara/institusi|
   |13|Rekening\_Bank|Rekening bank institusi|
   |14|Mutasi\_Bank|Transaksi bank harian|
   |15|Mahasiswa|Data mahasiswa (untuk UKT)|

1. **Atribut, Primary keys dan foreign keys untuk setiap entitas** 

   **Entitas : Transaksi\_Pengeluaran**

   |**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
   | :-: | :-: | :-: | :-: |
   |id\_transaksi|BIGINT|ID unik transaksi|PK |
   |tanggal\_transaksi|DATE|Tanggal transaksi||
   |no\_bukti|VARCHAR(50)|Nomor bukti pengeluaran|UNIQUE |
   |kode\_akun|VARCHAR(20)|Kode akun anggaran|FK |
   |id\_unit\_kerja|INT|Unit kerja pengaju|FK |
   |id\_sumber\_dana|INT|Sumber dana|FK |
   |id\_vendor|INT|Vendor/penerima|FK |
   |uraian|TEXT|Deskripsi transaksi||
   |jumlah|NUMERIC (15,2)|Nominal pengeluaran||
   |jumlah\_pajak|NUMERIC (15,2)|Pajak yang dipotong||
   |jumlah\_bersih|NUMERIC (15,2)|Jumlah setelah pajak||
   |status\_approval|VARCHAR(20)|Status persetujuan||
   |tanggal\_approval|TIMESTAMP|Tanggal disetujui||
   |created\_by|VARCHAR(50)|User pembuat||
   |created\_date|TIMESTAMP|Tanggal dibuat||

   **Entitas: Transaksi\_Penerimaan**

   |**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
   | :-: | :-: | :-: | :-: |
   |id\_penerimaan|BIGINT|ID unik penerimaan|PK |
   |tanggal\_terima|DATE|Tanggal penerimaan||
   |no\_bukti|VARCHAR(50)|Nomor bukti penerimaan|UNIQUE |
   |kode\_akun|VARCHAR(20)|Kode akun pendapatan|FK |
   |jenis\_pendapatan|VARCHAR(50)|UKT/PNBP/Hibah/dll||
   |sumber\_dana|VARCHAR(100)|Sumber penerimaan||
   |nim\_mahasiswa|VARCHAR(15)|NIM jika dari mahasiswa|FK |
   |id\_unit\_kerja|INT|Unit kerja penerima|FK |
   |jumlah|NUMERIC (15,2)|Nominal penerimaan||
   |keterangan|TEXT|Deskripsi||
   |created\_date|TIMESTAMP|Tanggal dibuat||

   **Entitas: Master\_Kode\_Akun**

   |**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
   | :-: | :-: | :-: | :-: |
   |kode\_akun|VARCHAR(20)|Kode akun anggaran|PK |
   |nama\_akun|VARCHAR(200)|Nama akun||
   |kategori\_belanja|VARCHAR(50)|Pegawai/Barang/Modal/Sosial||
   |kelompok\_akun|VARCHAR(100)|Gaji/Operasional/Aset||
   |level\_akun|INT|Level hierarki (1-5)||
   |parent\_kode|VARCHAR(20)|Kode akun induk|FK |
   |is\_active|BOOLEAN|Status aktif||
   |created\_date|TIMESTAMP|Tanggal dibuat||

   **Entitas: Master\_Unit\_Kerja**

   |**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
   | :-: | :-: | :-: | :-: |
   |id\_unit|INT|ID unit kerja|PK |
   |kode\_unit|VARCHAR(10)|Kode singkat unit|UNIQUE |
   |nama\_unit|VARCHAR(200)|Nama lengkap||
   |jenis\_unit|VARCHAR(50)|Fakultas/Direktorat/dll||
   |kepala\_unit|VARCHAR(100)|Nama pejabat||
   |parent\_unit|INT|Unit induk|FK |
   |is active|BOOLEAN|Status aktif||

   **Entitas: Master\_Sumber\_Dana**

   |**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
   | :-: | :-: | :-: | :-: |
   |id\_sumber\_dana|INT|ID sumber dana|PK |
   |kode\_sumber|VARCHAR(10)|Kode sumber dana|UNIQUE |
   |nama\_sumber|VARCHAR(100)|Nama lengkap||
   |jenis|VARCHAR(50)|APBN/Non-APBN||
   |keterangan|TEXT|Deskripsi||
   |is\_active|BOOLEAN|Status aktif||

   **Entitas: Anggaran**

   |**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
   | :-: | :-: | :-: | :-: |
   |id\_anggaran|BIGINT|ID anggaran|PK |
   |tahun\_anggaran|INT|Tahun anggaran||
   |kode\_akun|VARCHAR(20)|Kode akun|FK |
   |id\_unit\_kerja|INT|Unit kerja|FK|
   |id\_sumber\_dana|INT|Sumber dana|FK|
   |pagu\_awal|NUMERIC (15,2)|Alokasi awal||
   |revisi|NUMERIC (15,2)|Jumlah revisi||
   |pagu\_final|NUMERIC (15,2)|Pagu setelah revisi||
   |realisasi|NUMERIC (15,2)|Total realisasi||
   |sisa\_anggaran|NUMERIC(15,2)|Sisa (calculated)||
   |created\_date|TIMESTAMP|Tanggal dibuat||

   **Entitas: Master\_Pegawai**

   |**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
   | :-: | :-: | :-: | :-: |
   |nip|VARCHAR(18)|Nomor Induk Pegawai|PK |
   |nama\_pegawai|VARCHAR (200)|Nama lengkap||
   |golongan|VARCHAR(10)|Golongan kepegawaian||
   |jabatan|VARCHAR(100)|Jabatan||
   |id\_unit\_kerja|INT|Unit kerja|FK|
   |status\_pegawai|VARCHAR(20)|PNS/PPPK/Non-PNS||
   |tanggal\_masuk|DATE|Tanggal mulai bekerja||
   |is\_active|BOOLEAN|Status aktif||

   **Entitas: Gaji\_Pegawai**

   |**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
   | :-: | :-: | :-: | :-: |
   |id\_gaji|BIGINT|ID gaji|PK |
   |nip|VARCHAR(18)|NIP pegawai|FK|
   |bulan|INT|Bulan gaji (1-12)||
   |tahun|INT|Tahun gaji||
   |gaji\_pokok|NUMERIC(12,2)|Gaji pokok||
   |tunjangan\_total|NUMERIC (12,2)|Total tunjangan||
   |potongan\_total|NUMERIC(12,2)|Total potongan||
   |gaji\_bersih|NUMERIC(12,2)|Take home pay||
   |tanggal\_bayar|DATE|Tanggal pembayaran||
   |status\_bayar|VARCHAR(20)|Status pembayaran||
   |created\_date|TIMESTAMP|Tanggal dibuat||

   **Entitas: SPM**

   |**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
   | :-: | :-: | :-: | :-: |
   |id\_spm|BIGINT|ID SPM|PK |
   |no\_spm|VARCHAR(50)|Nomor SPM|UNIQUE|
   |tanggal\_spm|DATE|Tanggal SPM||
   |jenis\_spm|VARCHAR(20)|SPM-LS/UP/TU/GU||
   |id\_transaksi|BIGINT|Transaksi terkait|FK |
   |id\_unit\_kerja|INT|Unit kerja pengaju|FK |
   |nilai\_spm|NUMERIC (15,2)|Nominal SPM||
   |penerima|VARCHAR(200)|Nama penerima||
   |rekening\_penerima|VARCHAR(50)|Nomor rekening||
   |bank\_penerima|VARCHAR (100)|Nama bank||
   |status|VARCHAR(20)|Status SPM||
   |tanggal\_submit|TIMESTAMP|Waktu submit||
   |tanggal\_approve|TIMESTAMP|Waktu approve||

   **Entitas: SP2D**

   |**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
   | :-: | :-: | :-: | :-: |
   |id\_sp2d|BIGINT|ID SP2D|PK |
   |no\_sp2d|VARCHAR(50)|Nomor SP2D|UNIQUE |
   |id\_spm|BIGINT|SPM terkait|FK|
   |tanggal\_sp2d|DATE|Tanggal terbit SP2D||
   |nilai\_sp2d|NUMERIC (15,2)|Nominal pencairan||
   |ntpn|VARCHAR(50)|NTPN||
   |tanggal\_cair|DATE|Tanggal dana masuk||
   |created\_date|TIMESTAMP|Tanggal dibuat||

**Entitas: Vendor**

|**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
| :-: | :-: | :-: | :-: |
|id\_vendor|INT|ID vendor|PK 99|
|kode\_vendor|VARCHAR(20)|Kode vendor|UNIQUE 100|
|nama\_vendor|VARCHAR(200)|Nama perusahaan||
|kategori\_vendor|VARCHAR(50)|Supplier/Kontraktor/dll||
|npwp|VARCHAR(20)|NPWP vendor||
|alamat|TEXT|Alamat lengkap||
|kota|VARCHAR(100)|Kota||
|no\_rekening|VARCHAR(50)|Nomor rekening||
|nama\_bank|VARCHAR(100)|Nama bank||
|is\_active|BOOLEAN|Status aktif||

**Entitas: Aset\_Tetap**

|**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
| :-: | :-: | :-: | :-: |
|id\_aset|BIGINT|ID aset|PK 109|
|kode\_aset|VARCHAR(30)|Kode barang|UNIQUE 110|
|nama\_aset|VARCHAR(200)|Nama barang||
|kategori\_aset|VARCHAR(50)|Tanah/Gedung/dll||
|tanggal\_perolehan|DATE|Tanggal beli/terima||
|nilai\_perolehan|NUMERIC (15,2)|Harga perolehan||
|id\_unit\_kerja|INT|Unit pengguna|FK 115|
|id\_vendor|INT|Vendor pembeli|FK 116|
|kondisi|VARCHAR(20)|Kondisi barang||
|lokasi|VARCHAR(200)|Lokasi penempatan||
|nilai\_buku|NUMERIC (15,2)|Nilai buku saat ini||
|status|VARCHAR(20)|Status aset||

**Entitas: Rekening\_Bank**

|**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
| :-: | :-: | :-: | :-: |
|id\_rekening|INT|ID rekening|PK 121|
|no\_rekening|VARCHAR(50)|Nomor rekening|UNIQUE 122|
|nama\_rekening|VARCHAR(200)|Nama pemegang||
|nama\_bank|VARCHAR(100)|Nama bank||
|cabang|VARCHAR(100)|Cabang bank||
|jenis\_rekening|VARCHAR(50)|Operasional/Escrow/dll||
|id\_unit\_kerja|INT|Unit pemegang|FK 127|
|saldo\_awal|NUMERIC (15,2)|Saldo awal||
|is\_active|BOOLEAN|Status aktif||

**Entitas: Mutasi\_Bank**

|**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
| :-: | :-: | :-: | :-: |
|id\_mutasi|BIGINT|ID mutasi|PK 130|
|id\_rekening|INT|Rekening terkait|FK 131|
|tanggal\_transaksi|DATE|Tanggal transaksi||
|keterangan|VARCHAR(500)|Keterangan dari bank||
|debet|NUMERIC (15,2)|Pengeluaran||
|kredit|NUMERIC (15,2)|Pemasukan||
|saldo|NUMERIC (15,2)|Saldo setelah transaksi||
|kode\_transaksi|VARCHAR(20)|Kode dari bank||
|created\_date|TIMESTAMP|Tanggal input||

**Entitas: Mahasiswa**

|**Atribut**|**Tipe Data**|**Keterangan**|**Key**|
| :-: | :-: | :-: | :-: |
|nim|VARCHAR(15)|Nomor Induk Mahasiswa|PK |
|nama\_mahasiswa|VARCHAR(200)|Nama lengkap||
|angkatan|INT|Tahun angkatan||
|program\_studi|VARCHAR(100)|Nama prodi||
|semester\_aktif|INT|Semester saat ini||
|golongan\_ukt|VARCHAR(10)|Golongan UKT||
|nominal\_ukt|NUMERIC (12,2)|Nominal UKT/semester||
|status\_mahasiswa|VARCHAR(20)|Aktif/Cuti/Lulus||


1. **Definisi Relationships** 

|**Entitas 1**|**Relationship**|**Entitas 2**|**Kardinalitas**|**Optional/Mandatory**|
| :-: | :-: | :-: | :-: | :-: |
|Master\_Kode\_Akun|memiliki|Master\_Kode\_Akun (parent)|1:M|Optional (self-referencing)|
|Master\_Unit\_Kerja|memiliki|Master\_Unit\_Kerja (parent)|1:M|Optional (self-referencing)|
|Master\_Kode\_Akun|digunakan dalam|Transaksi\_Pengeluaran|1:M|Mandatory|
|Master\_Kode\_Akun|digunakan dalam|Transaksi\_Penerimaan|1:M|Mandatory|
|Master\_Kode\_Akun|dialokasikan dalam|Anggaran|1:M|Mandatory|
|Master\_Unit\_Kerja|mengajukan|Transaksi\_Pengeluaran|1:M|Mandatory|
|Master\_Unit\_Kerja|menerima|Transaksi\_Penerimaan|1:M|Mandatory|
|Master\_Unit\_Kerja|memiliki|Anggaran|1:M|Mandatory|
|Master\_Unit\_Kerja|mengelola|Aset\_Tetap|1:M|Mandatory|
|Master\_Unit\_Kerja|memiliki|Rekening\_Bank|1:M|Optional|
|Master\_Unit\_Kerja|memiliki|Master\_Pegawai|1:M|Mandatory|
|Master\_Sumber\_Dana|membiayai|Transaksi\_Pengeluaran|1:M|Mandatory|
|Master\_Sumber\_Dana|menerima|Transaksi\_Penerimaan|1:M|Mandatory|
|Master\_Sumber\_Dana|dialokasikan dalam|Anggaran|1:M|Mandatory|
|Vendor|menerima|Transaksi\_Pengeluaran|1:M|Optional|
|Vendor|memasok|Aset\_Tetap|1:M|Optional|
|Master\_Pegawai|menerima|Gaji\_Pegawai|1:M|Mandatory|
|Master\_Pegawai|menerima|Transaksi\_Pengeluaran|1:M|Optional (untuk honor/perjalanan dinas)|
|Mahasiswa|membayar|Transaksi\_Penerimaan|1:M|Optional|
|Transaksi\_Pengeluaran|diproses menjadi|SPM|1:1|Optional|
|SPM|dicairkan menjadi|SP2D|1:1|Optional|
|Rekening\_Bank|memiliki|Mutasi\_Bank|1:M|Mandatory|
|Anggaran|direalisasikan melalui|Transaksi\_Pengeluaran|1:M|Optional|


1. **Gambar ERD** 

   ![](Aspose.Words.17821746-4610-4628-a9a2-59f561cf5c49.001.png)
## <a name="_ni6if2mhxosu"></a>**Step 4: Logical Design- Dimensional Model** 
Tujuan: Mengkonversi model konseptual ke dimensional model untuk data warehouse 

Aktivitas: 

|**No**|**Business Process**|**Deskripsi**|**Prioritas**|
| :-: | :-: | :-: | :-: |
|1|Pengeluaran Keuangan|Proses pencatatan dan pembayaran belanja institusi|High|
|2|Penerimaan Keuangan|Proses penerimaan dana dari berbagai sumber|High|
|3|Realisasi Anggaran|Monitoring pagu dan realisasi anggaran bulanan|High|
|4|Penggajian|Proses pembayaran gaji dan tunjangan pegawai|Medium|
|5|Arus Kas|Monitoring saldo dan mutasi kas harian|Medium|

1. **Identifikasi Fact Tables** 
1. **Tentukan business process yang akan dimodel** 

|**Nama Fact**|**Business Process**|**Grain Statement (Level Detail)**|**Granularity**|**Primary Key**|
| :-: | :-: | :-: | :-: | :-: |
|Fact\_Transaksi\_Pengeluaran |Pengeluaran/Belanja Keuangan |Satu baris per transaksi pengeluaran yang telah diapprove |Individual transaction (Atomic) |fact\_pengeluaran\_sk (Surrogate Key) |
|Fact\_Transaksi\_Penerimaan |Penerimaan/Pendapatan Keuangan |Satu baris per transaksi penerimaan yang tercatat |Individual transaction (Atomic) |fact\_penerimaan\_sk (Surrogate Key) |
|Fact\_Realisasi\_Anggaran |Monitoring Realisasi Anggaran |Satu baris per akun per unit per bulan (Monthly Periodic Snapshot) |Monthly aggregate by account and unit |fact\_realisasi\_sk (Surrogate Key) |
|Fact\_Gaji\_Pegawai |Penggajian Pegawai |Satu baris per pegawai per bulan |Monthly aggregate per employee |fact\_gaji\_sk (Surrogate Key) |
|Fact\_Arus\_Kas |Monitoring Arus Kas |Satu baris per rekening per hari (Daily Snapshot) |Daily aggregate per bank account |fact\_arus\_kas\_sk (Surrogate Key) |

1. **Pilih grain (level detail) fact table** 

   **Fact\_Transaksi\_Pengeluaran**

   |**Aspek**|**Detail**|
   | :-: | :-: |
   |Nama Fact|Fact Transaksi Pengeluaran |
   |Business Process|Pengeluaran/Belanja Keuangan |
   |Grain Statement|Satu baris per transaksi pengeluaran yang telah diapprove |
   |Level Detail|Transaction Level (Atomic) |
   |Granularity|Individual transaction |
   |Primary Key|fact pengeluaran\_sk (Surrogate Key) |

   **Fact\_Transaksi\_Penerimaan**

   |**Aspek**|**Detail**|
   | :-: | :-: |
   |Nama Fact|Fact Transaksi Penerimaan |
   |Business Process|Penerimaan/Pendapatan Keuangan |
   |Grain Statement|Satu baris per transaksi penerimaan yang tercatat |
   |Level Detail|Transaction Level (Atomic) |
   |Granularity|Individual transaction |
   |Primary Key|fact penerimaan sk (Surrogate Key) |

   **Fact\_Realisasi\_Anggaran**

   |**Aspek**|**Detail**|
   | :-: | :-: |
   |Nama Fact|Fact\_Realisasi\_Anggaran |
   |Business Process|Monitoring Realisasi Anggaran |
   |Grain Statement|Satu baris per akun per unit per bulan (Monthly Periodic Snapshot) |
   |Level Detail|Periodic Snapshot |
   |Granularity|Monthly aggregate by account and unit |
   |Primary Key|fact realisasi\_sk (Surrogate Key) |


   **Fact\_Gaji\_Pegawai**

   |**Aspek**|**Detail**|
   | :-: | :-: |
   |Nama Fact|Fact\_Gaji\_Pegawai |
   |Business Process|Penggajian Pegawai |
   |Grain Statement|Satu baris per pegawai per bulan |
   |Level Detail|Periodic Snapshot |
   |Granularity|Monthly aggregate per employee |
   |Primary Key|fact\_gaji\_sk (Surrogate Key) |

   **Fact\_Arus\_Kas**

   |**Aspek**|**Detail**|
   | :-: | :-: |
   |Nama Fact|Fact Arus Kas |
   |Business Process|Monitoring Arus Kas |
   |Grain Statement|Satu baris per rekening per hari |
   |Level Detail|Daily Snapshot |
   |Granularity|Daily aggregate per bank account |
   |Primary Key|fact arus kas sk (Surrogate Key) |


1. **Identifikasi measures (metrik numerik)**

   **Fact\_Transaksi\_Pengeluaran** 

   |**Measure Name**|**Data Type**|**Business Definition**|**Source**|
   | :-: | :-: | :-: | :-: |
   |jumlah\_transaksi|DECIMAL (15,2) |Nominal pengeluaran bruto |Transaksi Pengeluaran.jumlah |
   |jumlah\_pajak|DECIMAL (15,2) |Pajak yang dipotong (PPh/PPN) |Calculated |
   |jumlah\_bersih|DECIMAL (15,2) |Jumlah setelah pajak |jumlah\_transaksi - jumlah\_pajak |
   |lama\_proses\_hari|INT |Durasi dari pengajuan s/d bayar|Calculated|
   |jumlah\_transaksi\_count|INT |Counter untuk agregasi|COUNT(\*) |

   **Fact\_Transaksi\_Penerimaan** 

   |**Measure Name**|**Data Type**|**Business Definition**|**Source**|
   | :-: | :-: | :-: | :-: |
   |jumlah\_penerimaan|DECIMAL (15,2) |Nominal penerimaan |Transaksi Penerimaan.jumlah |
   |jumlah\_transaksi\_count|INT |Counter untuk agregasi|COUNT(\*) |

   **Fact\_Realisasi\_Anggaran - Measures**

   |**Measure Name**|**Data Type**|**Business Definition**|**Source**|
   | :-: | :-: | :-: | :-: |
   |pagu\_awal|DECIMAL (15,2) |Alokasi anggaran awal tahun |Anggaran.pagu\_awal |
   |revisi\_bulan\_ini|DECIMAL (15,2) |Revisi anggaran di bulan ini |Calculated |
   |pagu\_final|DECIMAL (15,2) |Pagu setelah semua revisi |Anggaran.pagu\_final |
   |realisasi\_bulan\_ini|DECIMAL (15,2) |Realisasi di bulan ini |SUM(transaksi) |
   |realisasi\_kumulatif|DECIMAL (15,2) |Total realisasi s/d bulan ini |Running total |
   |sisa\_anggaran|DECIMAL (15,2) |Sisa pagu yang belum terpakai |Pagu - Realisasi Kumulatif |
   |persentase\_realisasi|DECIMAL (5,2) |% realisasi terhadap pagu |Calculated |
   |jumlah\_transaksi|INT |Jumlah transaksi di bulan ini |COUNT(transaksi) |

   **Fact\_Gaji\_Pegawai - Measures**

   |**Measure Name**|**Data Type**|**Business Definition**|**Additivity Type**|
   | :-: | :-: | :-: | :-: |
   |gaji\_pokok|DECIMAL (12,2) |Gaji pokok |Additive|
   |tunjangan|DECIMAL (12,2) |Tunjangan kinerja, struktural, fungsional, lainnya |Additive |
   |total\_tunjangan|DECIMAL (12,2) |Total semua tunjangan |Additive |
   |potongan|DECIMAL (12,2) |Potongan pajak, bpjs, lainnya |Additive |
   |total\_potongan|DECIMAL (12,2) |Total semua potongan|Additive |
   |gaji\_bersih|DECIMAL (12,2) |Take home pay |Additive |
   |jumlah\_pegawai|INT |Counter pegawai |Additive |

   **Fact\_Arus\_Kas - Measures**

   |**Measure Name**|**Data Type**|**Business Definition**|**Source**|
   | :-: | :-: | :-: | :-: |
   |saldo\_awal|DECIMAL (15,2) |Saldo awal hari |Saldo\_akhir hari sebelumnya |
   |total\_penerimaan|DECIMAL (15,2) |Total uang masuk hari ini |SUM(kredit) |
   |total\_pengeluaran|DECIMAL (15,2) |Total uang keluar hari ini |SUM(debet)|
   |saldo\_akhir|DECIMAL (15,2) |Saldo akhir hari |Saldo awal + penerimaan - pengeluaran |
   |jumlah\_transaksi|INT |Jumlah transaksi masuk/keluar |COUNT(\*)|

1. **Klasifikasi additivity (additive, semi-additive, non-additive)** 

   **Fact\_Transaksi\_Pengeluaran** 

   |**Measure**|**Additivity Type**|**Explanation**|**Example Query**|
   | :-: | :-: | :-: | :-: |
   |jumlah\_transaksi|Additive|Dapat dijumlahkan di semua dimensi|Total pengeluaran per bulan/unit/akun|
   |jumlah\_pajak|Additive|Dapat dijumlahkan di semua dimensi|Total pajak per tahun|
   |jumlah\_bersih|Additive|Dapat dijumlahkan di semua dimensi|Total bersih per unit|
   |lama\_proses\_hari|Semi-Additive|Hanya bisa di-average, tidak dijumlahkan|Rata-rata lama proses per bulan|
   |jumlah\_transaksi\_count|Additive|Dapat dijumlahkan di semua dimensi|Total jumlah transaksi|

   **Fact\_Transaksi\_Penerimaan** 

   |**Measure**|**Additivity Type**|**Explanation**|**Example Query**|
   | :-: | :-: | :-: | :-: |
   |jumlah\_penerimaan|Additive|Dapat dijumlahkan di semua dimensi|Total penerimaan per sumber/bulan|
   |jumlah\_transaksi\_count|Additive|Dapat dijumlahkan di semua dimensi|Total jumlah penerimaan|

   **Fact\_Realisasi\_Anggaran** 

   |**Measure**|**Additivity Type**|**Explanation**|**Example Query**|
   | :-: | :-: | :-: | :-: |
   |pagu\_awal|Semi-Additive|Tidak bisa dijumlahkan per waktu, bisa per unit/akun|Total pagu per fakultas (di satu bulan)|
   |revisi\_bulan\_ini|Additive|Dapat dijumlahkan di semua dimensi|Total revisi per triwulan|
   |pagu\_final|Semi-Additive|Tidak bisa dijumlahkan per waktu|Total pagu final per unit (snapshot)|
   |realisasi\_bulan\_ini|Additive|Dapat dijumlahkan di semua dimensi|Total realisasi per tahun|
   |realisasi\_kumulatif|Semi-Additive|Tidak bisa dijumlahkan per waktu|Total realisasi s/d bulan ini|
   |sisa\_anggaran|Semi-Additive|Tidak bisa dijumlahkan per waktu|Sisa anggaran per unit (snapshot)|
   |persentase\_realisasi|Non-Additive|Harus dihitung ulang, tidak bisa dijumlahkan|% realisasi per unit (calculated)|
   |jumlah\_transaksi|Additive|Dapat dijumlahkan di semua dimensi|Total transaksi per semester|

   **Fact\_Gaji\_Pegawai** 

   |**Measure**|**Additivity Type**|**Explanation**|**Example Query**|
   | :-: | :-: | :-: | :-: |
   |gaji\_pokok|Additive|Dapat dijumlahkan di semua dimensi|Total gaji pokok per unit/bulan|
   |tunjangan|Additive|Dapat dijumlahkan di semua dimensi|Total tunjangan per golongan|
   |total\_tunjangan|Additive|Dapat dijumlahkan di semua dimensi|Total tunjangan per fakultas|
   |potongan|Additive|Dapat dijumlahkan di semua dimensi|Total potongan pajak per tahun|
   |total\_potongan|Additive|Dapat dijumlahkan di semua dimensi|Total potongan per bulan|
   |gaji\_bersih|Additive|Dapat dijumlahkan di semua dimensi|Total gaji bersih per unit|
   |jumlah\_pegawai|Additive|Dapat dijumlahkan di semua dimensi|Total pegawai per unit|

   **Fact\_Arus\_Kas** 

   |**Measure**|**Additivity Type**|**Explanation**|**Example Query**|
   | :-: | :-: | :-: | :-: |
   |saldo\_awal|Semi-Additive|Bisa dijumlahkan per rekening, tidak per waktu|Total saldo awal semua rekening (di satu hari)|
   |total\_penerimaan|Additive|Dapat dijumlahkan di semua dimensi|Total penerimaan per minggu/bulan|
   |total\_pengeluaran|Additive|Dapat dijumlahkan di semua dimensi|Total pengeluaran per minggu/bulan|
   |saldo\_akhir|Semi-Additive|Bisa dijumlahkan per rekening, tidak per waktu|Total saldo akhir semua rekening (snapshot)|
   |jumlah\_transaksi\_\*|Additive|Dapat dijumlahkan di semua dimensi|Total transaksi per bulan|


1. **Identifikasi Dimension Tables** 
1. **Dimension yang mendukung analisis (Who, What, Where, When, Why, How)** 

   |**Question**|**Dimension**|**Purpose**|
   | :-: | :-: | :-: |
   |WHEN|Dim\_Waktu|Analisis temporal: hari, minggu, bulan, triwulan, tahun|
   |WHAT|Dim\_Kode\_Akun|Jenis belanja/pendapatan: kategori, kelompok akun|
   |WHO|Dim\_Pegawai|Pegawai penerima/pembuat transaksi|
   |WHO|Dim\_Vendor|Supplier/penyedia barang dan jasa|
   |WHERE|Dim\_Unit\_Kerja|Unit organisasi: fakultas, direktorat, lembaga|
   |HOW|Dim\_Sumber\_Dana|Cara pembiayaan: DIPA, PNBP, Hibah|
   |WHY|Dim\_Jenis\_Transaksi|Tujuan transaksi: operasional, investasi, dll|

1. **Atribut deskriptif untuk filtering dan grouping serta Hierarki dalam dimensi (untuk drill-down/roll-up)** 

   **Dim\_Waktu (Time Dimension)**

   |**Atribut**|**Tipe**|**Deskripsi**|**Purpose**|
   | :-: | :-: | :-: | :-: |
   |waktu\_sk|INT |Surrogate Key|PK |
   |tanggal|DATE |Tanggal lengkap|Business Key |
   |nama\_bulan|VARCHAR(20) |Januari, Februari, ...|Display |
   |triwulan|INT |Triwulan (1-4)|Hierarchy Level 3 |
   |semester|INT |Semester (1-2)|Hierarchy Level 2 |
   |tahun|INT |Tahun (2024, 2025)|Hierarchy Level 1 |
   |tahun\_ajaran|VARCHAR(10) |2024/2025|Grouping (akademik) |
   |is\_hari\_kerja|BOOLEAN |TRUE jika hari kerja|Filtering |
   |is\_akhir\_bulan|BOOLEAN |TRUE jika tanggal terakhir bulan|Filtering |

**Hierarchy:** Tanggal → Bulan → Triwulan → Semester → Tahun
#### <a name="_r8930pf6vxvs"></a>**Dim\_Kode\_Akun (Account Dimension)**


|**Atribut**|**Tipe**|**Deskripsi**|**Purpose**|
| :- | :-: | :-: | :-: |
|kode\_akun\_sk|INT |Surrogate Key|PK |
|kode\_akun|VARCHAR(20) |Kode akun anggaran|Business Key |
|nama\_akun|VARCHAR(200) |Nama akun|Display |
|kategori\_belanja|VARCHAR(50) |Pegawai/Barang/Modal/Sosial|Hierarchy Level 1 |
|kelompok\_akun|VARCHAR(100) |Gaji/Operasional/Aset/dll|Hierarchy Level 2 |
|sub\_kelompok|VARCHAR(100) |Detail sub kelompok|Hierarchy Level 3 |
|is\_current|BOOLEAN |TRUE jika record terkini|SCD Type 2 |

**Hierarchy:** Kode Akun Detail (Level 3) → Sub Kelompok → Kelompok Akun (Level 2) → Kategori Belanja (Level 1)
#### <a name="_h0v3y9udmdh"></a>**Dim\_Unit\_Kerja (Organization Dimension)**

|**Atribut**|**Tipe**|**Deskripsi**|**Purpose**|
| :-: | :-: | :-: | :-: |
|unit\_kerja\_sk|INT |Surrogate Key|PK |
|kode\_unit|VARCHAR(10) |Kode unit (FT, FS, BAUK)|Business Key |
|nama\_unit|VARCHAR(200) |Nama lengkap unit|Display |
|jenis\_unit|VARCHAR(50) |Fakultas/Direktorat/Lembaga/UPT|Grouping |
|fakultas|VARCHAR(100) |Nama fakultas (jika ada)|Hierarchy Level 2 |
|institusi|VARCHAR(100) |ITERA|Hierarchy Level 1 |
|level\_organisasi|INT |Level hierarki|Hierarchy |
|is\_current|BOOLEAN |TRUE jika record terkini|SCD Type 2 |

**Hierarchy:** Unit Kerja → Divisi (Level 3) → Fakultas (Level 2) → Institusi ITERA (Level 1)
#### <a name="_1q3sq91liwvb"></a>**Dim\_Sumber\_Dana (Fund Source Dimension)**

|**Atribut**|**Tipe**|**Deskripsi**|**Purpose**|
| :-: | :-: | :-: | :-: |
|sumber\_dana\_sk|INT |Surrogate Key|PK |
|kode\_sumber|VARCHAR(10) |Kode sumber dana|Business Key |
|nama\_sumber|VARCHAR(100) |Nama lengkap|Display |
|jenis\_dana|VARCHAR(50) |APBN/Non-APBN|Hierarchy Level 1 |
|kategori|VARCHAR(50) |DIPA/PNBP/HIBAH/BLU|Hierarchy Level 2 |
|is\_active|BOOLEAN |Status aktif|Filtering |

**Hierarchy:** Kode Sumber → Kategori (Level 2) → Jenis Dana (Level 1)
#### <a name="_eh59kei8clhn"></a>**Dim\_Pegawai (Employee Dimension)**

|**Atribut**|**Tipe**|**Deskripsi**|**Purpose**|
| :-: | :-: | :-: | :-: |
|pegawai\_sk|INT |Surrogate Key|PK |
|nip|VARCHAR(18) |Nomor Induk Pegawai|Business Key |
|nama\_pegawai|VARCHAR(200) |Nama lengkap|Display |
|golongan|VARCHAR(10) |III/a, III/b, IV/c|Hierarchy Level 3 |
|jabatan|VARCHAR(100) |Dosen/Tendik/Struktural|Hierarchy Level 2 |
|unit\_kerja|VARCHAR(200) |Nama unit kerja|Hierarchy Level 1 |
|status\_pegawai|VARCHAR(20) |PNS/PPPK/Non-PNS|Filtering |
|is\_current|BOOLEAN |TRUE jika record terkini|SCD Type 2 |

**Hierarchy:** Pegawai → Golongan (Level 3) → Jabatan (Level 2) → Unit Kerja (Level 1)
#### <a name="_g3bdu0vrjhr6"></a>**Dim\_Vendor (Vendor/Supplier Dimension)**

|**Atribut**|**Tipe**|**Deskripsi**|**Purpose**|
| :-: | :-: | :-: | :-: |
|vendor\_sk|INT |Surrogate Key|PK |
|kode\_vendor|VARCHAR(20) |Kode vendor|Business Key |
|nama\_vendor|VARCHAR(200) |Nama perusahaan/perorangan|Display |
|kategori\_vendor|VARCHAR(50) |Supplier/Jasa/Konsultan/Kontraktor|Hierarchy Level 2 |
|npwp|VARCHAR(20) |NPWP vendor|Display |
|kota/provinsi|VARCHAR(100) |Lokasi vendor|Hierarchy Level 1 |
|is\_active|BOOLEAN |Status aktif|Filtering |

**Hierarchy:** Vendor → Kategori Vendor (Level 2) → Kota/Provinsi (Level 1)


1. **Desain Star/Snowflake Schema** 

   ![](Aspose.Words.17821746-4610-4628-a9a2-59f561cf5c49.002.png)

1. **Penentuan Surrogate Keys** 
####

|<a name="_fwtd90vvrm3s"></a>**Dimension Table**|**Surrogate Key (Name)**|**Data Type**|**Business Key**|**Starting Value**|**Increment**|**Special Format**|
| :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|Dim\_Waktu|waktu\_sk|INT|tanggal|20200101|1|YYYYMMDD|
|Dim\_Kode\_Akun|kode\_akun\_sk|INT|kode\_akun|1|1|Sequential|
|Dim\_Unit\_Kerja|unit\_kerja\_sk|INT|kode\_unit|1|1|Sequential|
|Dim\_Sumber\_Dana|sumber\_dana\_sk|INT|kode\_sumber|1|1|Sequential|
|Dim\_Vendor|vendor\_sk|INT|kode\_vendor|1|1|Sequential|
|Dim\_Pegawai|pegawai\_sk|INT|nip|1|1|Sequential|
|Dim\_Mahasiswa|mahasiswa\_sk|INT|nim|1|1|Sequential|
|Dim\_Rekening\_Bank|rekening\_sk|INT|no\_rekening|1|1|Sequential|
#### <a name="_t6oqk6dzg6jo"></a>**B.1** 
####
####
####
####
####
#### <a name="_r1sm8wgtfx7m"></a><a name="_8exo6cnxfida"></a><a name="_u10889r026cf"></a><a name="_g934i61m87vx"></a><a name="_vusl8adqhbn2"></a><a name="_94t2q5qyggkj"></a>**Dimension TablesSpecial Values (Reserved Keys):**

|**Value**|**Meaning**|**Usage**|
| :-: | :-: | :-: |
|-1|Unknown|When dimension value is not known|
|-2|Not Applicable|When dimension doesn't apply|
|-3|Error/Invalid|When source data has error|
#### <a name="_4byczwehsd9o"></a>**B.2 Fact Tables**

|**Fact Table**|**Surrogate Key**|**Data Type**|**Starting Value**|**Composite Unique Keys**|
| :-: | :-: | :-: | :-: | :-: |
|Fact\_Transaksi\_Pengeluaran|fact\_pengeluaran\_sk|BIGINT|1|None (atomic)|
|Fact\_Transaksi\_Penerimaan|fact\_penerimaan\_sk|BIGINT|1|None (atomic)|
|Fact\_Realisasi\_Anggaran|fact\_realisasi\_sk|BIGINT|1|(waktu\_sk, kode\_akun\_sk, unit\_kerja\_sk, sumber\_dana\_sk)|
|Fact\_Gaji\_Pegawai|fact\_gaji\_sk|BIGINT|1|(waktu\_sk, pegawai\_sk)|
|Fact\_Arus\_Kas|fact\_arus\_kas\_sk|BIGINT|1|(waktu\_sk, rekening\_sk)|
## <a name="_mi34691c17o3"></a>**Step 5: Data Dictionary** 
**1. FACT TABLES**
### <a name="_l1iuvbu3xm65"></a>**1.1 FACT\_TRANSAKSI\_PENGELUARAN**
**Description:** Menyimpan detail setiap transaksi pengeluaran/belanja institusi yang telah disetujui.

**Grain:** Satu baris per transaksi pengeluaran

**Type:** Transaction Fact Table

|**Column Name**|**Data Type**|**Nullable**|**Description**|**Source**|**Business Rule**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|fact\_pengeluaran\_sk|INT|NOT NULL|Surrogate key (Primary Key)|Auto-generated|Sequential integer|
|waktu\_sk|INT|NOT NULL|Foreign key ke Dim\_Waktu|Dim\_Waktu|Berdasarkan tanggal\_transaksi|
|kode\_akun\_sk|INT|NOT NULL|Foreign key ke Dim\_Kode\_Akun|Dim\_Kode\_Akun|Mandatory|
|unit\_kerja\_sk|INT|NOT NULL|Foreign key ke Dim\_Unit\_Kerja|Dim\_Unit\_Kerja|Unit pengaju|
|sumber\_dana\_sk|INT|NOT NULL|Foreign key ke Dim\_Sumber\_Dana|Dim\_Sumber\_Dana|DIPA/PNBP/Hibah|
|vendor\_sk|INT|NULL|Foreign key ke Dim\_Vendor|Dim\_Vendor|Nullable jika bukan ke vendor|
|pegawai\_sk|INT|NULL|Foreign key ke Dim\_Pegawai|Dim\_Pegawai|Jika honor/perjalanan dinas|
|jumlah\_transaksi|DECIMAL(15,2)|NOT NULL|Nominal pengeluaran bruto|TransaksiPengeluaran.jumlah|Must be > 0|
|jumlah\_pajak|DECIMAL(15,2)|NULL|Pajak yang dipotong (PPh/PPN)|Calculated|Default 0 jika NULL|
|jumlah\_bersih|DECIMAL(15,2)|NOT NULL|Jumlah setelah pajak|jumlah\_transaksi - jumlah\_pajak|Must be > 0|
|lama\_proses\_hari|INT|NULL|Durasi dari pengajuan s/d bayar|Calculated from dates|In calendar days|
|jumlah\_transaksi\_count|INT|NOT NULL|Counter untuk agregasi|COUNT(\*)|Always 1 for atomic level|

**Indexes:**

- Primary Key: fact\_pengeluaran\_sk
- Foreign Keys: waktu\_sk, kode\_akun\_sk, unit\_kerja\_sk, sumber\_dana\_sk
- Composite Index: (waktu\_sk, kode\_akun\_sk, unit\_kerja\_sk)

**Update Frequency:** Daily (real-time during working hours)

**Data Retention:** 7 years (regulatory requirement)
### <a name="_oejlnbp7ww10"></a>**1.2 FACT\_TRANSAKSI\_PENERIMAAN**
**Description:** Menyimpan detail setiap transaksi penerimaan/pendapatan institusi.

**Grain:** Satu baris per transaksi penerimaan

**Type:** Transaction Fact Table

|**Column Name**|**Data Type**|**Nullable**|**Description**|**Source**|**Business Rule**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|fact\_penerimaan\_sk|INT|NOT NULL|Surrogate key (Primary Key)|Auto-generated|Sequential integer|
|waktu\_sk|INT|NOT NULL|Foreign key ke Dim\_Waktu|Dim\_Waktu|Berdasarkan tanggal\_terima|
|kode\_akun\_sk|INT|NOT NULL|Foreign key ke Dim\_Kode\_Akun|Dim\_Kode\_Akun|Akun pendapatan|
|unit\_kerja\_sk|INT|NOT NULL|Foreign key ke Dim\_Unit\_Kerja|Dim\_Unit\_Kerja|Unit penerima|
|sumber\_dana\_sk|INT|NOT NULL|Foreign key ke Dim\_Sumber\_Dana|Dim\_Sumber\_Dana|Jenis penerimaan|
|mahasiswa\_sk|INT|NULL|Foreign key ke Dim\_Mahasiswa|Dim\_Mahasiswa|Jika dari mahasiswa (UKT)|
|jumlah\_penerimaan|DECIMAL(15,2)|NOT NULL|Nominal penerimaan|TransaksiPenerimaan.jumlah|Must be > 0|
|jumlah\_transaksi\_count|INT|NOT NULL|Counter untuk agregasi|COUNT(\*)|Always 1 for atomic level|

**Indexes:**

- Primary Key: fact\_penerimaan\_sk
- Foreign Keys: waktu\_sk, kode\_akun\_sk, unit\_kerja\_sk, sumber\_dana\_sk
- Composite Index: (waktu\_sk, sumber\_dana\_sk, unit\_kerja\_sk)

**Update Frequency:** Daily (real-time during working hours)

**Data Retention:** 7 years

-----
### <a name="_1w6r8k5cd9qa"></a>**1.3 FACT\_REALISASI\_ANGGARAN**
**Description:** Snapshot bulanan realisasi anggaran per akun per unit kerja.

**Grain:** Satu baris per akun per unit per bulan

**Type:** Periodic Snapshot Fact Table

|**Column Name**|**Data Type**|**Nullable**|**Description**|**Source**|**Business Rule**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|fact\_realisasi\_sk|INT|NOT NULL|Surrogate key (Primary Key)|Auto-generated|Sequential integer|
|waktu\_sk|INT|NOT NULL|Foreign key ke Dim\_Waktu|Dim\_Waktu|End of month date|
|kode\_akun\_sk|INT|NOT NULL|Foreign key ke Dim\_Kode\_Akun|Dim\_Kode\_Akun|Akun anggaran|
|unit\_kerja\_sk|INT|NOT NULL|Foreign key ke Dim\_Unit\_Kerja|Dim\_Unit\_Kerja|Unit pemilik anggaran|
|sumber\_dana\_sk|INT|NOT NULL|Foreign key ke Dim\_Sumber\_Dana|Dim\_Sumber\_Dana|Sumber pembiayaan|
|pagu\_awal|DECIMAL(15,2)|NOT NULL|Alokasi anggaran awal tahun|Anggaran.pagu\_awal|>= 0|
|revisi\_bulan\_ini|DECIMAL(15,2)|NULL|Revisi anggaran di bulan ini|Calculated|Can be negative|
|pagu\_final|DECIMAL(15,2)|NOT NULL|Pagu setelah semua revisi|Anggaran.pagu\_final|>= 0|
|realisasi\_bulan\_ini|DECIMAL(15,2)|NOT NULL|Realisasi di bulan ini|SUM(transaksi)|>= 0|
|realisasi\_kumulatif|DECIMAL(15,2)|NOT NULL|Total realisasi s/d bulan ini|Running total|>= 0, <= pagu\_final|
|sisa\_anggaran|DECIMAL(15,2)|NOT NULL|Sisa pagu yang belum terpakai|pagu\_final - realisasi\_kumulatif|>= 0|
|persentase\_realisasi|DECIMAL(5,2)|NOT NULL|% realisasi terhadap pagu|(realisasi\_kumulatif/pagu\_final)\*100|0-100+|
|jumlah\_transaksi|INT|NOT NULL|Jumlah transaksi di bulan ini|COUNT(transaksi)|>= 0|

**Indexes:**

- Primary Key: fact\_realisasi\_sk
- Composite Unique: (waktu\_sk, kode\_akun\_sk, unit\_kerja\_sk, sumber\_dana\_sk)
- Composite Index: (waktu\_sk, unit\_kerja\_sk)

**Update Frequency:** Monthly (end of month)

**Data Retention:** Permanent (historical analysis)
### <a name="_2fentqn00qx6"></a>**1.4 FACT\_GAJI\_PEGAWAI**
**Description:** Snapshot bulanan pembayaran gaji pegawai.

**Grain:** Satu baris per pegawai per bulan

**Type:** Periodic Snapshot Fact Table

|**Column Name**|**Data Type**|**Nullable**|**Description**|**Source**|**Business Rule**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|fact\_gaji\_sk|INT|NOT NULL|Surrogate key (Primary Key)|Auto-generated|Sequential integer|
|waktu\_sk|INT|NOT NULL|Foreign key ke Dim\_Waktu|Dim\_Waktu|Bulan gaji|
|pegawai\_sk|INT|NOT NULL|Foreign key ke Dim\_Pegawai|Dim\_Pegawai|Pegawai penerima|
|unit\_kerja\_sk|INT|NOT NULL|Foreign key ke Dim\_Unit\_Kerja|Dim\_Unit\_Kerja|Unit kerja pegawai|
|gaji\_pokok|DECIMAL(12,2)|NOT NULL|Gaji pokok|GajiPegawai.gaji\_pokok|> 0|
|tunjangan|DECIMAL(12,2)|NOT NULL|Tunjangan kinerja, struktural, fungsional|Sum of tunjangan columns|>= 0|
|total\_tunjangan|DECIMAL(12,2)|NOT NULL|Total semua tunjangan|Sum of all tunjangan|>= 0|
|potongan|DECIMAL(12,2)|NOT NULL|Potongan pajak, BPJS|Sum of potongan columns|>= 0|
|total\_potongan|DECIMAL(12,2)|NOT NULL|Total semua potongan|Sum of all potongan|>= 0|
|gaji\_bersih|DECIMAL(12,2)|NOT NULL|Take home pay|gaji\_pokok + total\_tunjangan - total\_potongan|> 0|
|jumlah\_pegawai|INT|NOT NULL|Counter pegawai|COUNT(\*)|Always 1 for atomic level|

**Indexes:**

- Primary Key: fact\_gaji\_sk
- Composite Unique: (waktu\_sk, pegawai\_sk)
- Composite Index: (waktu\_sk, unit\_kerja\_sk)

**Update Frequency:** Monthly (tanggal 1-5 setiap bulan)

**Data Retention:** 7 years
### <a name="_illb5hpoxu16"></a>**1.5 FACT\_ARUS\_KAS**
**Description:** Snapshot harian posisi kas per rekening bank.

**Grain:** Satu baris per rekening per hari

**Type:** Daily Snapshot Fact Table

|**Column Name**|**Data Type**|**Nullable**|**Description**|**Source**|**Business Rule**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|fact\_arus\_kas\_sk|INT|NOT NULL|Surrogate key (Primary Key)|Auto-generated|Sequential integer|
|waktu\_sk|INT|NOT NULL|Foreign key ke Dim\_Waktu|Dim\_Waktu|Tanggal snapshot|
|rekening\_sk|INT|NOT NULL|Foreign key ke Dim\_Rekening\_Bank|Dim\_Rekening\_Bank|Rekening institusi|
|unit\_kerja\_sk|INT|NOT NULL|Foreign key ke Dim\_Unit\_Kerja|Dim\_Unit\_Kerja|Unit pemegang rekening|
|saldo\_awal|DECIMAL(15,2)|NOT NULL|Saldo awal hari|Saldo\_akhir hari sebelumnya|Can be negative|
|total\_penerimaan|DECIMAL(15,2)|NOT NULL|Total uang masuk hari ini|SUM(kredit)|>= 0|
|total\_pengeluaran|DECIMAL(15,2)|NOT NULL|Total uang keluar hari ini|SUM(debet)|>= 0|
|saldo\_akhir|DECIMAL(15,2)|NOT NULL|Saldo akhir hari|saldo\_awal + penerimaan - pengeluaran|Can be negative|
|jumlah\_transaksi|INT|NOT NULL|Jumlah transaksi masuk/keluar|COUNT(\*)|>= 0|

**Indexes:**

- Primary Key: fact\_arus\_kas\_sk
- Composite Unique: (waktu\_sk, rekening\_sk)
- Composite Index: (waktu\_sk, unit\_kerja\_sk)

**Update Frequency:** Daily (end of day)

**Data Retention:** 5 years
## <a name="_nf297yk0njvc"></a>**2. DIMENSION TABLES**
### <a name="_ednsu2xvgx6q"></a>**2.1 DIM\_WAKTU**
**Description:** Dimensi waktu untuk analisis temporal.

**Type:** Type 0 (No Changes)

**SCD Type:** Type 0

|**Column Name**|**Data Type**|**Nullable**|**Description**|**Sample Values**|**Business Rule**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|waktu\_sk|INT|NOT NULL|Surrogate key (Primary Key)|20250101, 20250102|Format: YYYYMMDD|
|tanggal|DATE|NOT NULL|Tanggal lengkap (Business Key)|2025-01-01|Unique|
|hari|INT|NOT NULL|Hari dalam bulan (1-31)|1, 15, 31|1-31|
|nama\_hari|VARCHAR(20)|NOT NULL|Nama hari dalam bahasa Indonesia|Senin, Selasa, Rabu|Full name|
|minggu|INT|NOT NULL|Minggu dalam tahun (1-53)|1, 26, 52|ISO week number|
|bulan|INT|NOT NULL|Bulan (1-12)|1, 6, 12|1=Januari, 12=Desember|
|nama\_bulan|VARCHAR(20)|NOT NULL|Nama bulan dalam bahasa Indonesia|Januari, Februari|Full name|
|triwulan|INT|NOT NULL|Triwulan (1-4)|1, 2, 3, 4|Q1=Jan-Mar, Q4=Oct-Dec|
|semester|INT|NOT NULL|Semester (1-2)|1, 2|1=Jan-Jun, 2=Jul-Dec|
|tahun|INT|NOT NULL|Tahun (4 digit)|2024, 2025|Calendar year|
|tahun\_ajaran|VARCHAR(10)|NOT NULL|Tahun ajaran akademik|2024/2025|Format: YYYY/YYYY+1|
|is\_hari\_kerja|BOOLEAN|NOT NULL|TRUE jika hari kerja|TRUE, FALSE|Mon-Fri = TRUE|
|is\_akhir\_bulan|BOOLEAN|NOT NULL|TRUE jika tanggal terakhir bulan|TRUE, FALSE|Last day of month|

**Hierarchy:**

- Tanggal → Minggu → Bulan → Triwulan → Semester → Tahun

**Pre-populated Range:** 2020-01-01 to 2030-12-31

**Update Frequency:** Static (pre-loaded)

-----
### <a name="_6aprch6lbgt2"></a>**2.2 DIM\_KODE\_AKUN**
**Description:** Dimensi kode akun anggaran dan kategori belanja.

**Type:** Type 2 (Track History)

**SCD Type:** Type 2

|**Column Name**|**Data Type**|**Nullable**|**Description**|**Sample Values**|**Business Rule**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|kode\_akun\_sk|INT|NOT NULL|Surrogate key (Primary Key)|1, 2, 3|Auto-increment|
|kode\_akun|VARCHAR(20)|NOT NULL|Kode akun anggaran (Business Key)|5211\.01, 5212.02|Format: NNNN.NN|
|nama\_akun|VARCHAR(200)|NOT NULL|Nama akun|Belanja Gaji PNS|Descriptive name|
|kategori\_belanja|VARCHAR(50)|NOT NULL|Kategori utama|Pegawai, Barang, Modal, Sosial|Level 1 hierarchy|
|kelompok\_akun|VARCHAR(100)|NOT NULL|Kelompok akun|Gaji, Operasional, Aset|Level 2 hierarchy|
|sub\_kelompok|VARCHAR(100)|NULL|Detail sub kelompok|Gaji Pokok, Lembur|Level 3 hierarchy|
|level\_akun|INT|NOT NULL|Level hierarki (1-5)|1, 2, 3, 4, 5|1=highest level|
|is\_current|BOOLEAN|NOT NULL|TRUE jika record terkini|TRUE, FALSE|Only one TRUE per kode\_akun|
|effective\_date|DATE|NOT NULL|Tanggal mulai berlaku|2024-01-01|Start date of validity|
|expiry\_date|DATE|NULL|Tanggal berakhir|2025-12-31, NULL|NULL = current record|

**Hierarchy:**

- Kode Akun Detail → Sub Kelompok → Kelompok Akun → Kategori Belanja

**Indexes:**

- Primary Key: kode\_akun\_sk
- Business Key: (kode\_akun, effective\_date)
- Index: is\_current

**Update Frequency:** As needed (when account structure changes)

-----
### <a name="_xxfxsq9wt8it"></a>**2.3 DIM\_UNIT\_KERJA**
**Description:** Dimensi unit kerja/organisasi institusi.

**Type:** Type 2 (Track History)

**SCD Type:** Type 2

|**Column Name**|**Data Type**|**Nullable**|**Description**|**Sample Values**|**Business Rule**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|unit\_kerja\_sk|INT|NOT NULL|Surrogate key (Primary Key)|1, 2, 3|Auto-increment|
|kode\_unit|VARCHAR(10)|NOT NULL|Kode unit (Business Key)|FT, FS, BAUK|Unique abbreviation|
|nama\_unit|VARCHAR(200)|NOT NULL|Nama lengkap unit|Fakultas Teknik|Full name|
|jenis\_unit|VARCHAR(50)|NOT NULL|Jenis unit|Fakultas, Direktorat, Lembaga, UPT|Classification|
|divisi|VARCHAR(100)|NULL|Divisi (if applicable)|Administrasi Umum|Level 3 hierarchy|
|fakultas|VARCHAR(100)|NULL|Nama fakultas (if applicable)|Fakultas Teknik|Level 2 hierarchy|
|institusi|VARCHAR(100)|NOT NULL|Nama institusi|ITERA|Level 1 hierarchy (always ITERA)|
|level\_organisasi|INT|NOT NULL|Level hierarki|1, 2, 3|1=Institusi, 2=Fakultas, 3=Unit|
|is\_current|BOOLEAN|NOT NULL|TRUE jika record terkini|TRUE, FALSE|Only one TRUE per kode\_unit|
|effective\_date|DATE|NOT NULL|Tanggal mulai berlaku|2024-01-01|Start date of validity|
|expiry\_date|DATE|NULL|Tanggal berakhir|2025-12-31, NULL|NULL = current record|

**Hierarchy:**

- Unit Kerja → Divisi → Fakultas → Institusi

**Indexes:**

- Primary Key: unit\_kerja\_sk
- Business Key: (kode\_unit, effective\_date)
- Index: is\_current

**Update Frequency:** As needed (when organizational structure changes)

### <a name="_qroigl5mfuxk"></a>**2.4 DIM\_SUMBER\_DANA**
**Description:** Dimensi sumber dana pembiayaan.

**Type:** Type 1 (Overwrite)

**SCD Type:** Type 1

|**Column Name**|**Data Type**|**Nullable**|**Description**|**Sample Values**|**Business Rule**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|sumber\_dana\_sk|INT|NOT NULL|Surrogate key (Primary Key)|1, 2, 3|Auto-increment|
|kode\_sumber|VARCHAR(10)|NOT NULL|Kode sumber dana (Business Key)|DIPA, PNBP, HIBAH|Unique code|
|nama\_sumber|VARCHAR(100)|NOT NULL|Nama lengkap|DIPA ITERA 2025|Full description|
|jenis\_dana|VARCHAR(50)|NOT NULL|Jenis dana|APBN, Non-APBN|Level 1 hierarchy|
|kategori|VARCHAR(50)|NOT NULL|Kategori|DIPA, PNBP, HIBAH, BLU|Level 2 hierarchy|
|is\_active|BOOLEAN|NOT NULL|Status aktif|TRUE, FALSE|Only active sources used|

**Hierarchy:**

- Kategori → Jenis Dana

**Indexes:**

- Primary Key: sumber\_dana\_sk
- Unique: kode\_sumber
- Index: is\_active

**Update Frequency:** Annually or as needed

### <a name="_gldkgsu4ps7u"></a>**2.5 DIM\_VENDOR**
**Description:** Dimensi vendor/supplier barang dan jasa.

**Type:** Type 2 (Track History)

**SCD Type:** Type 2

|**Column Name**|**Data Type**|**Nullable**|**Description**|**Sample Values**|**Business Rule**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|vendor\_sk|INT|NOT NULL|Surrogate key (Primary Key)|1, 2, 3|Auto-increment|
|kode\_vendor|VARCHAR(20)|NOT NULL|Kode vendor (Business Key)|VND001, VND002|Format: VNDNNN|
|nama\_vendor|VARCHAR(200)|NOT NULL|Nama perusahaan/perorangan|PT. ABC Indonesia|Legal name|
|kategori\_vendor|VARCHAR(50)|NOT NULL|Kategori vendor|Supplier, Jasa, Konsultan, Kontraktor|Level 2 hierarchy|
|npwp|VARCHAR(20)|NULL|NPWP vendor|01\.234.567.8-901.000|Format: NN.NNN.NNN.N-NNN.NNN|
|kota|VARCHAR(100)|NOT NULL|Kota vendor|Bandar Lampung|City name|
|provinsi|VARCHAR(100)|NOT NULL|Provinsi vendor|Lampung|Level 1 hierarchy|
|is\_active|BOOLEAN|NOT NULL|Status aktif|TRUE, FALSE|Only active vendors can transact|

**Hierarchy:**

- Vendor → Kategori Vendor → Provinsi

**Indexes:**

- Primary Key: vendor\_sk
- Business Key: kode\_vendor
- Index: (is\_active, kategori\_vendor)

**Update Frequency:** As needed (when vendor information changes)

### <a name="_6dnw61ttc0fx"></a>**2.6 DIM\_PEGAWAI**
**Description:** Dimensi pegawai institusi.

**Type:** Type 2 (Track History)

**SCD Type:** Type 2

|**Column Name**|**Data Type**|**Nullable**|**Description**|**Sample Values**|**Business Rule**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|pegawai\_sk|INT|NOT NULL|Surrogate key (Primary Key)|1, 2, 3|Auto-increment|
|nip|VARCHAR(18)|NOT NULL|Nomor Induk Pegawai (Business Key)|198001012005011001|18 digits|
|nama\_pegawai|VARCHAR(200)|NOT NULL|Nama lengkap|Dr. Ahmad Fauzi, S.T., M.T.|Full name with title|
|golongan|VARCHAR(10)|NOT NULL|Golongan kepegawaian|III/a, III/b, IV/c|Level 3 hierarchy|
|jabatan|VARCHAR(100)|NOT NULL|Jabatan|Dosen, Tendik, Pejabat Struktural|Level 2 hierarchy|
|unit\_kerja|VARCHAR(200)|NOT NULL|Nama unit kerja|Fakultas Teknik|Level 1 hierarchy|
|status\_pegawai|VARCHAR(20)|NOT NULL|Status kepegawaian|PNS, PPPK, Non-PNS|Employment status|
|is\_current|BOOLEAN|NOT NULL|TRUE jika record terkini|TRUE, FALSE|Only one TRUE per nip|
|effective\_date|DATE|NOT NULL|Tanggal mulai berlaku|2024-01-01|Start date of validity|
|expiry\_date|DATE|NULL|Tanggal berakhir|2025-12-31, NULL|NULL = current record|

**Hierarchy:**

- Pegawai → Golongan → Jabatan → Unit Kerja

**Indexes:**

- Primary Key: pegawai\_sk
- Business Key: (nip, effective\_date)
- Index: is\_current

**Update Frequency:** Monthly or as needed (promotions, transfers)

### <a name="_yy2toqw7gmt6"></a>**2.7 DIM\_MAHASISWA**
**Description:** Dimensi mahasiswa (untuk UKT dan penerimaan dari mahasiswa).

**Type:** Type 1 (Overwrite for semester, Type 2 for structural changes)

**SCD Type:** Hybrid (Type 1 for current attributes, Type 2 for major changes)

|**Column Name**|**Data Type**|**Nullable**|**Description**|**Sample Values**|**Business Rule**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|mahasiswa\_sk|INT|NOT NULL|Surrogate key (Primary Key)|1, 2, 3|Auto-increment|
|nim|VARCHAR(15)|NOT NULL|Nomor Induk Mahasiswa (Business Key)|120450001|Unique|
|nama\_mahasiswa|VARCHAR(200)|NOT NULL|Nama lengkap|Budi Santoso|Full name|
|angkatan|INT|NOT NULL|Tahun angkatan|2024, 2025|4-digit year|
|program\_studi|VARCHAR(100)|NOT NULL|Nama program studi|Teknik Informatika|Level 2 hierarchy|
|fakultas|VARCHAR(100)|NOT NULL|Nama fakultas|Fakultas Teknik|Level 1 hierarchy|
|semester\_aktif|INT|NOT NULL|Semester saat ini|1, 2, 3, ... 14|Current semester|
|golongan\_ukt|VARCHAR(10)|NOT NULL|Golongan UKT|UKT I, UKT II, ... UKT VIII|UKT category|
|status\_mahasiswa|VARCHAR(20)|NOT NULL|Status mahasiswa|Aktif, Cuti, Lulus, Non-Aktif|Current status|

**Hierarchy:**

- Mahasiswa → Program Studi → Fakultas

**Indexes:**

- Primary Key: mahasiswa\_sk
- Unique: nim
- Index: (status\_mahasiswa, fakultas)

**Update Frequency:** Semester basis and as needed

### <a name="_w5453h23bv27"></a>**2.8 DIM\_REKENING\_BANK**
**Description:** Dimensi rekening bank institusi.

**Type:** Type 2 (Track History)

**SCD Type:** Type 2

|**Column Name**|**Data Type**|**Nullable**|**Description**|**Sample Values**|**Business Rule**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|rekening\_sk|INT|NOT NULL|Surrogate key (Primary Key)|1, 2, 3|Auto-increment|
|no\_rekening|VARCHAR(50)|NOT NULL|Nomor rekening (Business Key)|1234567890|Unique account number|
|nama\_rekening|VARCHAR(200)|NOT NULL|Nama pemegang rekening|ITERA - Operasional|Account name|
|nama\_bank|VARCHAR(100)|NOT NULL|Nama bank|Bank Mandiri, BNI, BRI|Bank name|
|cabang|VARCHAR(100)|NOT NULL|Cabang bank|Cabang Bandar Lampung|Branch name|
|jenis\_rekening|VARCHAR(50)|NOT NULL|Jenis rekening|Operasional, Escrow, Giro|Account type|
|is\_active|BOOLEAN|NOT NULL|Status aktif|TRUE, FALSE|Only active accounts used|

**Hierarchy:**

- Rekening → Jenis Rekening → Bank → Cabang

**Indexes:**

- Primary Key: rekening\_sk
- Unique: no\_rekening
- Index: is\_active

**Update Frequency:** As needed (when account information changes)
## <a name="_i9pzf09kaycb"></a>**3. DATA QUALITY RULES**
### <a name="_afubftwd5hr7"></a>**3.1 Mandatory Fields**
- All Primary Keys (surrogate keys) must NOT be NULL
- All Foreign Keys in Fact tables must exist in corresponding Dimension tables
- All measures in Fact tables must be NOT NULL (use 0 for true zero values)
### <a name="_27i9e4kufs4h"></a>**3.2 Referential Integrity**
- All FK references must point to valid dimension records
- Orphan records (FK without matching dimension) are not allowed
- Use -1 dimension key for "Unknown" or "Not Applicable" cases
### <a name="_ygenghuxa42"></a>**3.3 Data Consistency**
- Dates must be in format YYYY-MM-DD
- Decimal values use . (dot) as separator
- Text fields are case-sensitive
- Boolean values: TRUE/FALSE (not 1/0)
### <a name="_h0fflykhucyn"></a>**3.4 Business Rules**
- jumlah\_transaksi, jumlah\_penerimaan must be > 0
- persentase\_realisasi must be between 0 and 150% (allow over-realization)
- sisa\_anggaran must be >= 0 (negative indicates over-budget)
- tanggal\_approval must be >= tanggal\_transaksi
### <a name="_iw6293tvf0lb"></a>**3.5 SCD Implementation**
- Type 2 dimensions must have unique (business\_key, effective\_date)
- Only one record per business\_key should have is\_current = TRUE
- expiry\_date must be >= effective\_date
- expiry\_date = NULL indicates current active record

## <a name="_6u7czqfys7k0"></a>**4. NAMING CONVENTIONS**
### <a name="_cktpfhsqiiw8"></a>**4.1 Table Names**
- Fact Tables: FACT\_<business\_process> (uppercase, underscore-separated)
- Dimension Tables: DIM\_<dimension\_name> (uppercase, underscore-separated)
### <a name="_3tmcmef7kiok"></a>**4.2 Column Names**
- Surrogate Keys: <table\_name>\_sk (lowercase, underscore-separated)
- Foreign Keys: Match dimension surrogate key name
- Measures: Descriptive names (e.g., jumlah\_transaksi, total\_penerimaan)
- Attributes: Descriptive names (e.g., nama\_pegawai, kategori\_vendor)
### <a name="_mh0tjushajwk"></a>**4.3 Data Types**
- Keys: INT
- Monetary values: DECIMAL(15,2) or DECIMAL(12,2)
- Percentages: DECIMAL(5,2)
- Dates: DATE
- Timestamps: TIMESTAMP
- Boolean: BOOLEAN
- Text: VARCHAR(n) where n is appropriate length

## <a name="_dar8umk0uvph"></a>**5. METADATA**

|**Property**|**Value**|
| :-: | :-: |
|Database|datamart\_keuangan\_itera|
|Schema Version|1\.0|
|ETL Frequency|Daily (transactions), Monthly (snapshots)|
|Data Warehouse Type|Star Schema|
|DBMS|PostgreSQL 15+|
|Character Set|UTF-8|
|Collation|Indonesian locale|
|Timezone|Asia/Jakarta (WIB)|
##


## <a name="_yhexn6b6pqx1"></a><a name="_imknxbis0ieq"></a>**Step 6: GitHub Repository Setup** 
Tujuan: Menyiapkan repository untuk kolaborasi dan version control

**Lampiran A: Checklist Progress Tracking** 

**11.1.1 Misi 1 Checklist** 

|**Kegiatan**|**Status**|
| :-: | :-: |
|Kick-off meeting dilaksanakan|Done|
|Business requirements terdokumentasi |done|
|Data sources teridentifikasi|done|
|KPIs terdefinisi|done|
|ERD sudah dibuat |done|
|Fact tables teridentifikasi |done|
|Dimension tables teridentifikasi |done|
|Grain terdefinisi|done|
|Dimensional model digambar|done|
|Data dictionary lengkap|done|
|GitHub repository dibuat|done|
|README.md terpenuhi ||
|Dokumentasi diupload ||
|Presentasi Misi 1 dilaksanakan||











