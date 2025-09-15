-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2025 at 09:14 AM
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
-- Database: `prediksi_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah_terjual` float NOT NULL,
  `jenis_roti` varchar(50) DEFAULT NULL,
  `hari` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `tanggal`, `jumlah_terjual`, `jenis_roti`, `hari`) VALUES
(1, '2023-05-09', 11, 'bakpao', 'selasa'),
(2, '2023-05-10', 17, 'bakpao', 'rabu'),
(3, '2023-05-11', 8, 'bakpao', 'kamis'),
(4, '2023-05-12', 9, 'bakpao', 'jumat'),
(5, '2023-05-13', 8, 'bakpao', 'sabtu'),
(6, '2023-05-14', 8, 'bakpao', 'minggu'),
(7, '2023-05-15', 7, 'bakpao', 'senin'),
(8, '2023-05-16', 14, 'bakpao', 'selasa'),
(9, '2023-05-17', 5, 'bakpao', 'rabu'),
(10, '2023-05-18', 17, 'bakpao', 'kamis'),
(11, '2023-05-19', 17, 'bakpao', 'jumat'),
(12, '2023-05-20', 17, 'bakpao', 'sabtu'),
(13, '2023-05-21', 17, 'bakpao', 'minggu'),
(14, '2023-05-22', 17, 'bakpao', 'senin'),
(15, '2023-05-23', 10, 'bakpao', 'selasa'),
(16, '2023-05-24', 18, 'bakpao', 'rabu'),
(17, '2023-05-25', 14, 'bakpao', 'kamis'),
(18, '2023-05-26', 11, 'bakpao', 'jumat'),
(19, '2023-05-27', 8, 'bakpao', 'sabtu'),
(20, '2023-05-28', 6, 'bakpao', 'minggu'),
(21, '2023-05-29', 3, 'bakpao', 'senin'),
(22, '2023-05-30', 2, 'bakpao', 'selasa'),
(23, '2023-05-31', 7, 'bakpao', 'rabu'),
(24, '2023-06-01', 11, 'bakpao', 'kamis'),
(25, '2023-06-02', 16, 'bakpao', 'jumat'),
(26, '2023-06-03', 15, 'bakpao', 'sabtu'),
(27, '2023-06-04', 14, 'bakpao', 'minggu'),
(28, '2023-06-05', 13, 'bakpao', 'senin'),
(29, '2023-06-06', 14, 'bakpao', 'selasa'),
(30, '2023-06-07', 12, 'bakpao', 'rabu'),
(31, '2023-06-08', 19, 'bakpao', 'kamis'),
(32, '2023-06-09', 11, 'bakpao', 'jumat'),
(33, '2023-06-10', 11, 'bakpao', 'sabtu'),
(34, '2023-06-11', 11, 'bakpao', 'minggu'),
(35, '2023-06-12', 11, 'bakpao', 'senin'),
(36, '2023-06-13', 23, 'bakpao', 'selasa'),
(37, '2023-06-14', 13, 'bakpao', 'rabu'),
(38, '2023-06-15', 13, 'bakpao', 'kamis'),
(39, '2023-06-16', 4, 'bakpao', 'jumat'),
(40, '2023-06-17', 5, 'bakpao', 'sabtu'),
(41, '2023-06-18', 5, 'bakpao', 'minggu'),
(42, '2023-06-19', 6, 'bakpao', 'senin'),
(43, '2023-06-20', 7, 'bakpao', 'selasa'),
(44, '2023-06-21', 9, 'bakpao', 'rabu'),
(45, '2023-06-22', 18, 'bakpao', 'kamis'),
(46, '2023-06-23', 4, 'bakpao', 'jumat'),
(47, '2023-06-24', 4, 'bakpao', 'sabtu'),
(48, '2023-06-25', 5, 'bakpao', 'minggu'),
(49, '2023-06-26', 5, 'bakpao', 'senin'),
(50, '2023-06-27', 3, 'bakpao', 'selasa'),
(51, '2023-06-28', 8, 'bakpao', 'rabu'),
(52, '2023-06-29', 10, 'bakpao', 'kamis'),
(53, '2023-06-30', 11, 'bakpao', 'jumat'),
(54, '2023-07-01', 12, 'bakpao', 'sabtu'),
(55, '2023-07-02', 14, 'bakpao', 'minggu'),
(56, '2023-07-03', 15, 'bakpao', 'senin'),
(57, '2023-07-04', 13, 'bakpao', 'selasa'),
(58, '2023-07-05', 15, 'bakpao', 'rabu'),
(59, '2023-07-06', 15, 'bakpao', 'kamis'),
(60, '2023-07-07', 3, 'bakpao', 'jumat'),
(61, '2023-07-08', 3, 'bakpao', 'sabtu'),
(62, '2023-07-09', 4, 'bakpao', 'minggu'),
(63, '2023-07-10', 4, 'bakpao', 'senin'),
(64, '2023-07-11', 29, 'bakpao', 'selasa'),
(65, '2023-07-12', 24, 'bakpao', 'rabu'),
(66, '2023-07-13', 26, 'bakpao', 'kamis'),
(67, '2023-07-14', 6, 'bakpao', 'jumat'),
(68, '2023-07-15', 8, 'bakpao', 'sabtu'),
(69, '2023-07-16', 10, 'bakpao', 'minggu'),
(70, '2023-07-17', 12, 'bakpao', 'senin'),
(71, '2023-07-18', 6, 'bakpao', 'selasa'),
(72, '2023-07-19', 2, 'bakpao', 'rabu'),
(73, '2023-07-20', 6, 'bakpao', 'kamis'),
(74, '2023-07-21', 10, 'bakpao', 'jumat'),
(75, '2023-07-22', 13, 'bakpao', 'sabtu'),
(76, '2023-07-23', 17, 'bakpao', 'minggu'),
(77, '2023-07-24', 20, 'bakpao', 'senin'),
(78, '2023-07-25', 4, 'bakpao', 'selasa'),
(79, '2023-07-26', 18, 'bakpao', 'rabu'),
(80, '2023-07-27', 23, 'bakpao', 'kamis'),
(81, '2023-07-28', 16, 'bakpao', 'jumat'),
(82, '2023-07-29', 15, 'bakpao', 'sabtu'),
(83, '2023-07-30', 14, 'bakpao', 'minggu'),
(84, '2023-07-31', 13, 'bakpao', 'senin'),
(85, '2023-08-01', 9, 'bakpao', 'selasa'),
(86, '2023-08-02', 28, 'bakpao', 'rabu'),
(87, '2023-08-03', 18, 'bakpao', 'kamis'),
(88, '2023-08-04', 3, 'bakpao', 'jumat'),
(89, '2023-08-05', 9, 'bakpao', 'sabtu'),
(90, '2023-08-06', 16, 'bakpao', 'minggu'),
(91, '2023-08-07', 22, 'bakpao', 'senin'),
(92, '2023-08-08', 15, 'bakpao', 'selasa'),
(93, '2023-08-09', 17, 'bakpao', 'rabu'),
(94, '2023-08-10', 26, 'bakpao', 'kamis'),
(95, '2023-08-11', 14, 'bakpao', 'jumat'),
(96, '2023-08-12', 15, 'bakpao', 'sabtu'),
(97, '2023-08-13', 16, 'bakpao', 'minggu'),
(98, '2023-08-14', 17, 'bakpao', 'senin'),
(99, '2023-08-15', 15, 'bakpao', 'selasa'),
(100, '2023-08-16', 8, 'bakpao', 'rabu'),
(101, '2023-08-17', 9, 'bakpao', 'kamis'),
(102, '2023-08-18', 11, 'bakpao', 'jumat'),
(103, '2023-08-19', 11, 'bakpao', 'sabtu'),
(104, '2023-08-20', 12, 'bakpao', 'minggu'),
(105, '2023-08-21', 12, 'bakpao', 'senin'),
(106, '2023-08-22', 10, 'bakpao', 'selasa'),
(107, '2023-08-23', 3, 'bakpao', 'rabu'),
(108, '2023-08-24', 5, 'bakpao', 'kamis'),
(109, '2023-08-25', 1, 'bakpao', 'jumat'),
(110, '2023-08-26', 1, 'bakpao', 'sabtu'),
(111, '2023-08-27', 1, 'bakpao', 'minggu'),
(112, '2023-08-28', 1, 'bakpao', 'senin'),
(113, '2023-08-29', 3, 'bakpao', 'selasa'),
(114, '2023-08-30', 14, 'bakpao', 'rabu'),
(115, '2023-08-31', 2, 'bakpao', 'kamis'),
(116, '2023-09-01', 16, 'bakpao', 'jumat'),
(117, '2023-09-02', 17, 'bakpao', 'sabtu'),
(118, '2023-09-03', 17, 'bakpao', 'minggu'),
(119, '2023-09-04', 18, 'bakpao', 'senin'),
(120, '2023-09-05', 4, 'bakpao', 'selasa'),
(121, '2023-09-06', 3, 'bakpao', 'rabu'),
(122, '2023-09-07', 6, 'bakpao', 'kamis'),
(123, '2023-09-08', 3, 'bakpao', 'jumat'),
(124, '2023-09-09', 3, 'bakpao', 'sabtu'),
(125, '2023-09-10', 2, 'bakpao', 'minggu'),
(126, '2023-09-11', 2, 'bakpao', 'senin'),
(127, '2023-09-12', 20, 'bakpao', 'selasa'),
(128, '2023-09-13', 18, 'bakpao', 'rabu'),
(129, '2023-09-14', 11, 'bakpao', 'kamis'),
(130, '2023-09-15', 3, 'bakpao', 'jumat'),
(131, '2023-09-16', 7, 'bakpao', 'sabtu'),
(132, '2023-09-17', 11, 'bakpao', 'minggu'),
(133, '2023-09-18', 15, 'bakpao', 'senin'),
(134, '2023-09-19', 15, 'bakpao', 'selasa'),
(135, '2023-09-20', 9, 'bakpao', 'rabu'),
(136, '2023-09-21', 4, 'bakpao', 'kamis'),
(137, '2023-09-22', 6, 'bakpao', 'jumat'),
(138, '2023-09-23', 8, 'bakpao', 'sabtu'),
(139, '2023-09-24', 10, 'bakpao', 'minggu'),
(140, '2023-09-25', 12, 'bakpao', 'senin'),
(141, '2023-09-26', 19, 'bakpao', 'selasa'),
(142, '2023-09-27', 12, 'bakpao', 'rabu'),
(143, '2023-09-28', 18, 'bakpao', 'kamis'),
(144, '2023-09-29', 7, 'bakpao', 'jumat'),
(145, '2023-09-30', 6, 'bakpao', 'sabtu'),
(146, '2023-10-01', 6, 'bakpao', 'minggu'),
(147, '2023-10-02', 5, 'bakpao', 'senin'),
(148, '2023-10-03', 17, 'bakpao', 'selasa'),
(149, '2023-10-04', 12, 'bakpao', 'rabu'),
(150, '2023-10-05', 7, 'bakpao', 'kamis'),
(151, '2023-10-06', 7, 'bakpao', 'jumat'),
(152, '2023-10-07', 7, 'bakpao', 'sabtu'),
(153, '2023-10-08', 6, 'bakpao', 'minggu'),
(154, '2023-10-09', 6, 'bakpao', 'senin'),
(155, '2023-10-10', 12, 'bakpao', 'selasa'),
(156, '2023-10-11', 15, 'bakpao', 'rabu'),
(157, '2023-10-12', 19, 'bakpao', 'kamis'),
(158, '2023-10-13', 5, 'bakpao', 'jumat'),
(159, '2023-10-14', 8, 'bakpao', 'sabtu'),
(160, '2023-10-15', 12, 'bakpao', 'minggu'),
(161, '2023-10-16', 15, 'bakpao', 'senin'),
(162, '2023-10-17', 11, 'bakpao', 'selasa'),
(163, '2023-10-18', 15, 'bakpao', 'rabu'),
(164, '2023-10-19', 27, 'bakpao', 'kamis'),
(165, '2023-10-20', 8, 'bakpao', 'jumat'),
(166, '2023-10-21', 11, 'bakpao', 'sabtu'),
(167, '2023-10-22', 14, 'bakpao', 'minggu'),
(168, '2023-10-23', 17, 'bakpao', 'senin'),
(169, '2023-10-24', 18, 'bakpao', 'selasa'),
(170, '2023-10-25', 15, 'bakpao', 'rabu'),
(171, '2023-10-26', 20, 'bakpao', 'kamis'),
(172, '2023-10-27', 19, 'bakpao', 'jumat'),
(173, '2023-10-28', 18, 'bakpao', 'sabtu'),
(174, '2023-10-29', 16, 'bakpao', 'minggu'),
(175, '2023-10-30', 15, 'bakpao', 'senin'),
(176, '2023-10-31', 26, 'bakpao', 'selasa'),
(177, '2023-11-01', 4, 'bakpao', 'rabu'),
(178, '2023-11-02', 20, 'bakpao', 'kamis'),
(179, '2023-11-03', 3, 'bakpao', 'jumat'),
(180, '2023-11-04', 3, 'bakpao', 'sabtu'),
(181, '2023-11-05', 3, 'bakpao', 'minggu'),
(182, '2023-11-06', 3, 'bakpao', 'senin'),
(183, '2023-11-07', 3, 'bakpao', 'selasa'),
(184, '2023-11-08', 15, 'bakpao', 'rabu'),
(185, '2023-11-09', 22, 'bakpao', 'kamis'),
(186, '2023-11-10', 3, 'bakpao', 'jumat'),
(187, '2023-11-11', 9, 'bakpao', 'sabtu'),
(188, '2023-11-12', 16, 'bakpao', 'minggu'),
(189, '2023-11-13', 22, 'bakpao', 'senin'),
(190, '2023-11-14', 13, 'bakpao', 'selasa'),
(191, '2023-11-15', 15, 'bakpao', 'rabu'),
(192, '2023-11-16', 30, 'bakpao', 'kamis'),
(193, '2023-11-17', 5, 'bakpao', 'jumat'),
(194, '2023-11-18', 7, 'bakpao', 'sabtu'),
(195, '2023-11-19', 10, 'bakpao', 'minggu'),
(196, '2023-11-20', 12, 'bakpao', 'senin'),
(197, '2023-11-21', 25, 'bakpao', 'selasa'),
(198, '2023-11-22', 14, 'bakpao', 'rabu'),
(199, '2023-11-23', 20, 'bakpao', 'kamis'),
(200, '2023-11-24', 4, 'bakpao', 'jumat'),
(201, '2023-11-25', 6, 'bakpao', 'sabtu'),
(202, '2023-11-26', 8, 'bakpao', 'minggu'),
(203, '2023-11-27', 10, 'bakpao', 'senin'),
(204, '2023-11-28', 11, 'bakpao', 'selasa'),
(205, '2023-11-29', 14, 'bakpao', 'rabu'),
(206, '2023-11-30', 11, 'bakpao', 'kamis'),
(207, '2023-12-01', 5, 'bakpao', 'jumat'),
(208, '2023-12-02', 7, 'bakpao', 'sabtu'),
(209, '2023-12-03', 10, 'bakpao', 'minggu'),
(210, '2023-12-04', 12, 'bakpao', 'senin'),
(211, '2023-12-05', 6, 'bakpao', 'selasa'),
(212, '2023-12-06', 7, 'bakpao', 'rabu'),
(213, '2023-12-07', 5, 'bakpao', 'kamis'),
(214, '2023-12-08', 5, 'bakpao', 'jumat'),
(215, '2023-12-09', 4, 'bakpao', 'sabtu'),
(216, '2023-12-10', 2, 'bakpao', 'minggu'),
(217, '2023-12-11', 1, 'bakpao', 'senin'),
(218, '2023-12-12', 12, 'bakpao', 'selasa'),
(219, '2023-12-13', 15, 'bakpao', 'rabu'),
(220, '2023-12-14', 12, 'bakpao', 'kamis'),
(221, '2023-12-15', 10, 'bakpao', 'jumat'),
(222, '2023-12-16', 12, 'bakpao', 'sabtu'),
(223, '2023-12-17', 13, 'bakpao', 'minggu'),
(224, '2023-12-18', 15, 'bakpao', 'senin'),
(225, '2023-12-19', 5, 'bakpao', 'selasa'),
(226, '2023-12-20', 11, 'bakpao', 'rabu'),
(227, '2023-12-21', 13, 'bakpao', 'kamis'),
(228, '2023-12-22', 14, 'bakpao', 'jumat'),
(229, '2023-12-23', 11, 'bakpao', 'jumat'),
(230, '2023-12-24', 17, 'bakpao', 'sabtu'),
(231, '2023-12-25', 16, 'bakpao', 'minggu'),
(232, '2023-12-26', 18, 'bakpao', 'senin'),
(233, '2023-12-27', 8, 'bakpao', 'selasa'),
(234, '2023-12-28', 8, 'bakpao', 'rabu'),
(235, '2023-12-29', 14, 'bakpao', 'kamis'),
(243, '2023-12-30', 14, 'bakpao', 'jumat'),
(244, '2023-12-31', 10, 'bakpao', 'sabtu'),
(245, '2024-01-01', 17, 'bakpao', 'minggu'),
(246, '2024-01-02', 17, 'bakpao', 'senin'),
(247, '2024-01-03', 7, 'bakpao', 'selasa'),
(248, '2024-01-04', 7, 'bakpao', 'rabu'),
(249, '2024-01-05', 17, 'bakpao', 'kamis'),
(250, '2024-01-06', 10, 'bakpao', 'jumat'),
(251, '2024-01-07', 18, 'bakpao', 'sabtu'),
(252, '2024-01-08', 14, 'bakpao', 'minggu'),
(253, '2024-01-09', 11, 'bakpao', 'senin'),
(254, '2024-01-10', 3, 'bakpao', 'selasa'),
(255, '2024-01-11', 9, 'bakpao', 'rabu'),
(256, '2024-01-12', 12, 'bakpao', 'kamis'),
(257, '2024-01-13', 20, 'bakpao', 'jumat'),
(258, '2024-01-14', 14, 'bakpao', 'sabtu'),
(259, '2024-01-15', 11, 'bakpao', 'minggu'),
(260, '2024-01-16', 12, 'bakpao', 'senin'),
(261, '2024-01-17', 3, 'bakpao', 'selasa'),
(262, '2024-01-18', 5, 'bakpao', 'rabu'),
(263, '2024-01-19', 13, 'bakpao', 'kamis'),
(264, '2024-01-20', 14, 'bakpao', 'jumat'),
(265, '2024-01-21', 12, 'bakpao', 'sabtu'),
(296, '2024-01-22', 5, 'bakpao', 'minggu'),
(297, '2024-01-23', 11, 'bakpao', 'senin'),
(298, '2024-01-24', 15, 'bakpao', 'selasa'),
(299, '2024-01-25', 13, 'bakpao', 'rabu'),
(300, '2024-01-26', 16, 'bakpao', 'kamis'),
(301, '2024-01-27', 18, 'bakpao', 'jumat'),
(302, '2024-01-28', 4, 'bakpao', 'sabtu'),
(303, '2024-01-29', 6, 'bakpao', 'minggu'),
(304, '2024-01-30', 15, 'bakpao', 'senin'),
(305, '2024-01-31', 12, 'bakpao', 'selasa'),
(306, '2024-02-01', 13, 'bakpao', 'rabu'),
(307, '2024-02-02', 17, 'bakpao', 'kamis'),
(308, '2024-02-03', 11, 'bakpao', 'jumat'),
(309, '2024-02-04', 3, 'bakpao', 'sabtu'),
(310, '2024-02-05', 4, 'bakpao', 'minggu'),
(311, '2024-02-06', 17, 'bakpao', 'senin'),
(312, '2024-02-07', 12, 'bakpao', 'selasa'),
(313, '2024-02-08', 13, 'bakpao', 'rabu'),
(314, '2024-02-09', 15, 'bakpao', 'kamis'),
(315, '2024-02-10', 16, 'bakpao', 'jumat'),
(316, '2024-02-11', 6, 'bakpao', 'sabtu'),
(317, '2024-02-12', 7, 'bakpao', 'minggu'),
(318, '2024-02-13', 13, 'bakpao', 'senin'),
(319, '2024-02-14', 14, 'bakpao', 'selasa'),
(320, '2024-02-15', 15, 'bakpao', 'rabu'),
(321, '2024-02-16', 16, 'bakpao', 'kamis'),
(322, '2024-02-17', 17, 'bakpao', 'jumat'),
(323, '2024-02-18', 9, 'bakpao', 'sabtu'),
(324, '2024-02-19', 7, 'bakpao', 'minggu'),
(325, '2024-02-20', 16, 'bakpao', 'senin'),
(386, '2024-02-21', 11, 'bakpao', 'selasa'),
(387, '2024-02-22', 17, 'bakpao', 'rabu'),
(388, '2024-02-23', 13, 'bakpao', 'kamis'),
(389, '2024-02-24', 15, 'bakpao', 'jumat'),
(390, '2024-02-25', 6, 'bakpao', 'sabtu'),
(391, '2024-02-26', 8, 'bakpao', 'minggu'),
(392, '2024-02-27', 13, 'bakpao', 'senin'),
(393, '2024-02-28', 12, 'bakpao', 'selasa'),
(394, '2024-02-29', 15, 'bakpao', 'rabu'),
(395, '2024-03-01', 19, 'bakpao', 'kamis'),
(396, '2024-03-02', 21, 'bakpao', 'jumat'),
(397, '2024-03-03', 6, 'bakpao', 'sabtu'),
(398, '2024-03-04', 4, 'bakpao', 'minggu'),
(399, '2024-03-05', 18, 'bakpao', 'senin'),
(400, '2024-03-06', 22, 'bakpao', 'selasa'),
(401, '2024-03-07', 14, 'bakpao', 'rabu'),
(402, '2024-03-08', 25, 'bakpao', 'kamis'),
(403, '2024-03-09', 12, 'bakpao', 'jumat'),
(404, '2024-03-10', 7, 'bakpao', 'sabtu'),
(405, '2024-03-11', 4, 'bakpao', 'minggu'),
(406, '2024-03-12', 16, 'bakpao', 'senin'),
(407, '2024-03-13', 21, 'bakpao', 'selasa'),
(408, '2024-03-14', 26, 'bakpao', 'rabu'),
(409, '2024-03-15', 12, 'bakpao', 'kamis'),
(410, '2024-03-16', 15, 'bakpao', 'jumat'),
(411, '2024-03-17', 4, 'bakpao', 'sabtu'),
(412, '2024-03-18', 3, 'bakpao', 'minggu'),
(413, '2024-03-19', 14, 'bakpao', 'senin'),
(414, '2024-03-20', 18, 'bakpao', 'selasa'),
(415, '2024-03-21', 23, 'bakpao', 'rabu');

-- --------------------------------------------------------

--
-- Table structure for table `prediksi`
--

CREATE TABLE `prediksi` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `prediksi` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prediksi`
--

INSERT INTO `prediksi` (`id`, `tanggal`, `prediksi`) VALUES
(1, '2024-03-22', 16.2292),
(2, '2024-03-23', 13.3503),
(3, '2024-03-24', 10.8192),
(4, '2024-03-25', 10.9304),
(5, '2024-03-26', 11.6012),
(6, '2024-03-27', 12.3185),
(7, '2024-03-28', 11.7042),
(8, '2024-03-29', 10.971),
(9, '2024-03-30', 11.2624),
(10, '2024-03-31', 12.0146),
(11, '2024-04-01', 11.977),
(12, '2024-04-02', 11.2991),
(13, '2024-04-03', 11.1278),
(14, '2024-04-04', 11.6789),
(15, '2024-04-05', 11.997),
(16, '2024-04-06', 11.6029),
(17, '2024-04-07', 11.2017),
(18, '2024-04-08', 11.4311),
(19, '2024-04-09', 11.8568),
(20, '2024-04-10', 11.7809),
(21, '2024-04-11', 11.3798),
(22, '2024-04-12', 11.3265),
(23, '2024-04-13', 11.667),
(24, '2024-04-14', 11.8168),
(25, '2024-04-15', 11.5593),
(26, '2024-04-16', 11.3487),
(27, '2024-04-17', 11.5141),
(28, '2024-04-18', 11.7511),
(29, '2024-04-19', 11.6754),
(30, '2024-04-20', 11.442);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tanggal` (`tanggal`);

--
-- Indexes for table `prediksi`
--
ALTER TABLE `prediksi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tanggal` (`tanggal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=416;

--
-- AUTO_INCREMENT for table `prediksi`
--
ALTER TABLE `prediksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
