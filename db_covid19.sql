-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 29 Apr 2020 pada 05.58
-- Versi Server: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_covid19`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `country`
--

CREATE TABLE `country` (
  `id_country` int(10) NOT NULL,
  `country` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `country`
--

INSERT INTO `country` (`id_country`, `country`) VALUES
(1, 'USA'),
(2, 'Spain'),
(3, 'Italy'),
(4, 'France'),
(5, 'UK'),
(6, 'Germany'),
(7, 'Turkey'),
(8, 'Russia'),
(9, 'Iran'),
(10, 'China');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penderita`
--

CREATE TABLE `penderita` (
  `id_penderita` int(10) NOT NULL,
  `id_country` int(10) NOT NULL,
  `total_cases` int(200) NOT NULL,
  `new_cases` int(200) NOT NULL,
  `total_deaths` int(200) NOT NULL,
  `new_deaths` int(200) NOT NULL,
  `total_recovered` int(200) NOT NULL,
  `active_cases` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penderita`
--

INSERT INTO `penderita` (`id_penderita`, `id_country`, `total_cases`, `new_cases`, `total_deaths`, `new_deaths`, `total_recovered`, `active_cases`) VALUES
(1, 1, 1029878, 19522, 58640, 1843, 140138, 831100),
(2, 2, 232128, 2706, 23822, 301, 123903, 84403),
(3, 3, 201505, 2091, 27359, 382, 68941, 105205),
(4, 4, 165911, 2638, 23660, 367, 46886, 95365),
(5, 5, 161145, 3996, 21678, 586, 0, 139123),
(6, 6, 159431, 673, 6215, 89, 117400, 35816),
(7, 7, 114653, 2392, 2992, 92, 38809, 72852),
(8, 8, 93558, 6411, 876, 73, 8456, 84235),
(9, 9, 92584, 1112, 5877, 71, 72439, 14268),
(10, 10, 82836, 6, 4633, 0, 77555, 648);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id_country`);

--
-- Indexes for table `penderita`
--
ALTER TABLE `penderita`
  ADD PRIMARY KEY (`id_penderita`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id_country` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `penderita`
--
ALTER TABLE `penderita`
  MODIFY `id_penderita` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
