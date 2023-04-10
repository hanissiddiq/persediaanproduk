-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2021 at 04:54 PM
-- Server version: 10.4.21-MariaDB-log
-- PHP Version: 8.0.12

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
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `tgl_input`, `tgl_update`) VALUES
(1, 'Bambu', '2021-11-25 02:11:19', '2021-11-25 02:12:58'),
(3, 'Kertas', '2021-11-27 18:06:03', '0000-00-00 00:00:00'),
(4, 'Rotan', '2021-11-27 18:07:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pemasok`
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
-- Dumping data for table `pemasok`
--

INSERT INTO `pemasok` (`id_pemasok`, `id_user`, `id_produk`, `nama_pemasok`, `alamat_pemasok`, `no_hp_pemasok`, `is_active_pemasok`, `tgl_input`, `tgl_update`) VALUES
(2, 2, 2, 'UD Rimba Kencana Bamboo', 'Jl. Bambo, Cilacap', 2147483647, '1', '2021-11-26 08:04:10', '2021-11-26 08:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
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
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `id_satuan`, `kode_produk`, `nama_produk`, `harga`, `stok`, `tgl_input`, `tgl_update`) VALUES
(1, 1, 1, 'PRD202111255823', 'Bambu Apus', 80000, 100, '2021-11-25 06:58:18', '2021-11-25 08:09:27'),
(2, 1, 1, 'PRD202111251740', 'Bambu Kuning', 100000, 10, '2021-11-25 07:17:54', '2021-11-25 08:08:39'),
(6, 3, 1, 'PRD202111270604', 'Kertas HVS', 56000, 800, '2021-11-27 18:06:26', '2021-11-27 18:06:32'),
(7, 4, 1, 'PRD202111270701', 'Rotan Kayu', 45000, 120, '2021-11-27 18:07:19', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `produk_keluar`
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
-- Dumping data for table `produk_keluar`
--

INSERT INTO `produk_keluar` (`id_produk_keluar`, `id_produk`, `jumlah`, `tanggal`, `bulan`, `tahun`, `tgl_input`, `tgl_update`) VALUES
(7, 2, 30, '2021-11-25', 11, 2021, '2021-11-25 10:34:57', '0000-00-00 00:00:00'),
(10, 6, 200, '2021-11-27', 11, 2021, '2021-11-27 18:07:51', '0000-00-00 00:00:00');

--
-- Triggers `produk_keluar`
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
-- Table structure for table `produk_masuk`
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
-- Dumping data for table `produk_masuk`
--

INSERT INTO `produk_masuk` (`id_produk_masuk`, `id_produk`, `jumlah`, `tanggal`, `bulan`, `tahun`, `tgl_input`, `tgl_update`) VALUES
(1, 2, 5, '2021-11-25', '11', '2021', '2021-11-25 10:23:04', '0000-00-00 00:00:00'),
(5, 6, 1000, '2021-11-27', '11', '2021', '2021-11-27 18:06:42', '0000-00-00 00:00:00'),
(6, 7, 120, '2021-11-27', '11', '2021', '2021-11-27 18:07:29', '0000-00-00 00:00:00');

--
-- Triggers `produk_masuk`
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
-- Table structure for table `request_produk`
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
-- Dumping data for table `request_produk`
--

INSERT INTO `request_produk` (`id_request_produk`, `id_produk`, `id_pemasok`, `jumlah`, `tanggal_kirim`, `status`, `tgl_input`, `tgl_update`) VALUES
(1, 2, 2, 1000, '2021-11-30', '3', '2021-11-26 09:19:30', '2021-11-26 11:24:19');

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(100) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id_satuan`, `nama_satuan`, `tgl_input`, `tgl_update`) VALUES
(1, 'Pcs', '2021-11-25 00:32:37', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `nama`, `no_hp`, `profile`, `password`, `alamat`, `role_id`, `is_active`, `tgl_input`, `tgl_update`) VALUES
(1, 'admin', 'admin', '0865545555555', 'Profile7161a21e42dc8d72021-11-27.jpg', '$2y$10$Qh/QVB8iPmx0z5Xc4jTFIeQorW/aP1fOdqqr0/jKRC3RYbQQZnx0K', 'Lorem Ipsum dolor sit amet', '1', '1', '2021-11-27 15:16:53', '0000-00-00 00:00:00'),
(2, 'pemasok', 'Pemasok', '098726', 'default.png', '$2y$10$NdwFIYGrUv89HBjLwKG1VulccyjNfsJHu5yeQOkruAt0glqWg1e0u', 'Lorem Ipsum dolor sit amet', '3', '1', '2021-11-23 20:43:23', '0000-00-00 00:00:00'),
(3, 'gudang', 'Gudang', '09762535', 'default.png', '$2y$10$TimkVnZE0HjdBB6RZdyFM.OZOyZ82ICDtjwl2J3LzlrDjQgZ5jfw6', 'Lorem ipsum dolor sit amet', '4', '1', '2021-11-23 20:43:56', '0000-00-00 00:00:00'),
(4, 'pimpinan', 'Pimpinan', '023939', 'default.png', '$2y$10$XpAPK54hUZ7105fo48cvauvTaBysywv02bx69t0uqhWnzx4DcuFTi', 'Lorem ipsum dolor sit amet', '2', '1', '2021-11-23 20:47:14', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`id_pemasok`),
  ADD KEY `us` (`id_user`),
  ADD KEY `pr` (`id_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `kategori` (`id_kategori`),
  ADD KEY `satuan` (`id_satuan`);

--
-- Indexes for table `produk_keluar`
--
ALTER TABLE `produk_keluar`
  ADD PRIMARY KEY (`id_produk_keluar`),
  ADD KEY `produk_keluar_id` (`id_produk`);

--
-- Indexes for table `produk_masuk`
--
ALTER TABLE `produk_masuk`
  ADD PRIMARY KEY (`id_produk_masuk`),
  ADD KEY `id_pm` (`id_produk`);

--
-- Indexes for table `request_produk`
--
ALTER TABLE `request_produk`
  ADD PRIMARY KEY (`id_request_produk`),
  ADD KEY `requst_relasi_produk` (`id_produk`),
  ADD KEY `pemasok` (`id_pemasok`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pemasok`
--
ALTER TABLE `pemasok`
  MODIFY `id_pemasok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `produk_keluar`
--
ALTER TABLE `produk_keluar`
  MODIFY `id_produk_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `produk_masuk`
--
ALTER TABLE `produk_masuk`
  MODIFY `id_produk_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `request_produk`
--
ALTER TABLE `request_produk`
  MODIFY `id_request_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemasok`
--
ALTER TABLE `pemasok`
  ADD CONSTRAINT `pr` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `us` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON UPDATE CASCADE,
  ADD CONSTRAINT `satuan` FOREIGN KEY (`id_satuan`) REFERENCES `satuan` (`id_satuan`) ON UPDATE CASCADE;

--
-- Constraints for table `produk_keluar`
--
ALTER TABLE `produk_keluar`
  ADD CONSTRAINT `produk_keluar_id` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk_masuk`
--
ALTER TABLE `produk_masuk`
  ADD CONSTRAINT `id_pm` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `request_produk`
--
ALTER TABLE `request_produk`
  ADD CONSTRAINT `pemasok` FOREIGN KEY (`id_pemasok`) REFERENCES `pemasok` (`id_pemasok`),
  ADD CONSTRAINT `requst_relasi_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
