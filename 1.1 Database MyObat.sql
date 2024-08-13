-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2024 at 12:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myobat`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_obat`
--

CREATE TABLE `daftar_obat` (
  `obat_id` int(11) NOT NULL,
  `obat_nama` varchar(100) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_obat`
--

INSERT INTO `daftar_obat` (`obat_id`, `obat_nama`, `kategori_id`, `harga`, `description`) VALUES
(1, 'Panadol', 1, 15000, 'Panadol adalah obat yang mengandung parasetamol (asetaminofen). Parasetamol bekerja meredakan rasa sakit dan menurunkan demam. Digunakan untuk sakit kepala, sakit gigi, nyeri otot, dan demam.'),
(2, 'Ibuprofen', 1, 20000, 'Ibuprofen adalah obat antiinflamasi nonsteroid (OAINS) yang meredakan rasa sakit, peradangan, dan demam. Biasa digunakan untuk sakit kepala, sakit gigi, nyeri otot, dan demam.'),
(3, 'Amoksisilin', 2, 80000, 'Amoksisilin adalah antibiotik golongan penisilin yang umum digunakan untuk mengobati berbagai jenis infeksi bakteri, seperti infeksi saluran pernapasan, infeksi telinga, infeksi saluran kemih, dan infeksi kulit. Obat ini bekerja dengan menghambat pertumbuhan bakteri yang menyebabkan infeksi. Amoksisilin biasanya tersedia dalam bentuk tablet, kapsul, dan sirup, dan sering diberikan dalam dosis yang disesuaikan dengan berat badan dan jenis infeksi.'),
(4, 'Ciprofloxacin', 2, 40000, 'Ciprofloxacin adalah antibiotik golongan fluorokuinolon yang digunakan untuk mengobati infeksi bakteri pada berbagai bagian tubuh, termasuk infeksi saluran kemih, infeksi saluran pernapasan, infeksi kulit, infeksi tulang, dan infeksi sistem pencernaan. Obat ini bekerja dengan cara menghambat enzim bakteri yang diperlukan untuk replikasi DNA bakteri. Ciprofloxacin tersedia dalam bentuk tablet, kapsul, suspensi, dan tetes mata.'),
(5, 'Tramadol', 1, 15000, 'Tramadol adalah obat penghilang rasa sakit yang sering diresepkan untuk mengurangi nyeri sedang hingga parah. Obat ini bekerja dengan cara mengubah cara otak dan sistem saraf memproses rasa sakit.'),
(6, 'Entrostop', 11, 20000, 'Entrostop adalah obat yang digunakan untuk mengatasi diare'),
(7, 'Selkom C', 6, 29700, 'Selkom-C adalah suplemen makanan berupa kombinasi vitamin c dan vitamin b'),
(8, 'Fasidol Forte', 1, 7000, 'Fasidol forte memiliki kandungan paracetamol yang dapat menurunkan suhu tubuh dan mengurangi nyeri'),
(9, 'Sanmol Forte', 1, 4000, 'Sanmol memiliki kandungan 650mg paracetamol yang bermanfaat untuk menurunkan suhu tubuh dan mengurangi nyeri ringan'),
(10, 'Sumagesic', 1, 14000, 'Sumagesic adalah obat demam dewasa yang dapat menurunkan suhu tubuh dan mengurangi nyeri sakit gigi, sakit kepala, dan nyeri otot'),
(11, 'Cefixime', 2, 18500, 'Cefixime adalah obat untuk mengobati infeksi saluran kemih tanpa komplikasi, otitis media, faringiris dan tonsilis, bronkitis akut dan kronis (harus sesuai resep dokter)'),
(12, 'Azithromycin', 2, 45000, 'Azithromycin adalah obat untuk mengobati infeksi saluran napas atas & bawah, kulit & struktur kulit, uretritis & servistis, gonprhea tidak komplikasi, dan otitis media akut'),
(13, 'Trogyl', 2, 25700, 'Trogyl digunakan untuk mengobati amubiasis, trikomoniasis, dan infeksi bakteri anaerob'),
(14, 'Intunal', 3, 10600, 'Intunal digunakan untuk mengatasi gejala flu dan pilek'),
(15, 'Nalgestan', 3, 10200, 'Nagelstan adalah obat untuk mengobati bersin - bersin dan hidung tersumbat karena pilek'),
(16, 'Anadex', 3, 41500, 'Anadex adalah obat untuk mengobati pilek, flu, demam, sakit kepala, hidung tersumbat, dan bersin-bersin'),
(17, 'Demacolin', 3, 9200, 'Demacolin adalah obat untuk mengobati flu yang disertai sakit kepala dan demam'),
(18, 'Alpara', 3, 10900, 'Alpara adalah obat untuk  mengobati demam, flu, dan pilek yang disertai batuk kering'),
(19, 'Actifed Plus Expectorant Sirup', 4, 69000, 'Obat ini bermanfaat untuk mengobati batuk berdahak dan bersin - bersin'),
(20, 'Obat Batuk Cap Ibu & Anak Sirup', 4, 33000, 'Obat ini tidak hanya membantu meredakan batuk berdahak, tapi juga dapat melegakan tenggorokan dan memelihara kesehatan paru-paru.'),
(21, 'Aciblock', 5, 7500, 'Aciblock adalah obat untuk mengobati GERD dengan cara menghambat produksi dan menetralkan asam lambung'),
(22, 'Prosogan', 5, 363100, 'Prosogan adalah salah satu obat untuk mengatasi gangguan asam lambung, termasuk tukak lambung dan GERD.'),
(23, 'Claritin', 7, 113500, 'Obat ini mengandung Loratadin yang efektif untuk mengatasi alergi sejenis rhinitis dan biduran.'),
(24, 'Cetirizine', 7, 6500, 'Obat antihistamin ini bisa digunakan untuk mengatasi rinitis menahun, rinitis kambuhan, konjungtivitis (mata merah), dan juga meredakan pruritus (gatal), urtikaria idiopatik (biduran) kronis, serta ruam kulit.'),
(25, 'Dextamine', 7, 23500, 'Obat antihistamin ini cukup efektif untuk mengatasi  rinitis, asma bronkial, eksim, iritasi kulit, alergi obat, mata merah, infeksi mata akibat lensa kontak, atau radang mata.'),
(26, 'Acifar', 8, 33300, 'Obat Pengobatan infeksi herpes simpleks pada kulit & membran mukosa, termasuk herpes genital awal & rekuren. Pencegahan infeksi herpes simpleks berulang pada pasien imunokompeten. Profilaksis herpes simpleks pada pasien immunocompromise'),
(27, 'Oseltamivir', 8, 215500, 'Obat untuk mengatasi infeksi virus influenza tipe A (misalnya flu burung) atau B.'),
(28, 'Neviral', 8, 312800, 'Neviral digunakan untuk mengatasi penyakit human immunodeficiency virus (HIV) dengan menurunkan tingkat serangan HIV yang menggerogoti tubuh seseorang, sehingga sistem imun bekerja dengan normal. Neviral bekerja dengan menurunkan jumlah virus HIV pada darah.'),
(29, 'Sumagesic', 9, 3500, 'Obat ini bekerja dengan mengatur suhu di hipotalamus otak. Tujuannya agar suhu tubuh bisa menurun dan mengurangi nyeri ringan hingga sedang. Inilah yang membuat Sumagesic ampuh untuk meredakan sakit kepala, sakit gigi, serta demam.'),
(30, 'Voltaren Emulgel', 9, 100000, 'Voltaren Emulgel adalah obat topikal yang termasuk golongan non NSAID dengan kandungan diclofenac. Kandungan ini berguna untuk meredakan peradangan dan nyeri. Obat ini ampuh untuk mengobati reumatisme jaringan lunak dan penyakit reumatik lokal.'),
(31, 'Cataflam', 9, 43900, 'Obat ini mengandung Kalium Diklofenak yang tergolong non-steroidal anti-inflammatory drugs (NSAIDs) dengan fungsi anti-inflamasi dan anti nyeri. Cataflam bisa digunakan untuk terapi akut gejala berbagai jenis radang sendi, migrain, dan peradangan setelah operasi gigi dan tulang.'),
(32, 'Dulcolax', 10, 24500, 'Obat ini mengandung bisacodyl yang bekerja dengan merangsang pergerakan pada usus besar, sehingga mempermudah proses pengeluaran feses. Selain untuk mengatasi masalah sembelit, Dulcolax juga sering diresepkan dokter sebagai persiapan prosedur diagnostik sebelum operasi.'),
(33, 'Lactulax', 10, 63000, 'Rekomendasi lainnya, yaitu Lactulax Sirup. Obat ini merupakan pencahar yang bekerja dengan cara meningkatkan kadar air dalam tinja, sehingga membuatnya lebih lembut dan mudah keluar.'),
(34, 'Laxadine', 10, 60000, 'Laxadine emulsi adalah obat BAB keras yang dapat merangsang gerakan peristaltik usus besar dan menghambat reabsorbsi air, sehingga feses lebih mudah dikeluarkan. Kandungan dari obat ini adalah phenolphtalein, liquid paraffin, dan glycerin.'),
(35, 'Opidiar Suspesi', 11, 27500, 'Obat ini memiliki kandungan kaolin dan pectin yang dapat menyerap racun serta bakteri penyebab diare, obat ini juga dapat mengurangi frekuensi buang air besar dan memperbaiki konsistensi feses yang cair.'),
(36, 'Tay Pin San', 11, 50000, 'Obat ini adalah obat herbal yang halal dan terbuat dari tanaman legundi, akar angelica, lengkuas, dan bahan herbal lainnya. Obat ini juga ampuh untuk meredakan sakit perut, kembung, dan mengurangi frekuensi buang air besar dan memadatkan feses.'),
(37, 'Diagit', 11, 37500, 'Obat dapat digunakan pada diare yang tidak diketahui jenis penyebabnya. Dengan kandungan activated attapulgite dan pectin di dalamnya, obat ini bisa menyerap racun, bakteri, virus penyebab diare, membantu pengidap diare yang sering buang air besar, serta memperbaiki konsistensi feses yang encer.'),
(38, 'New Astar Cream', 12, 20000, 'Berbentuk obat topikal, New Astar Cream bermanfaat mengobati infeksi akibat jamur, kondisi panu dan kudis. Bukan hanya itu, obat ini juga cocok untuk mengatasi mengatasi gatal-gatal akibat keringat, zat kimia, dan disekitar alat kelamin.'),
(39, 'Zoralin', 12, 36400, 'Zoralin mengandung ketoconazole yang bekerja menghambat pertumbuhan jamur dan secara efektif dapat mengatasi infeksi jamur pada kulit dan selaput mukosa.'),
(40, 'Mycoral', 12, 62200, 'Mycoral 200 mg mengandung ketoconazole yang merupakan agen antijamur imidazol. Cara kerjanya dengan menghambat pembentukan membran sel jamur dan juga menghambat beberapa enzim jamur.'),
(41, 'Atorvastatin', 13, 60000, 'Menurunkan kolesterol, mengurangi risiko terjadinya penyakit jantung atau stroke'),
(42, 'Spironolactone', 14, 5400, 'Obat ini merupakan steroid dengan struktur yang mirip seperti aldosterone. Senyawa ini menurunkan darah tinggi dengan bekerja pada bagian distal dari tubulus ginjal.'),
(43, 'Seretide Inhaler', 15, 190000, 'Obat asma inhaler ini mampu membantu menringankan gejala asma dengan cepat. Penggunaan obat ini pun harus sesuai dengan dosis dan saran dokter.'),
(44, 'Ventolin Inhaler', 15, 162000, 'Ventolin inhaler merupakan obat asma yang bisa langsung digunakan tanpa bantuan alat nebulizer. Obat asma inhaler ini juga memiliki kandungan salbutamol untuk mengatasi penyakit asma dan penyakit paru.'),
(45, 'Fargetix', 16, 7800, 'Obat ini mengandung asam mefenamat yang dapat mengatasi rasa sakit dan peradangan. Oleh sebab itu, obat ini bermanfaat untuk mengatasi berbagai rasa nyeri, seperti nyeri sakit gigi dan setelah cabut gigi, sakit kepala, nyeri otot, nyeri sendi, nyeri setelah operasi, dan nyeri haid.'),
(46, 'Neuralgin Rx', 16, 11000, 'Neuralgin Rx adalah pilihan obat nyeri yang ampuh mengatasi rasa sakit pada gigi. Obat ini mengandung metampiron sebagai anti nyeri. Lalu juga terdapat beberapa kandungan vitamin seperti Thiamin HCl, Piridoksin HCl, dan Sianokobalamin.'),
(47, 'Minosep', 18, 24000, 'Selain mengatasi sariawan, obat sariawan ini juga mampu mencegah gingivitis, mengatasi bau mulut, menghambat pembentukan plak, dan memelihara kebersihan mulut. Obat sariawan ini dapat membantu memberikan rasa segar di mulut.'),
(48, 'Insto Regular Eye Drop', 19, 16000, 'Insto Regular mengandung zat aktif Benzalkonium klorida dan Tetrahidrozolin HCl. Obat ini digunakan untuk mengatasi mata perah serta mengurangi rasa perih akibat iritasi mata ringan.'),
(49, 'Prerdnison', 20, 2600, 'Obat generik kortikosteroid sintetis. Obat ini digunakan terapi insufisiensi adrenokortikal, untuk memperoleh efek antiinflamasi atau imunosupresan.'),
(50, 'Lukajel Antiseptic Wound Gel', 17, 25500, 'Obat topikal antiseptik dengan basis gel bening yang efektif untuk mencegah infeksi pada beragam jenis luka pada kulit seperti Luka Bakar, Luka Potong, Lecet, dan Luka Sunat.');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_obat`
--

CREATE TABLE `kategori_obat` (
  `kategori_id` int(11) NOT NULL,
  `kategori_nama` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_obat`
--

INSERT INTO `kategori_obat` (`kategori_id`, `kategori_nama`, `description`) VALUES
(1, 'Demam', 'Anti demam berperan menurunkan kondisi demam, yaitu peningkatan suhu tubuh yang cukup signifikan hingga mencapai 38 derajat Celsius atau lebih sebagai bentuk respon imun tubuh melawan infeksi virus, bakteri, jamur atau parasit penyebab penyakit.'),
(2, 'Antibiotik', 'Kategori obat yang dipergunakan untuk menghambat pertumbuhan bakteri penyebab infeksi. Konsumsi ditentukan sesuai anjuran dokter.'),
(3, 'Flu', 'Obat antiflu berperan meredakan gejala flu akibat infeksi virus influenza, seperti sakit kepala, demam, bersin-bersin, dan hidung tersumbat. Obat ini biasanya bekerja dengan menghambat zat penyebab peradangan serta mengurangi pembengkakan pembuluh darah di hidung dan mengencerkan dahak.'),
(4, 'Batuk', 'Obat batuk berperan meredakan batuk, yaitu kondisi refleks alami tubuh untuk membersihkan saluran pernapasan dari infeksi iritan, lendir, atau benda asing. Konsumsinya biasanya disertai efek samping tertentu, seperti mengantuk, pusing, mual, dan muntah. '),
(5, 'Antasida', 'Obat yang berperan untuk menetralisir gejala akibat kelebihan asam lambung (gastritis, tukak lambung, dan refluks asam), meliputi nyeri ulu hati, mual, atau rasa panas di dada (heartburn).'),
(6, 'Vitamin', 'Vitamin sebagai suplemen untuk menjaga kesehatan dan menunjang kinerja berbagai organ tubuh agar dapat berfungsi secara optimal. Vitamin ada banyak jenisnya tergantung tujuan penggunaan, seperti vitamin A, B, C, D, E, K, maupun berbagai mineral lainnya. '),
(7, 'Antihistamin', 'Obat yang digunakan untuk mengatasi alergi (rinitis alergi, urtikaria, dan alergi makanan) dengan cara mengurangi beberapa reaksi alergi yang muncul, seperti hidung tersumbat, bersin-bersin, dan kulit yang gatal.'),
(8, 'Antivirus', 'Obat yang digunakan sebagai solusi infeksi virus (seperti influenza, herpes, dan hepatitis B, influenza, herpes, atau cacar air). Kategori obat dikelompokkan dalam subkelas berdasarkan cara kerjanya, yaitu dengan memblokir reseptor sehingga virus tidak dapat berikatan dan masuk ke sel sehat, mningkatkan sistem kekebalan tubuh untuk melawan infeksi virus.'),
(9, 'Analgesik', 'Analgesik seperti parasetamol dan ibuprofen digunakan untuk meredakan nyeri otot, nyeri kepala, nyeri sendi, nyeri pasca operasi, serta gejala nyeri lainnya. Gejala yang dialami, baik akut maupun kronis yang dialami berupa sensasi tidak nyaman yang bisa disebabkan oleh berbagai kondisi, termasuk cedera, penyakit, atau peradangan. Beberapa jenis pereda nyeri NSAID antara lain adalah aspirin, ibuprofen, naproxen, meloxicam, diklofenak, flurbiprofen, dan ketorolac.'),
(10, 'Konstipasi', 'Obat yang digunakan untuk mengatasi konstipasi akut ataupun kronis, berupa gejala kondisi kesulitan buang air besar atau buang air besar yang tidak teratur. Jenis yang umum digunakan yaitu obat pencahar pembentuk massal, osmotik, pelunak tinja, pelumas dan stimulan. Cara kerjanya dengan menginduksi gerakan usus atau melunakkan tinja sehingga memudahkan proses buang air besar.'),
(11, 'Antidiare', 'Obat yang digunakan untuk mengobati diare akut maupun kronis, dengan gejala kondisi tinja menjadi cair dan sering, sering kali disebabkan oleh infeksi atau makanan yang terkontaminasi. Cara kerjanya dengan menyerap racun penyebab diare dan dibuang bersama dalam pencernaan.'),
(12, 'Infeksi jamur', 'Obat yang digunakan untuk mengobati infeksi jamur seperti kandidiasis, tinea pedis, dan tinea corporis. Gejala yang dialami dapat berupa gatal, kemerahan, dan ruam. Bentuk obatnya yang umum seperti tablet, krim, salep, hingga sampo, contohnya itraconazole, ketoconazole, clotrimazole, econazole, fluconazole, miconazole, tioconazole, serta voriconazole. Cara kerja obat antijamur dengan membunuh atau menghambat perkembangan sel jamur.'),
(13, 'Hipolipidemik (Kolesterol)', 'Obat yang bekerja untuk menurunkan kadar kolesterol dalam darah, seperti pada gejala hiperlipidemia (kolesterol tinggi) dan pencegahan penyakit kardiovaskular. Kolesterol tinggi merupakan suatu gejala kondisi lemak yang ditemukan dalam darah namun dalam kadar yang berlebihan dapat menyebabkan masalah kesehatan. Kolesterol tinggi bisa meningkatkan risiko penyakit jantung dan stroke.'),
(14, 'Hipertensi', 'Obat yang digunakan untuk menurunkan tekanan darah tinggi pada kondisi hipertensi maupun stroke. Kondisi hipertensi merupakan kondisi di mana tekanan darah di arteri meningkat secara kronis, meningkatkan risiko penyakit jantung, stroke, dan masalah kesehatan lainnya.'),
(15, 'Bronkodilator (asma)', 'Obat yang digunakan untuk melebarkan saluran pernapasan dan merelaksasi otot-otot pada saluran pernapasan yang menyempit akibat gejala alergi asma, COPD, dan bronkitis kronis. Penyakit asma sendiri bersifat genetik dan kronis yang mempengaruhi saluran pernapasan dan menyebabkan sesak napas, batuk, dan mengi. Bentuk obat dapat berupa minum, obat hirup, atau obat uap.'),
(16, 'Odontalgia (Sakit gigi)', 'Obat yang digunakan untuk mengatasi nyeri di area dalam mulut seperti nyeri gigi, abses gigi, radang gusi. Kondisi yang dialami dapat berupa nyeri di dalam atau di sekitar gigi yang bisa disebabkan oleh berbagai masalah gigi seperti gigi berlubang, abses gigi, atau penyakit gusi. Cara kerjanya dengan menghambat produksi enzim cyclo-oxygenase (COX) yang akan mengurangi produksi prostaglandin. Obat dapat berbentuk obat minum ataupun topikal, seperti cataflam, dentasol, mefinal.'),
(17, 'Antiseptik topikal', 'Obat yang dioleskan secara langsung pada jaringan kulit atau mukosa yang bertujuan membunuh atau menghambat pertumbuhan mikroorganisme seperti bakteri, virus, dan jamur, sebagai langkah preventif infeksi pada luka, goresan, atau area kulit yang rentan. Cara kerjanya melibatkan penghancuran dinding sel atau mengganggu fungsi seluler mikroorganisme penyebab infeksi.'),
(18, 'Sariawan', 'Obat yang digunakan untuk mengobati luka dalam mulut yang dikenal sebagai sariawan atau stomatitis aftosa. Cara kerjanya dengan mengurangi rasa sakit, mempercepat penyembuhan, dan mengurangi peradangan pada area yang terkena dan mencegah infeksi sekunder.'),
(19, 'Iritasi mata', 'Obat yang digunakan untuk meredakan peradangan/iritasi pada mata yang bergejala merah, gatal, dan berair. Penyebabnya termasuk alergi, infeksi, atau kontak dengan bahan iritan.'),
(20, 'Kortikosteroid', 'Obat yang digunakan untuk meredakan peradangan dan menekan sistem kekebalan tubuh dengan meniru efek hormon kortisol yang diproduksi oleh kelenjar adrenal. Tujuannya untuk mengobati berbagai kondisi inflamasi dan autoimun, seperti eksim, psoriasis, dermatitis kontak.');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `expires_at`, `last_used_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 1, 'android', 'b122bfd7930765231dfadcedf4657f52c9ab203fcad5a4e0eac3a348b58fd046', '[\"*\"]', NULL, NULL, '2024-05-19 21:47:28', '2024-05-19 21:47:28'),
(3, 'App\\Models\\User', 1, 'android', 'eaec371150991a6da4f6577a0358a87567e68d588d134ca37d5b357c1418de3c', '[\"*\"]', NULL, NULL, '2024-05-19 21:48:09', '2024-05-19 21:48:09'),
(4, 'App\\Models\\User', 1, 'android', '6c6e6279b9972bd0999af4d6e719ce32939ea678691de640749b09c943057b87', '[\"*\"]', NULL, NULL, '2024-05-19 21:51:15', '2024-05-19 21:51:15'),
(5, 'App\\Models\\User', 1, 'android', 'ed32c59e502687dcead8cbcb6fe3b263ed9d017da688668f7fb851b7559562d6', '[\"*\"]', NULL, NULL, '2024-05-19 21:53:00', '2024-05-19 21:53:00'),
(6, 'App\\Models\\User', 2, 'android', 'a67c8c9c48ff26d5de205779ab18a2e18b5a056dc1e19580e7c5a31c0a533705', '[\"*\"]', NULL, NULL, '2024-05-19 21:55:32', '2024-05-19 21:55:32'),
(7, 'App\\Models\\User', 1, 'android', '7a745985ff58057b306eeb8ad21e9514a6b14d7099d4cab0736905d60875fee7', '[\"*\"]', NULL, NULL, '2024-05-19 22:02:11', '2024-05-19 22:02:11'),
(8, 'App\\Models\\User', 1, 'android', 'fe0da461baaf2e99a1898c1b98953e80dbfc57b9936b3a2ab412a07050622e06', '[\"*\"]', NULL, NULL, '2024-05-20 00:10:29', '2024-05-20 00:10:29'),
(9, 'App\\Models\\User', 1, 'android', 'b72245cf657533cfc46241349835313ab81ae612cebcf3fc104361f1dfe09243', '[\"*\"]', NULL, NULL, '2024-05-20 00:23:26', '2024-05-20 00:23:26'),
(10, 'App\\Models\\User', 1, 'android', 'd6a055d04fcd31b9a34adaf37f12563f9a6779bcb91ab7dc845a381df0213c35', '[\"*\"]', NULL, NULL, '2024-05-20 00:29:45', '2024-05-20 00:29:45'),
(11, 'App\\Models\\User', 2, 'android', '91cd29ddc2e511770b49c9e3f7a86962a95c73ec5f6848027194d34102ff0b54', '[\"*\"]', NULL, NULL, '2024-05-20 00:34:18', '2024-05-20 00:34:18'),
(12, 'App\\Models\\User', 2, 'android', '109a6e1dc5aa6a05f48a3fa738975e097e554c45b241522527c0cad1c85ad13e', '[\"*\"]', NULL, NULL, '2024-05-20 00:36:38', '2024-05-20 00:36:38'),
(13, 'App\\Models\\User', 1, 'android', '79044daa18f95e5175932e100654e1b6a7d755ea91693319e5191f4c32b0d5cc', '[\"*\"]', NULL, NULL, '2024-05-20 00:42:16', '2024-05-20 00:42:16'),
(14, 'App\\Models\\User', 1, 'android', 'eb5c482f3f4c2a0d3477362abe37c4a0a06d00f1d7807b4f741db69b1244dd1c', '[\"*\"]', NULL, NULL, '2024-05-20 00:48:09', '2024-05-20 00:48:09'),
(15, 'App\\Models\\User', 2, 'android', '9fa4279346f95e3d7e1802c0a364fbfedb812fc5a6f53edb7f8363e07cf9bd39', '[\"*\"]', NULL, NULL, '2024-05-20 00:58:24', '2024-05-20 00:58:24'),
(16, 'App\\Models\\User', 2, 'android', '6494b55aecd1223cf1386922f2698f3318763292953e9250519402ad09d8e067', '[\"*\"]', NULL, NULL, '2024-05-20 02:16:42', '2024-05-20 02:16:42'),
(17, 'App\\Models\\User', 2, 'android', 'c97bf78adebbc135dc0ef355ebcf2687a5b8349da89de9e3658026f8a084154e', '[\"*\"]', NULL, NULL, '2024-05-20 02:17:12', '2024-05-20 02:17:12'),
(18, 'App\\Models\\User', 1, 'android', 'cc53b2a0efcacdefc9b9963e6ccc759828ab6c85d2e8e6dd153a6b4fdee634b4', '[\"*\"]', NULL, NULL, '2024-05-20 20:35:32', '2024-05-20 20:35:32'),
(19, 'App\\Models\\User', 5, 'android', '936354f108bb3f2a3ac1d0228f75b968cd4b480a929c17010163477368777674', '[\"*\"]', NULL, NULL, '2024-05-20 21:04:08', '2024-05-20 21:04:08'),
(20, 'App\\Models\\User', 5, 'android', 'e12583728c3490cbe9615ce3e12806412356220f34bd619cd945ccc48fb21383', '[\"*\"]', NULL, NULL, '2024-05-20 23:37:08', '2024-05-20 23:37:08'),
(21, 'App\\Models\\User', 1, 'android', '6f6abdfda63675c9feb1793e15c4969dc85f8d8fed20974315985b10601eedcd', '[\"*\"]', NULL, NULL, '2024-05-20 23:58:01', '2024-05-20 23:58:01'),
(22, 'App\\Models\\User', 1, 'mobile', '683d3c7b0d4c1b3bb1f676b729b65cf50bbc3b8363f9b87715538d4c46f281dd', '[\"*\"]', NULL, NULL, '2024-05-28 05:38:02', '2024-05-28 05:38:02'),
(23, 'App\\Models\\User', 1, 'mobile', 'b459adc61aa106e7c9cd294684da25e02718663c9f5437088da221f90515bcd4', '[\"*\"]', NULL, NULL, '2024-05-28 05:39:55', '2024-05-28 05:39:55'),
(24, 'App\\Models\\User', 1, 'mobile', 'a071c49cae67565f5fe398dc03bd5b56497c7f4157a29a76cba26e1c1ec96237', '[\"*\"]', NULL, NULL, '2024-05-28 05:59:36', '2024-05-28 05:59:36'),
(25, 'App\\Models\\User', 1, 'mobile', '05bfb13cc685d3ab190103527329983418863ebe0ad79b55ef09aeafdaf184ba', '[\"*\"]', NULL, NULL, '2024-06-05 00:22:55', '2024-06-05 00:22:55'),
(26, 'App\\Models\\User', 1, 'mobile', 'e358fd86e2786bc6efd888c5d23be6f4fd989cd73a1de5543ed93fd2dbc1ad4c', '[\"*\"]', NULL, NULL, '2024-06-05 00:49:31', '2024-06-05 00:49:31'),
(27, 'App\\Models\\User', 1, 'mobile', 'b475fe096f15478c4f148110106c6f3a1c088b136d20a8af673cbabf9740788b', '[\"*\"]', NULL, NULL, '2024-06-05 01:14:04', '2024-06-05 01:14:04'),
(28, 'App\\Models\\User', 1, 'mobile', 'c2f923739a1292b14ac808a80bfc54c39121ca435d318efd435e506c0045973c', '[\"*\"]', NULL, NULL, '2024-06-05 02:08:45', '2024-06-05 02:08:45'),
(29, 'App\\Models\\User', 1, 'mobile', '9e0f27b180aa16ba3bec6a10e941699348ac0e0955c46e62d86bc1effe65d123', '[\"*\"]', NULL, NULL, '2024-06-05 02:11:58', '2024-06-05 02:11:58'),
(30, 'App\\Models\\User', 1, 'mobile', 'c42aed724573581328527cdd965116883ce642259c27b988c3baeb86d9a05697', '[\"*\"]', NULL, NULL, '2024-06-20 20:08:12', '2024-06-20 20:08:12');

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

CREATE TABLE `preferences` (
  `preference_id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `obat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `preferences`
--

INSERT INTO `preferences` (`preference_id`, `user_id`, `obat_id`) VALUES
(1, 1, 1),
(3, 1, 2),
(4, 1, 3),
(8, 1, 4),
(9, 1, 5),
(11, 2, 1),
(12, 2, 2),
(15, 3, 1),
(16, 3, 2),
(17, 3, 3),
(18, 3, 4),
(19, 3, 5),
(20, 2, 3),
(21, 2, 4),
(22, 2, 5),
(23, 4, 1),
(24, 4, 2),
(25, 4, 3),
(26, 4, 4),
(27, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kevin Leo', 'kevinld1005@gmail.com', NULL, '$2y$10$efk/lKrUYcOHJy4puWq.deAMOLpz0p.PfKHGDTAqu2vWV2jhXOA06', NULL, '2024-04-30 00:11:52', '2024-05-07 19:02:48'),
(2, 'Bi Gwang', 'BigWang123@gmail.com', NULL, '$2y$10$7vEOnlPCmikNIpXrtVk94O6Y.F0uqfwj2jJSCRthSLmdzf1Kt1qVu', NULL, '2024-04-30 00:15:59', '2024-04-30 00:15:59'),
(3, 'Tony Anthalusianum', 'tonyano115@gmail.com', NULL, '$2y$10$B0siJqPKzDX76lmEjs05W.uVy4tTKA5ZEF9.dyHlcF76gvnc82f.S', NULL, '2024-04-30 00:32:18', '2024-04-30 00:32:18'),
(4, 'Robert Lee', 'robertlee89@gmail.com', NULL, '$2y$10$GX68wINal8JT/Fg0MH4Jh.FlTGP9rOQe7CVSIPEcsycVT99GqTj3C', NULL, '2024-05-14 00:21:15', '2024-05-14 00:21:15'),
(5, 'testing name', 'testemail@gmail.com', NULL, '$2y$10$4RVmi5UAJHmKwrJF.w71Wu7.SRYEnzqqoexe.rM14t5lAlHPnDezi', NULL, '2024-05-20 21:03:51', '2024-05-20 21:03:51'),
(6, 'error email test', 'erroremail@yahoo.com', NULL, '$2y$10$w2ugpYYaYe1XBeJ/jipAHOEvQwqRdOppMqadpSdcd8uUd8LIsvJAu', NULL, '2024-05-20 21:16:26', '2024-05-20 21:16:26'),
(7, 'Krun Thaep', 'krunthaep@mail.com', NULL, '$2y$10$5BhsTWgCGUc/VVg1GXvxzu0u/eljUemoFgcOKQKGtDlGGUkBYWQIi', NULL, '2024-06-05 00:23:21', '2024-06-05 00:23:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_obat`
--
ALTER TABLE `daftar_obat`
  ADD PRIMARY KEY (`obat_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kategori_obat`
--
ALTER TABLE `kategori_obat`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`preference_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `obat_id` (`obat_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_obat`
--
ALTER TABLE `daftar_obat`
  MODIFY `obat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_obat`
--
ALTER TABLE `kategori_obat`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `preferences`
--
ALTER TABLE `preferences`
  MODIFY `preference_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_obat`
--
ALTER TABLE `daftar_obat`
  ADD CONSTRAINT `daftar_obat_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_obat` (`kategori_id`);

--
-- Constraints for table `preferences`
--
ALTER TABLE `preferences`
  ADD CONSTRAINT `preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `preferences_ibfk_2` FOREIGN KEY (`obat_id`) REFERENCES `daftar_obat` (`obat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
