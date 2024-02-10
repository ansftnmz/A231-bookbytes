-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 10, 2024 at 10:16 AM
-- Server version: 10.3.39-MariaDB-cll-lve
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infinmwk_anis_bookbytes`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `order_id` int(5) NOT NULL,
  `buyer_id` int(5) NOT NULL,
  `seller_id` int(5) NOT NULL,
  `order_total` decimal(5,2) NOT NULL,
  `order_date` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `order_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`order_id`, `buyer_id`, `seller_id`, `order_total`, `order_date`, `order_status`) VALUES
(4, 1, 3, 630.00, '2024-02-08 01:56:29.360257', 'New'),
(5, 1, 3, 550.00, '2024-02-09 15:49:51.816533', 'New'),
(6, 1, 3, 200.00, '2024-02-09 15:58:30.138060', 'New'),
(7, 1, 3, 500.00, '2024-02-09 16:00:21.646411', 'New'),
(8, 1, 3, 500.00, '2024-02-09 16:10:51.458601', 'New'),
(9, 1, 3, 500.00, '2024-02-09 23:16:01.323852', 'New'),
(10, 1, 3, 300.00, '2024-02-09 23:22:06.177283', 'New'),
(11, 1, 3, 200.00, '2024-02-10 02:04:47.792262', 'New'),
(12, 1, 3, 250.00, '2024-02-10 02:06:19.398645', 'New'),
(13, 1, 3, 500.00, '2024-02-10 02:13:02.870930', 'New'),
(14, 1, 3, 350.00, '2024-02-10 02:15:07.278067', 'New'),
(15, 1, 3, 300.00, '2024-02-10 02:16:18.024664', 'New'),
(16, 1, 3, 300.00, '2024-02-10 02:29:38.935093', 'New'),
(17, 1, 3, 400.00, '2024-02-10 02:32:55.230056', 'New'),
(18, 1, 3, 530.00, '2024-02-10 03:03:45.820123', 'New'),
(19, 1, 3, 530.00, '2024-02-10 03:18:08.935345', 'New');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `order_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
