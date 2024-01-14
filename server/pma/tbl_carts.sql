-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2024 at 03:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookbytes`
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
  `cart_status` int(11) NOT NULL,
  `cart_date` date NOT NULL DEFAULT current_timestamp(),
  `book_title` varchar(50) NOT NULL,
  `book_price` float NOT NULL,
  `book_qty` int(11) NOT NULL,
  `book_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_carts`
--

INSERT INTO `tbl_carts` (`cart_id`, `buyer_id`, `book_id`, `seller_id`, `cart_qty`, `cart_status`, `cart_date`, `book_title`, `book_price`, `book_qty`, `book_status`) VALUES
(14, 3, 2, 3, 1, 0, '2024-01-14', '', 0, 0, ''),
(18, 3, 5, 3, 1, 0, '2024-01-14', '', 0, 0, ''),
(19, 3, 6, 3, 1, 0, '2024-01-14', '', 0, 0, ''),
(20, 3, 2, 3, 1, 0, '2024-01-14', '', 0, 0, '');

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
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
