-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2024 at 10:50 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recruitment_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

CREATE TABLE `applicants` (
  `id` int(30) UNSIGNED NOT NULL,
  `vacancy_id` int(30) UNSIGNED NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `middle_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `contact` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `applicants`
--

INSERT INTO `applicants` (`id`, `vacancy_id`, `first_name`, `middle_name`, `last_name`, `contact`, `email`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Risky', '', 'Firdaus', '081779302970', 'daus.riskyfirdaus@gmail.com', 'Jl. Kejawen lr. Hikmah 1', 2, '2024-01-21 22:07:13', '2024-01-21 22:07:54');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(30) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Departemen Proyek', 'Mengontrol dan membuat time schedule yang akan dilaksanakan', '2024-01-21 18:57:57', '2024-01-21 19:05:05'),
(2, 'Departemen Keuangan', 'Berurusan dengan perencanaan, pengelolaan, dan pengendalian sumber daya keuangan. ', '2024-01-21 18:57:57', '2024-01-21 19:07:33'),
(3, 'Departemen Sumber Daya Manusia (SDM)', 'Departemen sumber daya manusia berfungsi melakukan pelayanan terhadap karyawan secara keseluruhan.', '2024-01-21 18:57:57', '2024-01-21 19:08:52'),
(4, 'Departemen Pengadaan dan Logistik', 'Melaksanakan pengelolaan logistik, optimalisasi aset, pengamanan, kearsipan, dan layanan', '2024-01-21 18:57:57', '2024-01-21 19:12:04'),
(5, 'Departemen Hukum dan Kontrak', 'Melaksanakan pengelolaan administrasi umum dan perlengkapan di Bagian Hukum dan Kerjasama', '2024-01-21 18:57:57', '2024-01-21 19:12:57');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(5, '2024-01-18-005419', 'App\\Database\\Migrations\\Authentication', 'default', 'App', 1705838033, 1),
(6, '2024-01-19-074557', 'App\\Database\\Migrations\\Department', 'default', 'App', 1705838033, 1),
(7, '2024-01-19-075328', 'App\\Database\\Migrations\\Vacancies', 'default', 'App', 1705838033, 1),
(8, '2024-01-20-083405', 'App\\Database\\Migrations\\Applicants', 'default', 'App', 1705838033, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(2) NOT NULL DEFAULT 3,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@mail.com', '$2y$10$vo1wYhxWE4yOPj3YerZDb.N.jtKh4UEk3ccTLJPPgSaMarQUJSphG', 1, '2024-01-21 18:57:05', '2024-01-21 18:57:05'),
(2, 'M Rafi Athallah', 'rafi@gmail.com', '$2y$10$kVD0h2F8RcXIT4z8qPfOHuOtLB1SyHYD7nWnS.Qv2/FuXnnsPYphK', 3, '2024-01-22 14:23:59', '2024-01-22 14:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `vacancies`
--

CREATE TABLE `vacancies` (
  `id` int(30) UNSIGNED NOT NULL,
  `department_id` int(30) UNSIGNED NOT NULL,
  `position` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `slot` int(12) NOT NULL DEFAULT 0,
  `salary_from` float(12,2) NOT NULL DEFAULT 0.00,
  `salary_to` float(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `vacancies`
--

INSERT INTO `vacancies` (`id`, `department_id`, `position`, `description`, `slot`, `salary_from`, `salary_to`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Manajemen Proyek', '&lt;p&gt;&lt;span style=\\&quot;background-color: rgb(255, 255, 0);\\&quot; var(--bs-body-color);=\\&quot;\\&quot; font-family:=\\&quot;\\&quot; var(--bs-body-font-family);=\\&quot;\\&quot; font-size:=\\&quot;\\&quot; var(--bs-body-font-size);=\\&quot;\\&quot; text-align:=\\&quot;\\&quot; var(--bs-body-text-align);\\\\\\&quot;=\\&quot;\\&quot;&gt;&lt;b&gt;&lt;font color=\\&quot;#000000\\&quot;&gt;TUGAS UTAMA&lt;/font&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: var(--bs-body-color); font-family: var(--bs-body-font-family); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\\&quot;&gt;Manajer Proyek Konstruksi bertanggung jawab atas perencanaan, pengorganisasian, dan pengawasan proyek konstruksi. Mereka bekerja sama dengan tim internal, subkontraktor, dan pemilik proyek untuk memastikan proyek berjalan sesuai dengan jadwal, anggaran, dan standar kualitas yang ditetapkan.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;KUALIFIKASI&lt;/b&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;&lt;span style=\\&quot;\\\\&amp;quot;color:\\&quot; var(--bs-body-color);=\\&quot;\\&quot; font-family:=\\&quot;\\&quot; var(--bs-body-font-family);=\\&quot;\\&quot; font-size:=\\&quot;\\&quot; var(--bs-body-font-size);=\\&quot;\\&quot; font-weight:=\\&quot;\\&quot; var(--bs-body-font-weight);=\\&quot;\\&quot; text-align:=\\&quot;\\&quot; var(--bs-body-text-align);\\\\\\&quot;=\\&quot;\\&quot;&gt;&amp;nbsp;Gelar sarjana dalam Teknik Sipil, Manajemen Konstruksi, atau bidang terkait.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&amp;nbsp;Pengalaman minimal 5 tahun di bidang manajemen proyek konstruksi.&lt;/li&gt;&lt;li&gt;&amp;nbsp;Pemahaman mendalam tentang perencanaan proyek, manajemen anggaran, dan pengawasan konstruksi.&lt;/li&gt;&lt;li&gt;&amp;nbsp;Kemampuan menggunakan perangkat lunak manajemen proyek seperti Microsoft Project.&lt;/li&gt;&lt;li&gt;&amp;nbsp;Kemampuan kepemimpinan yang kuat dan keterampilan komunikasi yang baik.&lt;/li&gt;&lt;li&gt;&amp;nbsp;Kemampuan membuat keputusan yang cepat dan efektif.&lt;/li&gt;&lt;li&gt;&amp;nbsp;Pemahaman tentang kontrak konstruksi dan pengetahuan hukum terkait konstruksi.&lt;/li&gt;&lt;li&gt;&amp;nbsp;Kemampuan bernegosiasi dan menyelesaikan masalah secara hukum.&lt;/li&gt;&lt;li&gt;&amp;nbsp;Sertifikasi manajemen proyek seperti PMP (Project Management Professional) diinginkan.&lt;/li&gt;&lt;li&gt;&amp;nbsp;Sertifikasi keselamatan konstruksi (misalnya, OSHA) merupakan nilai tambah.&lt;/li&gt;&lt;li&gt;&amp;nbsp;Kemampuan analitis yang baik untuk mengidentifikasi dan mengelola risiko proyek.&lt;/li&gt;&lt;li&gt;&amp;nbsp;Kemampuan untuk mengelola beberapa proyek secara bersamaan.&lt;/li&gt;&lt;/ol&gt;', 3, 15000000.00, 20000000.00, 1, '2024-01-21 19:20:59', '2024-01-21 19:22:37'),
(2, 1, 'Insinyur Proyek', '&lt;p&gt;&lt;b&gt;DESKRIPSI PEKERJAAN&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Deskripsi pekerjaan ini memberikan gambaran umum tentang tanggung jawab dan kualifikasi yang diperlukan untuk posisi Insinyur Proyek di perusahaan kontraktor. Perusahaan dapat menyesuaikan deskripsi pekerjaan ini dengan kebutuhan spesifik mereka&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;KRITERIA&lt;/b&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;Gelar sarjana atau lebih tinggi di bidang Teknik Sipil, Manajemen Konstruksi, atau bidang terkait.&lt;/li&gt;&lt;li&gt;Pengalaman kerja minimal 3-5 tahun dalam manajemen proyek konstruksi.&lt;/li&gt;&lt;li&gt;Pemahaman mendalam tentang proses-proses konstruksi dan teknik sipil.&lt;/li&gt;&lt;li&gt;Kemampuan analitis yang kuat dan keterampilan komunikasi yang baik.&lt;/li&gt;&lt;li&gt;Pengalaman dalam penggunaan perangkat lunak desain dan manajemen proyek.&lt;/li&gt;&lt;li&gt;Sertifikasi Professional Engineer (PE) merupakan nilai tambah.&lt;/li&gt;&lt;li&gt;Keterampilan kepemimpinan yang kuat dan kemampuan bekerja dalam tim.&lt;/li&gt;&lt;li&gt;Pengetahuan mendalam tentang peraturan dan standar keselamatan konstruksi.&lt;/li&gt;&lt;li&gt;Kemampuan untuk beradaptasi dengan perubahan dan bekerja di bawah tekanan.&lt;/li&gt;&lt;li&gt;Pemahaman hukum dan kontrak konstruksi.&lt;/li&gt;&lt;li&gt;Kemampuan untuk melakukan perjalanan sesuai kebutuhan proyek.&lt;/li&gt;&lt;/ol&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;', 3, 15000000.00, 20000000.00, 1, '2024-01-22 13:03:03', '2024-01-22 13:03:03'),
(3, 1, 'Pengawas Proyek', '&lt;p&gt;&lt;b&gt;DESKRIPSI PEKERJAAN&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Tujuan utama seorang Pengawas Proyek dalam konteks industri konstruksi adalah memastikan bahwa proyek konstruksi berjalan sesuai dengan rencana, spesifikasi, dan standar yang telah ditetapkan.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;KRITERIA&lt;/b&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;Gelar sarjana atau setara dalam Teknik Sipil, Manajemen Konstruksi, atau bidang terkait.&lt;/li&gt;&lt;li&gt;Setidaknya 3 tahun pengalaman sebagai Pengawas Proyek di industri konstruksi.&lt;/li&gt;&lt;li&gt;Memiliki pemahaman mendalam tentang metode konstruksi, material, dan teknik-teknik terkait.&lt;/li&gt;&lt;li&gt;Mampu memimpin dan mengelola tim lapangan, memotivasi anggota tim untuk mencapai tujuan bersama.&lt;/li&gt;&lt;li&gt;Keterampilan komunikasi yang baik, termasuk kemampuan untuk berkomunikasi dengan semua pihak terlibat dalam proyek.&lt;/li&gt;&lt;li&gt;Kemampuan untuk mengidentifikasi masalah proyek dan menawarkan solusi yang efektif.&lt;/li&gt;&lt;li&gt;Memahami dan mematuhi peraturan keselamatan kerja, memiliki sertifikasi keselamatan kerja (misalnya, OSHA) merupakan nilai tambah.&lt;/li&gt;&lt;li&gt;Kemampuan dalam pengelolaan dokumen proyek, pelaporan, dan pemantauan jadwal pekerjaan.&lt;/li&gt;&lt;li&gt;Kemampuan menggunakan perangkat lunak manajemen proyek dan aplikasi terkait (Contoh: Microsoft Project).&lt;/li&gt;&lt;/ol&gt;', 4, 5000000.00, 10000000.00, 1, '2024-01-22 13:04:30', '2024-01-22 13:04:30'),
(4, 2, 'Akuntansi dan keuangan', '&lt;p&gt;&lt;b&gt;DESKRIPSI PEKERJAAN&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Pencatatan transaksi keuangan, rekonsiliasi dan analisis data keuangan, penyusunan laporan keuangan, audit internal, manajemen kas dan anggaran, serta kepatuhan perpajakan. Profesional di bidang ini juga terlibat dalam analisis biaya, manajemen aset, memberikan konsultasi keuangan kepada manajemen, serta memastikan kepatuhan terhadap etika dan regulasi.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;KRITERIA PEKERJAAN&lt;/b&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;Gelar sarjana di bidang Akuntansi atau keuangan.&lt;/li&gt;&lt;li&gt;Pengalaman minimal 2 tahun dalam pekerjaan akuntansi.&lt;/li&gt;&lt;li&gt;Pengalaman dengan perangkat lunak akuntansi seperti Xero atau QuickBooks.&lt;/li&gt;&lt;li&gt;Pemahaman mendalam tentang prinsip-prinsip akuntansi.&lt;/li&gt;&lt;li&gt;Kemampuan menggunakan perangkat lunak akuntansi dan spreadsheet.&lt;/li&gt;&lt;li&gt;Kemampuan berkomunikasi dengan jelas dengan anggota tim dan pihak eksternal.&lt;/li&gt;&lt;li&gt;Kemampuan berkolaborasi dalam lingkungan tim.&lt;/li&gt;&lt;li&gt;Ketelitian dalam memproses data keuangan.&lt;/li&gt;&lt;li&gt;Kemampuan analitis untuk mengevaluasi informasi keuangan.&lt;/li&gt;&lt;li&gt;Kepatuhan tinggi dengan standar etika profesi akuntan.&lt;/li&gt;&lt;li&gt;Memahami dan mengikuti kebijakan dan prosedur perusahaan.&lt;/li&gt;&lt;/ol&gt;', 5, 7000000.00, 8000000.00, 1, '2024-01-22 13:05:51', '2024-01-22 13:05:51'),
(5, 3, 'Manajemen SDM', '&lt;p&gt;&lt;b&gt;DESKRIPSI PEKERJAAN&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Manajer SDM bertanggung jawab atas pengembangan, implementasi, dan pemeliharaan kebijakan dan program-program SDM di perusahaan. Posisi ini memerlukan pemimpin yang memiliki pemahaman mendalam tentang fungsi SDM, kebijakan ketenagakerjaan, dan kemampuan untuk mengelola hubungan interpersonal dengan baik.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;KRITERIA PEKERJAAN&lt;/b&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;Gelar sarjana dalam bidang SDM, Psikologi, atau bidang terkait.&lt;/li&gt;&lt;li&gt;Pengalaman minimal 5 tahun di bidang SDM atau fungsi terkait.&lt;/li&gt;&lt;li&gt;Keterampilan komunikasi verbal dan tertulis yang baik.&lt;/li&gt;&lt;li&gt;Kemampuan untuk bekerja secara kolaboratif dan memimpin tim.&lt;/li&gt;&lt;li&gt;Pemahaman mendalam tentang peraturan ketenagakerjaan dan praktik-praktik terkini di bidang SDM.&lt;/li&gt;&lt;li&gt;Kemampuan analisis yang baik untuk mengevaluasi data kinerja karyawan.&lt;/li&gt;&lt;li&gt;Keahlian dalam penggunaan alat dan metode analisis SDM.&lt;/li&gt;&lt;li&gt;Kemampuan untuk mengidentifikasi dan menanggapi masalah SDM dengan cepat dan efektif.&lt;/li&gt;&lt;li&gt;Kreativitas dalam merancang solusi yang inovatif.&lt;/li&gt;&lt;li&gt;Pengalaman dalam mengelola tim SDM atau fungsi serupa.&lt;/li&gt;&lt;li&gt;Kemampuan untuk membuat dan melaksanakan kebijakan SDM secara efektif.&lt;/li&gt;&lt;li&gt;Memahami dan mematuhi standar etika profesional di bidang SDM.&lt;/li&gt;&lt;li&gt;&lt;/li&gt;&lt;li&gt;Menjaga kerahasiaan informasi karyawan dan data perusahaan.&lt;/li&gt;&lt;/ol&gt;', 2, 9000000.00, 12000000.00, 1, '2024-01-22 13:07:21', '2024-01-22 13:07:21'),
(6, 3, 'Keamanan dan Kesehatan Kerja (K3)', '&lt;p&gt;&lt;b&gt;DESKRIPSI PEKERJAAN&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Tujuan posisi dalam konteks manajemen proyek Keamanan dan Kesehatan Kerja (K3) di perusahaan kontraktor dapat mencakup beberapa aspek.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;KRITERIA PEKERJAAN&lt;/b&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;Gelar sarjana dalam Keselamatan dan Kesehatan Kerja, Teknik Lingkungan, atau bidang terkait.&lt;/li&gt;&lt;li&gt;Sertifikasi keselamatan (misalnya, Certified Safety Professional - CSP) diinginkan.&lt;/li&gt;&lt;li&gt;Pengalaman minimal 3 tahun dalam posisi K3, terutama di lingkungan konstruksi.&lt;/li&gt;&lt;li&gt;Pengalaman dalam menyusun dan mengimplementasikan program K3.&lt;/li&gt;&lt;li&gt;Pemahaman mendalam tentang peraturan dan standar K3, termasuk OSHA.&lt;/li&gt;&lt;li&gt;Pengetahuan tentang evaluasi risiko, pencegahan kecelakaan, dan manajemen kejadian darurat.&lt;/li&gt;&lt;li&gt;Keterampilan komunikasi yang baik untuk memberikan pelatihan dan melaporkan hasil inspeksi dengan jelas.&lt;/li&gt;&lt;li&gt;Kemampuan untuk berkomunikasi efektif dengan tim proyek dan manajemen.&lt;/li&gt;&lt;li&gt;Kemampuan analisis yang baik untuk menilai risiko dan mengidentifikasi solusi yang efektif.&lt;/li&gt;&lt;li&gt;Kreativitas dalam mengembangkan strategi pencegahan.&lt;/li&gt;&lt;li&gt;Penguasaan perangkat lunak kesehatan dan keselamatan kerja.&lt;/li&gt;&lt;li&gt;Kemampuan menggunakan perangkat lunak pelaporan dan analisis.&lt;/li&gt;&lt;li&gt;Kemampuan bekerja secara efektif dalam tim dan berkoordinasi dengan berbagai tingkatan pekerjaan.&lt;/li&gt;&lt;li&gt;Komitmen terhadap etika dan standar profesional dalam praktik K3.&lt;/li&gt;&lt;/ol&gt;', 6, 8000000.00, 13000000.00, 1, '2024-01-22 13:09:00', '2024-01-22 13:09:00'),
(7, 4, 'Pengadaan', '&lt;p&gt;&lt;b&gt;DESKRIPSI PEKERJAAN&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Manajer Pengadaan bertanggung jawab untuk mengelola seluruh proses pengadaan perusahaan, memastikan kelancaran pasokan barang dan jasa yang diperlukan, serta menjaga hubungan yang baik dengan pemasok. Posisi ini memerlukan pemahaman mendalam tentang proses pengadaan, negosiasi, dan pemilihan pemasok yang efisien.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;KRITERIA PEKERJAAN&lt;/b&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;Gelar sarjana di bidang Manajemen Bisnis, Ekonomi, atau bidang terkait.&lt;/li&gt;&lt;li&gt;Pengalaman minimal 3-5 tahun dalam manajemen pengadaan atau peran terkait.&lt;/li&gt;&lt;li&gt;Kemampuan bernegosiasi yang baik.&lt;/li&gt;&lt;li&gt;Pemahaman mendalam tentang proses pengadaan dan manajemen risiko.&lt;/li&gt;&lt;li&gt;Keterampilan analitis dan kemampuan pengambilan keputusan.&lt;/li&gt;&lt;li&gt;Keterampilan komunikasi lisan dan tulisan yang efektif.&lt;/li&gt;&lt;li&gt;Kemampuan berkolaborasi dengan berbagai pihak internal dan eksternal.&lt;/li&gt;&lt;li&gt;Kemampuan untuk mengelola proyek pengadaan dari awal hingga akhir.&lt;/li&gt;&lt;li&gt;Keterampilan manajerial dan kepemimpinan yang kuat.&lt;/li&gt;&lt;li&gt;Pemahaman tentang penggunaan perangkat lunak pengadaan dan manajemen persediaan.&lt;/li&gt;&lt;li&gt;Kemampuan menggunakan Microsoft Excel, Word, dan sistem ERP.&lt;/li&gt;&lt;li&gt;Pemahaman tentang peraturan dan hukum terkait pengadaan.&lt;/li&gt;&lt;li&gt;Kemampuan untuk memastikan kepatuhan perusahaan terhadap aturan hukum yang berlaku.&lt;/li&gt;&lt;/ol&gt;', 8, 11250000.00, 14250000.00, 1, '2024-01-22 13:10:21', '2024-01-22 13:10:21'),
(8, 4, 'Manajemen Logistik', '&lt;p&gt;&lt;b&gt;DESKRIPSI PEKERJAAN&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Tujuan dari posisi Manajer Logistik dapat bervariasi tergantung pada prioritas dan strategi perusahaan. Namun, secara umum, tujuan utama Manajer Logistik adalah mengelola rantai pasok dan kegiatan logistik dengan efisien untuk mendukung operasi perusahaan.&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-weight: bolder;\\&quot;&gt;KRITERIA PEKERJAAN&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;Gelar sarjana di bidang Logistik, Manajemen Rantai Pasok, atau bidang terkait.&lt;/li&gt;&lt;li&gt;Pengalaman minimal 5 tahun dalam fungsi logistik atau manajemen rantai pasok, diutamakan di industri terkait.&lt;/li&gt;&lt;li&gt;Pemahaman mendalam tentang konsep-konsep logistik dan manajemen rantai pasok.&lt;/li&gt;&lt;li&gt;Kemampuan analitis yang baik dan keahlian dalam menggunakan perangkat lunak logistik dan alat analisis data.&lt;/li&gt;&lt;li&gt;Keterampilan komunikasi yang kuat untuk berinteraksi dengan&lt;/li&gt;&lt;li&gt;berbagai pihak, termasuk pemasok, mitra bisnis, dan tim internal.&lt;/li&gt;&lt;li&gt;Kemampuan memimpin dan menginspirasi tim logistik.&lt;/li&gt;&lt;li&gt;Pengalaman dalam merencanakan dan melaksanakan proyek perbaikan proses.&lt;/li&gt;&lt;li&gt;Kemampuan untuk membuat keputusan dengan cepat dan efektif.&lt;/li&gt;&lt;li&gt;Sikap proaktif dan kemampuan bekerja di bawah tekanan.&lt;/li&gt;&lt;li&gt;Memahami tren dan perkembangan dalam industri logistik dan manajemen rantai pasok.&lt;/li&gt;&lt;li&gt;Pemahaman tentang regulasi dan kebijakan terkait logistik.&lt;/li&gt;&lt;li&gt;Kemampuan berpikir kreatif dalam menyelesaikan masalah dan menciptakan solusi inovatif.&lt;/li&gt;&lt;li&gt;Fleksibel dan adaptif terhadap perubahan dalam lingkungan bisnis.&lt;/li&gt;&lt;li&gt;Kesadaran akan etika kerja dan kepatuhan terhadap peraturan logistik dan hukum yang berlaku.&lt;/li&gt;&lt;li&gt;Kemampuan komunikasi yang baik dalam bahasa Inggris, lisan dan tulisan.&lt;/li&gt;&lt;li&gt;Sertifikasi logistik atau manajemen rantai pasok (opsional, namun diinginkan).&lt;/li&gt;&lt;/ol&gt;', 3, 13000000.00, 15000000.00, 1, '2024-01-22 13:12:04', '2024-01-22 13:12:04'),
(9, 5, 'Hukum Kontrak', '&lt;p&gt;&lt;b&gt;DESKRIPSI PEKERJAAN&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Sebagai Hukum Kontrak, Anda akan bertanggung jawab untuk merancang, meninjau, dan bernegosiasi kontrak-kontrak perusahaan. Anda akan bekerja sama dengan berbagai departemen untuk memastikan bahwa kontrak-kontrak tersebut memenuhi kebutuhan bisnis dan memitigasi risiko hukum. Pekerjaan ini memerlukan pemahaman mendalam tentang hukum kontrak dan kemampuan untuk berkomunikasi dengan jelas dan efektif dengan pihak internal dan eksternal.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-weight: bolder;\\&quot;&gt;KRITERIA PEKERJAAN&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;Gelar sarjana dalam Hukum atau bidang terkait. Gelar lanjutan di bidang Hukum Kontrak diutamakan.&lt;/li&gt;&lt;li&gt;Lisensi praktik advokat yang sah.&lt;/li&gt;&lt;li&gt;Pengalaman minimal 5 tahun sebagai praktisi hukum dengan fokus pada hukum kontrak.&lt;/li&gt;&lt;li&gt;Pengalaman dalam menangani kontrak-kontrak di industri terkait.&lt;/li&gt;&lt;li&gt;Pemahaman yang kuat tentang hukum kontrak, peraturan bisnis, dan hukum komersial.&lt;/li&gt;&lt;li&gt;Kemampuan untuk menulis dan menyusun kontrak dengan bahasa hukum yang jelas dan efektif.&lt;/li&gt;&lt;li&gt;Kemampuan negosiasi yang baik untuk mencapai kesepakatan yang menguntungkan.&lt;/li&gt;&lt;li&gt;Keterampilan komunikasi yang baik untuk berinteraksi dengan pihak internal dan eksternal.&lt;/li&gt;&lt;li&gt;Kemampuan analitis yang kuat untuk mengevaluasi risiko hukum dan dampaknya terhadap perusahaan.&lt;/li&gt;&lt;li&gt;Keterampilan dalam mengidentifikasi dan memecahkan masalah hukum.&lt;/li&gt;&lt;li&gt;Kemampuan bekerja dalam tim dan berkolaborasi dengan berbagai departemen.&lt;/li&gt;&lt;li&gt;Kesanggupan untuk memberikan pelatihan dan dukungan kepada tim internal.&lt;/li&gt;&lt;/ol&gt;', 4, 10000000.00, 13000000.00, 1, '2024-01-22 13:13:26', '2024-01-22 13:13:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vacancy_id` (`vacancy_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacancies`
--
ALTER TABLE `vacancies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `id` int(30) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(30) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vacancies`
--
ALTER TABLE `vacancies`
  MODIFY `id` int(30) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applicants`
--
ALTER TABLE `applicants`
  ADD CONSTRAINT `applicants_vacancy_id_foreign` FOREIGN KEY (`vacancy_id`) REFERENCES `vacancies` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `vacancies`
--
ALTER TABLE `vacancies`
  ADD CONSTRAINT `vacancies_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
