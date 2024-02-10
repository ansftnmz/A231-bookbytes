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
-- Table structure for table `tbl_carts`
--

CREATE TABLE `tbl_carts` (
  `cart_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `cart_qty` float NOT NULL,
  `cart_status` varchar(11) NOT NULL,
  `cart_date` date NOT NULL DEFAULT current_timestamp(),
  `book_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_carts`
--

INSERT INTO `tbl_carts` (`cart_id`, `buyer_id`, `book_id`, `seller_id`, `cart_qty`, `cart_status`, `cart_date`, `book_price`) VALUES
(24, 1, 1, 3, 1, 'Paid', '2024-02-06', 0),
(25, 1, 2, 3, 1, 'Paid', '2024-02-06', 0),
(26, 1, 2, 3, 1, 'Paid', '2024-02-06', 0),
(27, 1, 4, 3, 1, 'Paid', '2024-02-06', 0),
(28, 1, 5, 3, 1, 'Paid', '2024-02-06', 0),
(37, 1, 13, 3, 1, 'Paid', '2024-02-08', 350),
(38, 1, 14, 3, 1, 'Paid', '2024-02-08', 280),
(39, 1, 6, 3, 1, 'Paid', '2024-02-08', 250),
(40, 1, 5, 3, 1, 'Paid', '2024-02-08', 300),
(41, 1, 1, 3, 1, 'Paid', '2024-02-09', 200),
(43, 1, 2, 3, 1, 'Paid', '2024-02-09', 500),
(44, 1, 7, 3, 1, 'Paid', '2024-02-09', 500),
(47, 1, 7, 3, 1, 'Paid', '2024-02-09', 500),
(48, 1, 20, 3, 1, 'Paid', '2024-02-09', 300),
(52, 3, 2, 3, 1, 'New', '2024-02-10', 500),
(53, 3, 1, 3, 1, 'New', '2024-02-10', 200),
(54, 1, 1, 3, 1, 'Paid', '2024-02-10', 200),
(55, 1, 3, 3, 1, 'Paid', '2024-02-10', 250),
(56, 1, 2, 3, 1, 'Paid', '2024-02-10', 500),
(57, 1, 13, 3, 1, 'Paid', '2024-02-10', 350),
(58, 1, 12, 3, 1, 'Paid', '2024-02-10', 300),
(59, 1, 20, 3, 1, 'Paid', '2024-02-10', 300),
(60, 1, 15, 3, 1, 'Paid', '2024-02-10', 400),
(61, 1, 14, 3, 1, 'Paid', '2024-02-10', 280),
(62, 1, 4, 3, 1, 'Paid', '2024-02-10', 250),
(63, 1, 4, 3, 1, 'Paid', '2024-02-10', 250),
(64, 1, 14, 3, 1, 'Paid', '2024-02-10', 280),
(65, 1, 5, 3, 1, 'New', '2024-02-10', 300);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_carts`
--
ALTER TABLE `tbl_carts`
  ADD PRIMARY KEY (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_carts`
--
ALTER TABLE `tbl_carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
