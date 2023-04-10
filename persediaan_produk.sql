-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Mar 2023 pada 07.02
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `persediaan_produk`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `tgl_input`, `tgl_update`) VALUES
(1, 'Bambu', '2021-11-25 02:11:19', '2021-11-25 02:12:58'),
(3, 'Kertas', '2021-11-27 18:06:03', '0000-00-00 00:00:00'),
(4, 'Rotan', '2021-11-27 18:07:00', '0000-00-00 00:00:00'),
(5, 'Lakban', '2023-03-16 09:25:08', '0000-00-00 00:00:00'),
(6, 'SD', '2023-03-16 09:39:59', '0000-00-00 00:00:00'),
(7, 'SMP', '2023-03-16 09:40:07', '0000-00-00 00:00:00'),
(8, 'SMA', '2023-03-16 09:40:12', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemasok`
--

CREATE TABLE `pemasok` (
  `id_pemasok` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_pemasok` varchar(100) NOT NULL,
  `alamat_pemasok` text NOT NULL,
  `no_hp_pemasok` int(13) NOT NULL,
  `is_active_pemasok` enum('1','0') NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pemasok`
--

INSERT INTO `pemasok` (`id_pemasok`, `id_user`, `id_produk`, `nama_pemasok`, `alamat_pemasok`, `no_hp_pemasok`, `is_active_pemasok`, `tgl_input`, `tgl_update`) VALUES
(2, 2, 2, 'UD Rimba Kencana Bamboo', 'Jl. Bambo, Cilacap', 2147483647, '1', '2021-11-26 08:04:10', '2021-11-26 08:10:05'),
(3, 2, 6, 'Bireun Post', 'Bireuen', 8, '1', '2023-03-16 09:28:45', '0000-00-00 00:00:00'),
(4, 2, 6, 'MR. D.I.Y', 'Meunasah Blang, Kota Juang, Bireuen', 8, '1', '2023-03-16 09:38:29', '0000-00-00 00:00:00'),
(5, 2, 6, 'Rai Grafika', 'Jln. Andalas / P.Polem No 43 Bireuen', 2147483647, '1', '2023-03-16 13:03:15', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `kode_produk` varchar(20) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `id_satuan`, `kode_produk`, `nama_produk`, `harga`, `stok`, `tgl_input`, `tgl_update`) VALUES
(1, 1, 1, 'PRD202111255823', 'Bambu Apus', 80000, 100, '2021-11-25 06:58:18', '2021-11-25 08:09:27'),
(2, 1, 1, 'PRD202111251740', 'Bambu Kuning', 100000, 40, '2021-11-25 07:17:54', '2021-11-25 08:08:39'),
(6, 3, 1, 'PRD202111270604', 'Kertas HVS', 56000, 1000, '2021-11-27 18:06:26', '2021-11-27 18:06:32'),
(7, 4, 1, 'PRD202111270701', 'Rotan Kayu', 45000, 120, '2021-11-27 18:07:19', '0000-00-00 00:00:00'),
(8, 6, 1, 'PRD202303164020', 'Paku payung - SD', 1, 26, '2023-03-16 09:41:36', '0000-00-00 00:00:00'),
(9, 6, 1, 'PRD202303164136', 'Post Id - SD', 1, 0, '2023-03-16 09:42:21', '2023-03-16 09:43:58'),
(10, 6, 3, 'PRD202303164221', 'Pulpen Tizzo - SD', 1, 21, '2023-03-16 09:43:31', '2023-03-16 09:44:06'),
(11, 6, 1, 'PRD202303164406', 'Tinta Epson 664 Biru - SD', 1, 2, '2023-03-16 09:44:39', '2023-03-20 08:12:11'),
(12, 6, 1, 'PRD202303164439', 'Tinta Epson 003 - SD', 1, 1, '2023-03-16 09:45:22', '0000-00-00 00:00:00'),
(13, 6, 3, 'PRD202303164522', 'Trigonal Clip - SD', 1, 13, '2023-03-16 09:46:10', '0000-00-00 00:00:00'),
(14, 6, 6, 'PRD202303164610', 'Amplop putih panjang - SD', 1, 0, '2023-03-16 09:51:06', '0000-00-00 00:00:00'),
(15, 6, 3, 'PRD202303165106', 'Spidol Hitam Permanen - SD', 1, 5, '2023-03-16 09:52:05', '0000-00-00 00:00:00'),
(16, 6, 3, 'PRD202303165205', 'Pulpen Biru My Gel / Kenko - SD', 1, 0, '2023-03-16 09:53:16', '2023-03-16 09:53:24'),
(17, 6, 3, 'PRD202303165324', 'Pulpen Hitam My Gel / Kenko - SD', 1, 19, '2023-03-16 09:54:05', '0000-00-00 00:00:00'),
(18, 6, 3, 'PRD202303165405', 'Pulpen Hijau My Gel / Kenko - SD', 1, 0, '2023-03-16 09:54:34', '0000-00-00 00:00:00'),
(19, 6, 3, 'PRD202303165434', 'Pulpen Ungu My Gel / Kenko - SD', 1, 0, '2023-03-16 09:55:28', '0000-00-00 00:00:00'),
(20, 6, 3, 'PRD202303165528', 'Pensil 2B - SD', 1, 24, '2023-03-16 09:56:23', '0000-00-00 00:00:00'),
(21, 6, 3, 'PRD202303165623', 'Pulpen Snowman 0.7 - SD', 1, 4, '2023-03-16 09:57:16', '0000-00-00 00:00:00'),
(22, 6, 6, 'PRD202303165717', 'Amplop putih pendek - SD', 1, 0, '2023-03-16 09:58:02', '0000-00-00 00:00:00'),
(23, 6, 1, 'PRD202303165802', 'Tinta AIFLO Canon - SD', 1, 0, '2023-03-16 09:58:47', '0000-00-00 00:00:00'),
(24, 6, 1, 'PRD202303165848', 'Label nama - SD', 1, 1, '2023-03-16 09:59:33', '2023-03-16 11:02:54'),
(25, 6, 3, 'PRD202303165933', 'Pulpen Hitam Pilot - SD', 1, 20, '2023-03-16 10:00:20', '0000-00-00 00:00:00'),
(26, 6, 1, 'PRD202303160020', 'Binder clip no 155 - SD', 1, 34, '2023-03-16 10:01:34', '0000-00-00 00:00:00'),
(27, 6, 1, 'PRD202303160134', 'Binder clip no 111 - SD', 1, 24, '2023-03-16 10:02:06', '0000-00-00 00:00:00'),
(28, 6, 3, 'PRD202303160206', 'Map File Combo - SD', 1, 0, '2023-03-16 10:03:27', '2023-03-16 10:03:40'),
(29, 6, 1, 'PRD202303160340', 'Baterai AA - SD', 1, 0, '2023-03-16 10:04:49', '0000-00-00 00:00:00'),
(30, 6, 3, 'PRD202303160449', 'Penghapus Karet Joyko - SD', 1, 40, '2023-03-16 10:05:52', '0000-00-00 00:00:00'),
(31, 6, 3, 'PRD202303160552', 'Binder clip no 260 - SD', 1, 168, '2023-03-16 10:06:38', '0000-00-00 00:00:00'),
(32, 6, 1, 'PRD202303160638', 'Push Pin - SD', 1, 0, '2023-03-16 10:07:47', '0000-00-00 00:00:00'),
(33, 6, 5, 'PRD202303160747', 'Kertas A4 SIDU - SD', 1, 0, '2023-03-16 10:08:46', '0000-00-00 00:00:00'),
(34, 6, 3, 'PRD202303160846', 'Tinta Stempel - SD', 1, 2, '2023-03-16 10:13:46', '0000-00-00 00:00:00'),
(35, 6, 3, 'PRD202303161346', 'Bantal Stempel - SD', 1, 1, '2023-03-16 10:14:14', '0000-00-00 00:00:00'),
(36, 6, 3, 'PRD202303161605', 'Stepler / Hectare - SD', 1, 3, '2023-03-16 10:16:38', '0000-00-00 00:00:00'),
(37, 6, 7, 'PRD202303161638', 'Kertas Foto - SD', 1, 16, '2023-03-16 10:20:52', '2023-03-16 11:42:37'),
(39, 6, 7, 'PRD202303162150', 'Kertas doubleside A4 - SD', 1, 40, '2023-03-16 10:22:44', '2023-03-16 12:03:43'),
(40, 6, 7, 'PRD202303162244', 'Kertas Buram - SD', 1, 450, '2023-03-16 10:23:30', '2023-03-16 12:05:05'),
(41, 6, 3, 'PRD202303162330', 'Lakban Hitam Tebal 2 Inch - SD', 1, 9, '2023-03-16 10:25:15', '2023-03-16 12:46:57'),
(42, 6, 3, 'PRD202303162515', 'Lakban Bening 1/2 Inch - SD', 1, 2, '2023-03-16 10:26:06', '2023-03-16 12:36:36'),
(43, 6, 3, 'PRD202303162606', 'Lakban Bening 2 Inch - SD', 1, 36, '2023-03-16 10:27:42', '2023-03-16 12:45:19'),
(44, 6, 3, 'PRD202303162742', 'Tulang Clipping - SD', 1, 50, '2023-03-16 10:28:25', '2023-03-16 12:18:20'),
(45, 6, 1, 'PRD202303162825', 'Kertas Linen - SD', 1, 0, '2023-03-16 10:28:47', '0000-00-00 00:00:00'),
(46, 6, 3, 'PRD202303163116', 'Spidol Merah - SD', 1, 3, '2023-03-16 10:32:04', '2023-03-16 11:29:20'),
(47, 6, 3, 'PRD202303163204', 'Spidol Biru - SD', 1, 0, '2023-03-16 10:32:24', '0000-00-00 00:00:00'),
(48, 6, 1, 'PRD202303163225', 'Kertas Origami - SD', 1, 25, '2023-03-16 10:33:04', '2023-03-16 11:01:55'),
(49, 6, 1, 'PRD202303163304', 'Anak Hekter no 10 - SD', 1, 15, '2023-03-16 10:34:51', '2023-03-16 11:11:21'),
(50, 6, 7, 'PRD202303163451', 'Kain Flanel - SD', 1, 5, '2023-03-16 10:35:42', '2023-03-16 11:04:36'),
(51, 6, 3, 'PRD202303163542', 'Baterai C - SD', 1, 24, '2023-03-16 10:36:14', '2023-03-16 11:25:24'),
(52, 6, 3, 'PRD202303163614', 'Tinta Refill Spidol Merah - SD', 1, 0, '2023-03-16 10:37:09', '2023-03-16 10:37:32'),
(53, 6, 3, 'PRD202303163732', 'Tinta Refill Spidol Biru - SD', 1, 0, '2023-03-16 10:38:20', '0000-00-00 00:00:00'),
(54, 6, 3, 'PRD202303163820', 'Tinta Refill Spidol Hitam - SD', 1, 24, '2023-03-16 10:38:59', '2023-03-16 11:14:27'),
(55, 6, 3, 'PRD202303163859', 'Tas Plastik - SD', 1, 0, '2023-03-16 10:39:51', '0000-00-00 00:00:00'),
(56, 6, 1, 'PRD202303163951', 'Lem Gluestick kecil - SD', 1, 0, '2023-03-16 10:40:34', '0000-00-00 00:00:00'),
(57, 6, 1, 'PRD202303164034', 'Lem Gluestick besar - SD', 1, 0, '2023-03-16 10:41:02', '0000-00-00 00:00:00'),
(58, 6, 3, 'PRD202303164102', 'Peruncing Pensil - SD', 1, 0, '2023-03-16 10:41:55', '0000-00-00 00:00:00'),
(59, 6, 3, 'PRD202303164155', 'Mata Cutter - SD', 1, 11, '2023-03-16 10:42:22', '2023-03-16 11:28:00'),
(60, 6, 7, 'PRD202303164222', 'Kertas Doublepolio - SD', 1, 490, '2023-03-16 10:43:06', '2023-03-16 11:07:18'),
(61, 6, 1, 'PRD202303164306', 'Kenko 18 warna - SD', 1, 0, '2023-03-16 10:44:01', '0000-00-00 00:00:00'),
(62, 6, 3, 'PRD202303164401', 'Stepler / Hectare Besar - SD', 1, 0, '2023-03-16 10:44:30', '0000-00-00 00:00:00'),
(63, 6, 3, 'PRD202303164430', 'Pembolong Kertas Besar - SD', 1, 0, '2023-03-16 10:45:04', '0000-00-00 00:00:00'),
(64, 6, 1, 'PRD202303164504', 'Anak Hekter Besar - SD', 1, 0, '2023-03-16 10:45:32', '0000-00-00 00:00:00'),
(65, 6, 3, 'PRD202303164532', 'Cutter - SD', 1, 3, '2023-03-16 10:46:14', '2023-03-16 11:26:42'),
(66, 6, 3, 'PRD202303164614', 'Stipo / Stip X - SD', 1, 9, '2023-03-16 10:46:44', '2023-03-16 11:20:49'),
(67, 6, 3, 'PRD202303164644', 'Wadah + Kuas Cat Lukis - SD', 1, 10, '2023-03-16 10:50:46', '2023-03-16 11:39:54'),
(68, 6, 3, 'PRD202303165046', 'Bingkai Foto', 1, 2, '2023-03-16 10:51:21', '2023-03-16 12:27:23'),
(69, 6, 3, 'PRD202303165121', 'Klip Tembak Besar - SD', 1, 1, '2023-03-16 10:51:57', '2023-03-16 12:26:38'),
(70, 6, 7, 'PRD202303165157', 'Kertas HVS Warna F4', 1, 1700, '2023-03-16 10:52:43', '2023-03-16 12:09:30'),
(71, 6, 7, 'PRD202303165244', 'Amplop Kuning Polio F4 - SD', 1, 0, '2023-03-16 10:53:25', '0000-00-00 00:00:00'),
(72, 6, 1, 'PRD202303165325', 'Amplop Kuning AA 23 x 34.5 - SD', 1, 195, '2023-03-16 10:54:22', '2023-03-16 12:15:49'),
(73, 6, 3, 'PRD202303165422', 'Bingkai Foto F4 - SD', 1, 0, '2023-03-16 10:54:52', '0000-00-00 00:00:00'),
(74, 6, 3, 'PRD202303165452', 'File Box - SD', 1, 8, '2023-03-16 10:55:21', '2023-03-16 12:25:37'),
(75, 6, 3, 'PRD202303165521', 'Bantex - SD', 1, 500, '2023-03-16 10:55:46', '2023-03-16 12:22:20'),
(76, 6, 3, 'PRD202303160718', 'Lem Povinal Cair - SD', 1, 12, '2023-03-16 11:09:41', '0000-00-00 00:00:00'),
(77, 6, 1, 'PRD202303161427', 'Baterai AAA - SD', 1, 30, '2023-03-16 11:16:37', '0000-00-00 00:00:00'),
(78, 6, 1, 'PRD202303161637', 'Pensil Cat Air 12 Warna - SD', 1, 12, '2023-03-16 11:18:39', '0000-00-00 00:00:00'),
(79, 6, 3, 'PRD202303162920', 'Lem Fox - SD', 1, 3, '2023-03-16 11:33:30', '0000-00-00 00:00:00'),
(80, 6, 1, 'PRD202303163330', 'Pensil Warna  - SD', 1, 18, '2023-03-16 11:37:41', '0000-00-00 00:00:00'),
(81, 6, 7, 'PRD202303164237', 'Kertas Jeruk / Cover - SD', 1, 53, '2023-03-16 11:51:31', '0000-00-00 00:00:00'),
(82, 6, 7, 'PRD202303165131', 'Kertas Mika Cover - SD', 1, 253, '2023-03-16 11:55:21', '0000-00-00 00:00:00'),
(83, 6, 1, 'PRD202303164657', 'Lakban Bening 1 Inch - SD', 1, 13, '2023-03-16 12:48:34', '0000-00-00 00:00:00'),
(84, 6, 1, 'PRD202303164940', 'Lakban Kertas 1 Inch - SD', 1, 4, '2023-03-16 12:51:51', '0000-00-00 00:00:00'),
(85, 6, 1, 'PRD202303165151', 'Lakban Kertas 1,5 Inch - SD', 1, 5, '2023-03-16 12:52:18', '0000-00-00 00:00:00'),
(86, 6, 4, 'PRD202303162559', 'Sterofoam - SD', 1, 26, '2023-03-16 15:38:23', '0000-00-00 00:00:00'),
(87, 6, 7, 'PRD202303163823', 'Kertas Plano - SD', 1, 18, '2023-03-16 15:38:52', '0000-00-00 00:00:00'),
(88, 6, 7, 'PRD202303163852', 'Kertas Linen - SD', 1, 1, '2023-03-16 15:39:16', '0000-00-00 00:00:00'),
(89, 6, 7, 'PRD202303163917', 'Karton Spectra - SD', 1, 24, '2023-03-16 15:40:30', '0000-00-00 00:00:00'),
(90, 6, 7, 'PRD202303164030', 'Karton Biasa - SD', 1, 18, '2023-03-16 15:44:16', '0000-00-00 00:00:00'),
(91, 6, 7, 'PRD202303164416', 'Karton Hitam - SD', 1, 20, '2023-03-16 15:44:37', '0000-00-00 00:00:00'),
(92, 6, 1, 'PRD202303164437', 'Doubletape - SD', 1, 0, '2023-03-16 15:47:04', '0000-00-00 00:00:00'),
(93, 6, 7, 'PRD202303164705', 'Map Bisnis File - SD', 1, 48, '2023-03-16 15:47:58', '2023-03-18 08:40:57'),
(94, 7, 3, 'PRD202303170652', 'Peruncing Pensil - SMP', 1, 12, '2023-03-17 11:43:28', '0000-00-00 00:00:00'),
(95, 7, 3, 'PRD202303174329', 'Dispenser Lakban', 1, 1, '2023-03-17 11:43:59', '0000-00-00 00:00:00'),
(96, 7, 3, 'PRD202303174359', 'Lem Fox - SMP', 1, 2, '2023-03-17 11:44:22', '0000-00-00 00:00:00'),
(97, 7, 3, 'PRD202303174422', 'Lakban Hitam Tebal 2 Inch - SMP', 1, 1, '2023-03-17 11:44:59', '0000-00-00 00:00:00'),
(98, 7, 3, 'PRD202303174459', 'Lakban Hitam 1 Inch - SMP', 1, 4, '2023-03-17 11:46:03', '0000-00-00 00:00:00'),
(99, 7, 3, 'PRD202303174603', 'Lakban Bening 2 Inch - SMP', 1, 3, '2023-03-17 11:46:32', '0000-00-00 00:00:00'),
(100, 7, 3, 'PRD202303174633', 'Lakban Bening 1 Inch - SMP', 1, 3, '2023-03-17 11:47:13', '0000-00-00 00:00:00'),
(101, 7, 3, 'PRD202303174713', 'Lakban Kertas 1 Inch - SMP', 1, 4, '2023-03-17 11:47:47', '0000-00-00 00:00:00'),
(102, 7, 3, 'PRD202303174747', 'Doubletape - SMP', 1, 13, '2023-03-17 11:48:23', '0000-00-00 00:00:00'),
(103, 7, 1, 'PRD202303174824', 'Anak Hekter 23 - SMP', 1, 5, '2023-03-17 11:49:00', '0000-00-00 00:00:00'),
(104, 7, 1, 'PRD202303174901', 'Baterai AAA - SMP', 1, 3, '2023-03-17 11:49:34', '0000-00-00 00:00:00'),
(105, 7, 7, 'PRD202303174934', 'Penggaris Ujian UN - SMP', 1, 24, '2023-03-17 11:50:20', '0000-00-00 00:00:00'),
(106, 7, 3, 'PRD202303175020', 'Stepler / Hectare Besar - SMP', 1, 1, '2023-03-17 11:51:12', '0000-00-00 00:00:00'),
(107, 7, 1, 'PRD202303175113', 'Penghapus Papan Tulis - SMP', 1, 5, '2023-03-17 11:52:59', '0000-00-00 00:00:00'),
(108, 7, 1, 'PRD202303175259', 'Binder clip no 260 - SMP', 1, 6, '2023-03-17 11:53:23', '0000-00-00 00:00:00'),
(109, 7, 1, 'PRD202303175324', 'Binder clip no 105 - SMP', 1, 12, '2023-03-17 11:53:55', '0000-00-00 00:00:00'),
(110, 7, 1, 'PRD202303175356', 'Binder clip no 107 - SMP', 1, 19, '2023-03-17 11:54:25', '0000-00-00 00:00:00'),
(111, 7, 1, 'PRD202303175425', 'Binder clip no 111 - SMP', 1, 24, '2023-03-17 11:54:43', '0000-00-00 00:00:00'),
(112, 7, 1, 'PRD202303175443', 'Binder clip no 200 - SD', 1, 24, '2023-03-17 11:55:12', '0000-00-00 00:00:00'),
(113, 7, 1, 'PRD202303175512', 'Binder clip no 155 - SMP', 1, 28, '2023-03-17 11:55:52', '0000-00-00 00:00:00'),
(114, 7, 1, 'PRD202303175552', 'Paku payung - SMP', 1, 6, '2023-03-17 11:56:14', '0000-00-00 00:00:00'),
(115, 7, 1, 'PRD202303175615', 'Trigonal Clip - SMP', 1, 7, '2023-03-17 11:56:36', '0000-00-00 00:00:00'),
(116, 7, 3, 'PRD202303175636', 'Stepler / Hectare - SMP', 1, 3, '2023-03-17 11:57:06', '0000-00-00 00:00:00'),
(117, 7, 6, 'PRD202303175706', 'Push Pin - SMP', 1, 7, '2023-03-17 11:57:26', '0000-00-00 00:00:00'),
(118, 7, 3, 'PRD202303175726', 'Pensil 2B - SMP', 1, 7, '2023-03-17 11:57:59', '0000-00-00 00:00:00'),
(119, 7, 1, 'PRD202303175759', 'Cutter - SMP', 1, 2, '2023-03-17 11:58:28', '0000-00-00 00:00:00'),
(120, 7, 3, 'PRD202303175828', 'Tinta AIFLO Canon - SMP', 1, 1, '2023-03-17 11:59:05', '0000-00-00 00:00:00'),
(121, 7, 3, 'PRD202303175905', 'Tinta Epson 664 Kuning - SMP', 1, 2, '2023-03-17 11:59:39', '0000-00-00 00:00:00'),
(122, 7, 3, 'PRD202303175939', 'Tinta Epson 664 Biru - SMP', 1, 1, '2023-03-17 12:00:02', '0000-00-00 00:00:00'),
(123, 7, 3, 'PRD202303170002', 'Tinta Epson 664 Merah - SMP', 1, 2, '2023-03-17 12:00:27', '0000-00-00 00:00:00'),
(124, 7, 3, 'PRD202303182123', 'Penghapus Karet Joyko - SMP', 1, 47, '2023-03-18 08:21:53', '0000-00-00 00:00:00'),
(125, 7, 1, 'PRD202303182153', 'Pulpen Hitam My Gel / Kenko - SMP', 1, 24, '2023-03-18 08:26:31', '0000-00-00 00:00:00'),
(126, 7, 6, 'PRD202303182631', 'Amplop putih panjang - SMP', 1, 0, '2023-03-18 08:28:40', '0000-00-00 00:00:00'),
(127, 7, 3, 'PRD202303182840', 'Spidol Hitam - SMP', 1, 24, '2023-03-18 08:30:20', '0000-00-00 00:00:00'),
(128, 7, 1, 'PRD202303183020', 'Spidol Merah - SMP', 1, 24, '2023-03-18 08:30:54', '0000-00-00 00:00:00'),
(129, 7, 3, 'PRD202303183055', 'Stepler / Hectare Besar - SMP', 1, 1, '2023-03-18 08:33:41', '2023-03-18 08:35:42'),
(130, 7, 7, 'PRD202303183542', 'Kertas Jeruk / Cover - SMP', 1, 46, '2023-03-18 08:37:11', '0000-00-00 00:00:00'),
(131, 7, 7, 'PRD202303183711', 'Kertas doubleside A4 - SMP', 1, 100, '2023-03-18 08:37:52', '0000-00-00 00:00:00'),
(132, 7, 7, 'PRD202303183752', 'Kertas doubleside F4 - SMP', 1, 100, '2023-03-18 08:38:17', '0000-00-00 00:00:00'),
(133, 7, 3, 'PRD202303183818', 'Tinta Refill Spidol Hitam - SMP', 1, 24, '2023-03-18 08:39:36', '0000-00-00 00:00:00'),
(134, 7, 1, 'PRD202303183937', 'Tinta Refill Spidol Biru - SMP', 1, 12, '2023-03-18 08:40:33', '0000-00-00 00:00:00'),
(135, 7, 7, 'PRD202303184058', 'Map Bisnis File - SMP', 1, 40, '2023-03-18 08:41:28', '0000-00-00 00:00:00'),
(136, 7, 7, 'PRD202303184128', 'Kertas Buram - SMP', 1, 1500, '2023-03-18 08:42:12', '0000-00-00 00:00:00'),
(137, 7, 7, 'PRD202303184212', 'Kertas Plano - SMP', 1, 58, '2023-03-18 08:42:58', '0000-00-00 00:00:00'),
(138, 7, 1, 'PRD202303184258', 'Letter File - SMP', 1, 2, '2023-03-18 08:45:00', '2023-03-18 08:45:19'),
(139, 7, 3, 'PRD202303184519', 'Map File Box - SMP', 1, 5, '2023-03-18 08:47:21', '0000-00-00 00:00:00'),
(140, 7, 7, 'PRD202303184721', 'Karton Biasa - SMP', 1, 70, '2023-03-18 08:48:12', '0000-00-00 00:00:00'),
(141, 7, 7, 'PRD202303184812', 'Map Resleting - SMP', 1, 20, '2023-03-18 08:49:06', '0000-00-00 00:00:00'),
(142, 6, 7, 'PRD202303184906', 'Map Resleting - SD', 1, 38, '2023-03-18 08:51:38', '0000-00-00 00:00:00'),
(143, 8, 7, 'PRD202303185138', 'Penggaris Ujian UN - SMA', 1, 40, '2023-03-18 08:52:13', '0000-00-00 00:00:00'),
(144, 8, 3, 'PRD202303185213', 'Pensil 2B - SMA', 1, 97, '2023-03-18 08:53:13', '0000-00-00 00:00:00'),
(145, 6, 5, 'PRD202303185941', 'Kertas A4 75Gr OKEY - SD', 46000, 0, '2023-03-18 11:01:42', '0000-00-00 00:00:00'),
(146, 6, 5, 'PRD202303180142', 'Kertas F4 75Gr OKEY - SD', 50000, 4, '2023-03-18 11:02:27', '2023-03-18 12:38:38'),
(147, 8, 7, 'PRD202303180227', 'Mata Cutter - SMA', 1, 8, '2023-03-18 11:04:30', '0000-00-00 00:00:00'),
(148, 8, 3, 'PRD202303180430', 'Penghapus Karet Joyko - SMA', 1, 148, '2023-03-18 11:05:04', '0000-00-00 00:00:00'),
(149, 8, 3, 'PRD202303180504', 'Tinta Epson 664 Kuning - SMA', 90000, 3, '2023-03-18 11:06:57', '0000-00-00 00:00:00'),
(150, 8, 3, 'PRD202303180657', 'Tinta Epson 664 Merah - SMA', 90000, 1, '2023-03-18 11:09:43', '0000-00-00 00:00:00'),
(151, 8, 3, 'PRD202303180943', 'Pulpen Hitam My Gel / Kenko - SMA', 1, 23, '2023-03-18 11:10:37', '0000-00-00 00:00:00'),
(152, 8, 1, 'PRD202303181037', 'Stabilo Orange - SMA', 1, 2, '2023-03-18 11:15:12', '0000-00-00 00:00:00'),
(153, 8, 3, 'PRD202303181512', 'Stabilo Biru - SMA', 1, 2, '2023-03-18 11:16:52', '0000-00-00 00:00:00'),
(154, 8, 3, 'PRD202303181652', 'Stabilo Hijau - SMA', 1, 1, '2023-03-18 11:17:33', '0000-00-00 00:00:00'),
(155, 8, 3, 'PRD202303181733', 'Stabilo Pink - SMA', 1, 1, '2023-03-18 11:18:14', '0000-00-00 00:00:00'),
(156, 8, 3, 'PRD202303181814', 'Lem Gluestick kecil - SMA', 1, 1, '2023-03-18 11:47:52', '0000-00-00 00:00:00'),
(157, 8, 1, 'PRD202303184752', 'Trigonal Clip - SMA', 1, 1, '2023-03-18 11:48:21', '0000-00-00 00:00:00'),
(158, 8, 1, 'PRD202303184821', 'Binder clip no 155 - SMA', 1, 1, '2023-03-18 11:48:43', '0000-00-00 00:00:00'),
(159, 8, 1, 'PRD202303184843', 'Tinta Hitam Brother - SMA', 1, 2, '2023-03-18 11:49:40', '0000-00-00 00:00:00'),
(160, 8, 1, 'PRD202303184940', 'Tinta Biru Brother - SMA', 1, 1, '2023-03-18 11:50:42', '0000-00-00 00:00:00'),
(161, 8, 1, 'PRD202303185042', 'Anak Hekter no 10 - SMA', 1, 78, '2023-03-18 11:51:35', '0000-00-00 00:00:00'),
(162, 8, 1, 'PRD202303185239', 'Binder clip no 260 - SMA', 1, 48, '2023-03-18 11:53:29', '2023-03-18 11:53:38'),
(163, 8, 1, 'PRD202303185338', 'Penghapus Papan Tulis - SMA', 1, 24, '2023-03-18 11:55:12', '0000-00-00 00:00:00'),
(164, 8, 1, 'PRD202303185513', 'Tinta Stempel - SMA', 1, 2, '2023-03-18 11:55:41', '0000-00-00 00:00:00'),
(165, 8, 3, 'PRD202303185541', 'Bantal Stempel - SMA', 1, 1, '2023-03-18 11:56:14', '0000-00-00 00:00:00'),
(166, 8, 3, 'PRD202303185614', 'Spidol Hitam - SMA', 1, 12, '2023-03-18 11:57:20', '0000-00-00 00:00:00'),
(167, 8, 1, 'PRD202303185720', 'Pulpen Cat Air - SMA', 1, 1, '2023-03-18 11:57:53', '0000-00-00 00:00:00'),
(168, 8, 1, 'PRD202303185753', 'Anak Hekter 23 - SMA', 1, 15, '2023-03-18 11:58:24', '0000-00-00 00:00:00'),
(169, 8, 1, 'PRD202303185824', 'Anak Hekter 24 - SMA', 1, 5, '2023-03-18 11:59:01', '0000-00-00 00:00:00'),
(170, 8, 1, 'PRD202303185901', 'Peruncing Pensil - SMA', 1, 16, '2023-03-18 11:59:38', '0000-00-00 00:00:00'),
(171, 8, 1, 'PRD202303185938', 'Pulpen Biru My Gel / Kenko - SMA', 1, 19, '2023-03-18 12:00:21', '0000-00-00 00:00:00'),
(172, 8, 1, 'PRD202303180021', 'Pulpen Hitam STandard - SMA', 1, 9, '2023-03-18 12:01:09', '0000-00-00 00:00:00'),
(173, 8, 1, 'PRD202303180109', 'Pulpen Hitam Pilot - SMA', 1, 9, '2023-03-18 12:01:42', '0000-00-00 00:00:00'),
(174, 8, 1, 'PRD202303180142', 'Pulpen Biru Pilot - SMA', 1, 12, '2023-03-18 12:02:59', '0000-00-00 00:00:00'),
(175, 8, 1, 'PRD202303180259', 'Pulpen Hitam Snowman 0.6 - SMA', 1, 8, '2023-03-18 12:03:32', '0000-00-00 00:00:00'),
(176, 8, 3, 'PRD202303180332', 'Kerokan Pensil Besar - SMA', 1, 4, '2023-03-18 12:03:55', '0000-00-00 00:00:00'),
(177, 8, 1, 'PRD202303180355', 'Push Pin - SMA', 1, 3, '2023-03-18 12:04:20', '0000-00-00 00:00:00'),
(178, 8, 1, 'PRD202303180420', 'Baterai AA - SMA', 1, 2, '2023-03-18 12:04:54', '0000-00-00 00:00:00'),
(179, 8, 1, 'PRD202303180454', 'Kertas Origami - SMA', 1, 5, '2023-03-18 12:05:26', '0000-00-00 00:00:00'),
(180, 8, 1, 'PRD202303180526', 'Label nama - SMA', 1, 47, '2023-03-18 12:05:46', '0000-00-00 00:00:00'),
(181, 8, 6, 'PRD202303180546', 'Amplop putih pendek - SMA', 1, 1, '2023-03-18 12:06:43', '0000-00-00 00:00:00'),
(182, 8, 3, 'PRD202303180643', 'Baterai C - SMA', 1, 36, '2023-03-18 12:07:27', '0000-00-00 00:00:00'),
(183, 8, 1, 'PRD202303180727', 'Pulpen Warna fabercastel 20 Warna - SMA', 1, 1, '2023-03-18 12:08:29', '0000-00-00 00:00:00'),
(184, 8, 6, 'PRD202303180829', 'Cat Lukis Canvas Pastel - SMA', 1, 2, '2023-03-18 12:09:03', '0000-00-00 00:00:00'),
(185, 8, 3, 'PRD202303180904', 'Map Bisnis File - SMA', 1, 4, '2023-03-18 12:09:51', '0000-00-00 00:00:00'),
(186, 8, 3, 'PRD202303180951', 'Kuas Cat Lukis - SMA', 1, 3, '2023-03-18 12:10:13', '0000-00-00 00:00:00'),
(187, 8, 3, 'PRD202303181014', 'Tinta Refill Spidol Hitam - SMA', 1, 59, '2023-03-18 12:11:05', '0000-00-00 00:00:00'),
(188, 8, 3, 'PRD202303181105', 'Lem Cap Kambing - SMA', 1, 2, '2023-03-18 12:11:30', '0000-00-00 00:00:00'),
(189, 8, 1, 'PRD202303181130', 'Doubletape 1/2 inch - SMA', 1, 14, '2023-03-18 12:12:12', '0000-00-00 00:00:00'),
(190, 8, 1, 'PRD202303181212', 'Doubletape 3M Busa - SMA', 1, 3, '2023-03-18 12:12:38', '0000-00-00 00:00:00'),
(191, 8, 1, 'PRD202303181239', 'Lakban Warna 1/2 inch', 1, 2, '2023-03-18 12:13:27', '0000-00-00 00:00:00'),
(192, 8, 7, 'PRD202303181327', 'Kertas Jeruk / Cover Merah - SMA', 1, 225, '2023-03-18 12:14:29', '0000-00-00 00:00:00'),
(193, 8, 7, 'PRD202303181430', 'Kertas Jeruk / Cover Putih - SMA', 1, 100, '2023-03-18 12:15:03', '0000-00-00 00:00:00'),
(194, 8, 3, 'PRD202303181503', 'Buku Gambar A3 - SMA', 1, 5, '2023-03-18 12:15:39', '0000-00-00 00:00:00'),
(195, 8, 7, 'PRD202303181540', 'Kertas doubleside A4 - SMA', 1, 100, '2023-03-18 12:16:19', '0000-00-00 00:00:00'),
(196, 8, 7, 'PRD202303181619', 'Kertas Buram - SMA', 1, 500, '2023-03-18 12:16:48', '0000-00-00 00:00:00'),
(197, 8, 7, 'PRD202303181648', 'Kertas Mika Cover - SMA', 1, 92, '2023-03-18 12:17:11', '0000-00-00 00:00:00'),
(198, 8, 3, 'PRD202303181711', 'Klip Tembak Besar - SMA', 1, 1, '2023-03-18 12:18:09', '0000-00-00 00:00:00'),
(199, 8, 3, 'PRD202303181809', 'Letter File - SMA', 1, 6, '2023-03-18 12:18:39', '0000-00-00 00:00:00'),
(200, 8, 3, 'PRD202303181839', 'Lakban Bening 2 Inch - SMA', 1, 5, '2023-03-18 12:19:00', '0000-00-00 00:00:00'),
(201, 8, 3, 'PRD202303181900', 'Lakban Bening 1 Inch - SMA', 1, 4, '2023-03-18 12:19:28', '0000-00-00 00:00:00'),
(202, 8, 3, 'PRD202303181928', 'Doubletape 1 inch - SMA', 1, 2, '2023-03-18 12:20:03', '0000-00-00 00:00:00'),
(203, 8, 1, 'PRD202303182003', 'Map File Box - SMA', 1, 8, '2023-03-18 12:20:26', '0000-00-00 00:00:00'),
(204, 8, 1, 'PRD202303182026', 'Pengikat Dokumen paper fastener -  SMA', 1, 50, '2023-03-18 12:21:17', '0000-00-00 00:00:00'),
(205, 8, 7, 'PRD202303182117', 'Amplop Kuning AA 24 x 34.5 - SMA', 1, 279, '2023-03-18 12:21:58', '0000-00-00 00:00:00'),
(206, 8, 7, 'PRD202303182158', 'Amplop Kuning AA 29 x 39 - SMA', 1, 250, '2023-03-18 12:22:35', '0000-00-00 00:00:00'),
(207, 8, 6, 'PRD202303182235', 'Bantex - SMA', 1, 2, '2023-03-18 12:22:55', '0000-00-00 00:00:00'),
(208, 8, 7, 'PRD202303182255', 'Sterofoam - SMA', 1, 20, '2023-03-18 12:23:32', '0000-00-00 00:00:00'),
(209, 8, 7, 'PRD202303182332', 'Map Biasa - SMA', 1, 100, '2023-03-18 12:23:50', '0000-00-00 00:00:00'),
(210, 8, 7, 'PRD202303182350', 'Map Resleting - SMA', 1, 13, '2023-03-18 12:28:09', '0000-00-00 00:00:00'),
(211, 6, 3, 'PRD202303200857', 'Tinta Epson 664 Hitam - SD', 90000, 0, '2023-03-20 08:10:04', '0000-00-00 00:00:00'),
(212, 6, 1, 'PRD202303201212', 'Tinta Epson 664 Merah - SD', 90000, 2, '2023-03-20 08:12:42', '0000-00-00 00:00:00'),
(213, 6, 1, 'PRD202303201646', 'Lakban Hitam 1 Inch - SD', 1, 14, '2023-03-20 12:37:03', '2023-03-20 12:55:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_keluar`
--

CREATE TABLE `produk_keluar` (
  `id_produk_keluar` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bulan` int(4) NOT NULL,
  `tahun` int(8) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk_keluar`
--

INSERT INTO `produk_keluar` (`id_produk_keluar`, `id_produk`, `jumlah`, `tanggal`, `bulan`, `tahun`, `tgl_input`, `tgl_update`) VALUES
(11, 145, 1, '2023-03-18', 3, 2023, '2023-03-18 12:37:01', '0000-00-00 00:00:00'),
(12, 146, 6, '2023-03-18', 3, 2023, '2023-03-18 12:38:59', '0000-00-00 00:00:00'),
(13, 211, 1, '2023-03-20', 3, 2023, '2023-03-20 10:31:59', '0000-00-00 00:00:00'),
(14, 211, 1, '2023-03-20', 3, 2023, '2023-03-20 11:42:32', '0000-00-00 00:00:00'),
(15, 79, 2, '2023-03-20', 3, 2023, '2023-03-20 11:43:06', '0000-00-00 00:00:00'),
(16, 90, 1, '2023-03-20', 3, 2023, '2023-03-20 11:43:44', '0000-00-00 00:00:00'),
(17, 81, 200, '2023-03-20', 3, 2023, '2023-03-20 11:44:33', '0000-00-00 00:00:00'),
(18, 145, 4, '2023-03-20', 3, 2023, '2023-03-20 12:03:58', '0000-00-00 00:00:00'),
(19, 41, 1, '2023-03-18', 3, 2023, '2023-03-20 12:31:14', '0000-00-00 00:00:00'),
(20, 213, 1, '2023-03-17', 3, 2023, '2023-03-20 12:38:16', '0000-00-00 00:00:00'),
(21, 20, 11, '2023-03-17', 3, 2023, '2023-03-20 12:40:50', '0000-00-00 00:00:00'),
(22, 49, 2, '2023-03-18', 3, 2023, '2023-03-20 12:46:41', '0000-00-00 00:00:00'),
(23, 126, 1, '2023-03-27', 3, 2023, '2023-03-27 09:56:33', '0000-00-00 00:00:00');

--
-- Trigger `produk_keluar`
--
DELIMITER $$
CREATE TRIGGER `hapus_produk_keluar` AFTER DELETE ON `produk_keluar` FOR EACH ROW BEGIN
UPDATE produk SET stok = stok + OLD.jumlah WHERE id_produk = OLD.id_produk;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `produk_keluar` AFTER INSERT ON `produk_keluar` FOR EACH ROW BEGIN
UPDATE produk SET stok = stok -NEW.jumlah WHERE id_produk = NEW.id_produk;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_masuk`
--

CREATE TABLE `produk_masuk` (
  `id_produk_masuk` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bulan` varchar(5) NOT NULL,
  `tahun` varchar(8) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk_masuk`
--

INSERT INTO `produk_masuk` (`id_produk_masuk`, `id_produk`, `jumlah`, `tanggal`, `bulan`, `tahun`, `tgl_input`, `tgl_update`) VALUES
(1, 2, 5, '2021-11-25', '11', '2021', '2021-11-25 10:23:04', '0000-00-00 00:00:00'),
(5, 6, 1000, '2021-11-27', '11', '2021', '2021-11-27 18:06:42', '0000-00-00 00:00:00'),
(6, 7, 120, '2021-11-27', '11', '2021', '2021-11-27 18:07:29', '0000-00-00 00:00:00'),
(7, 88, 1, '2023-03-18', '03', '2023', '2023-03-20 08:08:14', '0000-00-00 00:00:00'),
(8, 211, 2, '2023-03-18', '03', '2023', '2023-03-20 08:10:28', '0000-00-00 00:00:00');

--
-- Trigger `produk_masuk`
--
DELIMITER $$
CREATE TRIGGER `delete_produk_masuk` AFTER DELETE ON `produk_masuk` FOR EACH ROW BEGIN
UPDATE produk SET stok = stok - OLD.jumlah WHERE id_produk = OLD.id_produk;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `produk_masuk` AFTER INSERT ON `produk_masuk` FOR EACH ROW BEGIN
UPDATE produk SET stok = stok + NEW.jumlah WHERE id_produk = NEW.id_produk;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `request_produk`
--

CREATE TABLE `request_produk` (
  `id_request_produk` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_pemasok` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal_kirim` date NOT NULL,
  `status` enum('0','1','2','3','4','5') NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `request_produk`
--

INSERT INTO `request_produk` (`id_request_produk`, `id_produk`, `id_pemasok`, `jumlah`, `tanggal_kirim`, `status`, `tgl_input`, `tgl_update`) VALUES
(1, 2, 2, 1000, '2021-11-30', '3', '2021-11-26 09:19:30', '2021-11-26 11:24:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(100) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `satuan`
--

INSERT INTO `satuan` (`id_satuan`, `nama_satuan`, `tgl_input`, `tgl_update`) VALUES
(1, 'Pcs', '2021-11-25 00:32:37', '0000-00-00 00:00:00'),
(3, 'Buah', '2023-03-15 12:40:36', '0000-00-00 00:00:00'),
(4, 'Papan', '2023-03-15 12:40:54', '0000-00-00 00:00:00'),
(5, 'Rim', '2023-03-15 12:41:03', '0000-00-00 00:00:00'),
(6, 'Kotak', '2023-03-15 12:41:29', '0000-00-00 00:00:00'),
(7, 'Lembar', '2023-03-15 12:41:38', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `profile` varchar(100) NOT NULL,
  `password` varchar(225) NOT NULL,
  `alamat` text NOT NULL,
  `role_id` enum('1','2','3','4') NOT NULL,
  `is_active` enum('1','2') NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `nama`, `no_hp`, `profile`, `password`, `alamat`, `role_id`, `is_active`, `tgl_input`, `tgl_update`) VALUES
(1, 'admin', 'admin', '082211887735', 'Profile7161a21e42dc8d72021-11-27.jpg', '$2y$10$Qh/QVB8iPmx0z5Xc4jTFIeQorW/aP1fOdqqr0/jKRC3RYbQQZnx0K', 'matangglumpangdua', '1', '1', '2023-03-15 12:34:28', '0000-00-00 00:00:00'),
(2, 'pemasok', 'Pemasok', '098726', 'default.png', '$2y$10$NdwFIYGrUv89HBjLwKG1VulccyjNfsJHu5yeQOkruAt0glqWg1e0u', 'Lorem Ipsum dolor sit amet', '3', '1', '2021-11-23 20:43:23', '0000-00-00 00:00:00'),
(3, 'gudang', 'Gudang', '09762535', 'default.png', '$2y$10$TimkVnZE0HjdBB6RZdyFM.OZOyZ82ICDtjwl2J3LzlrDjQgZ5jfw6', 'Lorem ipsum dolor sit amet', '4', '1', '2021-11-23 20:43:56', '0000-00-00 00:00:00'),
(4, 'pimpinan', 'Pimpinan', '023939', 'default.png', '$2y$10$XpAPK54hUZ7105fo48cvauvTaBysywv02bx69t0uqhWnzx4DcuFTi', 'Lorem ipsum dolor sit amet', '2', '1', '2021-11-23 20:47:14', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`id_pemasok`),
  ADD KEY `us` (`id_user`),
  ADD KEY `pr` (`id_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `kategori` (`id_kategori`),
  ADD KEY `satuan` (`id_satuan`);

--
-- Indeks untuk tabel `produk_keluar`
--
ALTER TABLE `produk_keluar`
  ADD PRIMARY KEY (`id_produk_keluar`),
  ADD KEY `produk_keluar_id` (`id_produk`);

--
-- Indeks untuk tabel `produk_masuk`
--
ALTER TABLE `produk_masuk`
  ADD PRIMARY KEY (`id_produk_masuk`),
  ADD KEY `id_pm` (`id_produk`);

--
-- Indeks untuk tabel `request_produk`
--
ALTER TABLE `request_produk`
  ADD PRIMARY KEY (`id_request_produk`),
  ADD KEY `requst_relasi_produk` (`id_produk`),
  ADD KEY `pemasok` (`id_pemasok`);

--
-- Indeks untuk tabel `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pemasok`
--
ALTER TABLE `pemasok`
  MODIFY `id_pemasok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT untuk tabel `produk_keluar`
--
ALTER TABLE `produk_keluar`
  MODIFY `id_produk_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `produk_masuk`
--
ALTER TABLE `produk_masuk`
  MODIFY `id_produk_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `request_produk`
--
ALTER TABLE `request_produk`
  MODIFY `id_request_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pemasok`
--
ALTER TABLE `pemasok`
  ADD CONSTRAINT `pr` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `us` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON UPDATE CASCADE,
  ADD CONSTRAINT `satuan` FOREIGN KEY (`id_satuan`) REFERENCES `satuan` (`id_satuan`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk_keluar`
--
ALTER TABLE `produk_keluar`
  ADD CONSTRAINT `produk_keluar_id` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk_masuk`
--
ALTER TABLE `produk_masuk`
  ADD CONSTRAINT `id_pm` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `request_produk`
--
ALTER TABLE `request_produk`
  ADD CONSTRAINT `pemasok` FOREIGN KEY (`id_pemasok`) REFERENCES `pemasok` (`id_pemasok`),
  ADD CONSTRAINT `requst_relasi_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
