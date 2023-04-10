-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2021 at 02:57 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pemasaran`
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

-- --------------------------------------------------------

--
-- Table structure for table `pemasok`
--

CREATE TABLE `pemasok` (
  `id_pemasok` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_pemasok` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` int(13) NOT NULL,
  `is_active` enum('1','2') NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `stock` int(11) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `produk_keluar`
--

CREATE TABLE `produk_keluar` (
  `id_brg_keluar` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `stock_sebelumnya` int(11) NOT NULL,
  `jumlah` date NOT NULL,
  `tanggal` date NOT NULL,
  `bulan` int(4) NOT NULL,
  `tahun` int(8) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request_produk`
--

CREATE TABLE `request_produk` (
  `id_req_brg` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_pemasok` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal_kirim` date NOT NULL,
  `status` enum('Request','Disetujui','Dikirim') NOT NULL,
  `tgl_input` datetime NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'admin', 'admin', '0865545555555', 'default.jpg', '$2y$10$SW7f5YgtRmEqxMs1lovcDO1zOiC67HhwLohcOzw2J9o/Ky2p5Pqq6', 'Lorem Ipsum dolor sit amet', '1', '1', '2021-11-23 07:51:10', '0000-00-00 00:00:00'),
(2, 'pemasok', 'Pemasok', '098726', 'default.jpg', '$2y$10$NdwFIYGrUv89HBjLwKG1VulccyjNfsJHu5yeQOkruAt0glqWg1e0u', 'Lorem Ipsum dolor sit amet', '3', '1', '2021-11-23 20:43:23', '0000-00-00 00:00:00'),
(3, 'gudang', 'Gudang', '09762535', 'default.jpg', '$2y$10$TimkVnZE0HjdBB6RZdyFM.OZOyZ82ICDtjwl2J3LzlrDjQgZ5jfw6', 'Lorem ipsum dolor sit amet', '4', '1', '2021-11-23 20:43:56', '0000-00-00 00:00:00'),
(4, 'pimpinan', 'Pimpinan', '023939', 'default.jpg', '$2y$10$XpAPK54hUZ7105fo48cvauvTaBysywv02bx69t0uqhWnzx4DcuFTi', 'Lorem ipsum dolor sit amet', '2', '1', '2021-11-23 20:47:14', '0000-00-00 00:00:00');

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
  ADD PRIMARY KEY (`id_pemasok`);

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
  ADD PRIMARY KEY (`id_brg_keluar`),
  ADD KEY `produk_keluar_id` (`id_produk`);

--
-- Indexes for table `request_produk`
--
ALTER TABLE `request_produk`
  ADD PRIMARY KEY (`id_req_brg`),
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
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemasok`
--
ALTER TABLE `pemasok`
  MODIFY `id_pemasok` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk_keluar`
--
ALTER TABLE `produk_keluar`
  MODIFY `id_brg_keluar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_produk`
--
ALTER TABLE `request_produk`
  MODIFY `id_req_brg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  ADD CONSTRAINT `satuan` FOREIGN KEY (`id_satuan`) REFERENCES `satuan` (`id_satuan`);

--
-- Constraints for table `produk_keluar`
--
ALTER TABLE `produk_keluar`
  ADD CONSTRAINT `produk_keluar_id` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

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
