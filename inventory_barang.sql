-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2021 at 03:03 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `inventory_barang_keluar`
--

CREATE TABLE `inventory_barang_keluar` (
  `Kd_Barang` int(10) NOT NULL,
  `Nama_Barang` varchar(25) CHARACTER SET latin1 NOT NULL,
  `Tanggal_Masuk` date NOT NULL,
  `Tanggal_keluar` date NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Kategori` text CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory_barang_keluar`
--

INSERT INTO `inventory_barang_keluar` (`Kd_Barang`, `Nama_Barang`, `Tanggal_Masuk`, `Tanggal_keluar`, `Jumlah`, `Kategori`) VALUES
(100001, 'TOSIBA 12', '2020-08-01', '2020-09-09', 11, 'Laptop'),
(10005, 'ASUS vivobook', '2020-03-04', '2020-04-05', 2, 'Laptop');

--
-- Triggers `inventory_barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `Keluar` AFTER INSERT ON `inventory_barang_keluar` FOR EACH ROW BEGIN
UPDATE inventory_barang_masuk SET Jumlah=Jumlah-NEW.Jumlah
WHERE Kd_Barang=NEW.Kd_Barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_barang_masuk`
--

CREATE TABLE `inventory_barang_masuk` (
  `Kd_Barang` int(10) NOT NULL,
  `Nama_Barang` varchar(25) CHARACTER SET latin1 NOT NULL,
  `Tanggal_Masuk` date NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `kategori` text CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory_barang_masuk`
--

INSERT INTO `inventory_barang_masuk` (`Kd_Barang`, `Nama_Barang`, `Tanggal_Masuk`, `Jumlah`, `kategori`) VALUES
(10001, 'ASUS ROG ', '2020-01-02', 35, 'Laptop'),
(10002, 'Lenovo Thinkpad T530', '2020-02-03', 25, 'Laptop'),
(10003, 'logitec x12', '2020-02-03', 50, 'Aksesoris komputer'),
(10004, 'ACER X2010', '2020-03-04', 25, 'Monitor'),
(10005, 'ASUS vivobook', '2020-03-04', 25, 'Laptop');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
