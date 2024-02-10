-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 10, 2024 at 10:15 AM
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
-- Table structure for table `tbl_books`
--

CREATE TABLE `tbl_books` (
  `book_id` int(5) NOT NULL,
  `seller_id` varchar(5) NOT NULL,
  `book_isbn` varchar(17) NOT NULL,
  `book_title` varchar(200) NOT NULL,
  `book_desc` varchar(2000) NOT NULL,
  `book_author` varchar(100) NOT NULL,
  `book_price` decimal(6,2) NOT NULL,
  `book_qty` int(5) NOT NULL,
  `book_status` varchar(10) NOT NULL,
  `book_date` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_books`
--

INSERT INTO `tbl_books` (`book_id`, `seller_id`, `book_isbn`, `book_title`, `book_desc`, `book_author`, `book_price`, `book_qty`, `book_status`, `book_date`) VALUES
(1, '3', '978-0-7475-3269-9', 'Harry Potter and the Philosopher\'s Stone', 'Harry makes close friends and a few enemies during his first year at the school and with the help of his friends, Ron Weasley and Hermione Granger, he faces an attempted comeback by the dark wizard Lord Voldemort, who killed Harry\'s parents, but failed to kill Harry when he was just 15 months old.', 'J.K. Rowling', 200.00, 0, 'Used', '2023-11-27 09:27:18.289638'),
(2, '3', '978-0-439-35548-4', 'The Lord of the Rings', 'One Ring to rule them all, One Ring to find them, One Ring to bring them all, and in the darkness bind them.', 'J.R.R. Tolkien', 500.00, 1, 'Used', '2023-11-27 09:58:52.975503'),
(3, '3', '978-0-316-06529-2', 'The Hitchhiker\'s Guide to the Galaxy', 'Don\'t Panic!', 'Douglas Adams', 250.00, 0, 'Used', '2023-11-27 09:58:52.975503'),
(4, '3', '978-0-099-54281-9', 'Pride and Prejudice', 'It is a truth universally acknowledged, that a single man in possession of a good fortune, must be in want of a wife.', 'Jane Austen', 250.00, 0, 'New', '2023-11-27 09:58:52.975503'),
(5, '3', '978-0-141-00807-0', 'To Kill a Mockingbird', 'In the sleepy town of Maycomb, Alabama, during the 1930s, Scout Finch, a young girl, experiences racial injustice and defends her father, a lawyer defending a black man accused of raping a white woman.', 'Harper Lee', 300.00, 2, 'Used', '2023-11-27 09:58:52.975503'),
(6, '3', '978-0-8052-1128-9', 'The Catcher in the Rye', 'Holden Caulfield is a troubled teenager who is expelled from his boarding school and wanders around New York City, disillusioned with the world around him.', 'J.D. Salinger', 250.00, 0, 'Used', '2023-11-27 09:58:52.975503'),
(7, '3', '978-0-143-03513-8', 'Animal Farm', 'The animals of Manor Farm overthrow their human owners and establish a utopian society, but their ideals are soon corrupted by power and greed.', 'George Orwell', 500.00, 3, 'New', '2023-11-27 09:58:52.975503'),
(8, '3', '978-0-316-06273-0', 'The Great Gatsby', 'The mysterious millionaire Jay Gatsby throws lavish parties in his mansion, hoping to win back his lost love, Daisy Buchanan.', 'F. Scott Fitzgerald', 450.00, 1, 'Used', '2023-11-27 09:58:52.975503'),
(10, '3', '978-0-316-00613-9', 'The Handmaid\'s Tale', 'Offred, a woman forced into sexual servitude, recounts her life in a totalitarian society where women are valued only for their reproductive abilities.', 'Margaret Atwood', 350.00, 2, 'Used', '2023-11-27 09:58:52.975503'),
(11, '3', '978-0-743-29803-2', 'The Thirteenth Tale: A Novel Paperback', 'Reclusive author Vida Winter, famous for her collection of twelve enchanting stories, has spent the past six decades penning a series of alternate lives for herself. ', 'Diane Settlefield', 60.00, 1, 'Used', '2023-11-27 12:46:47.046814'),
(12, '3', '978-0-06-130362-7', 'And Then There Were None', 'Ten strangers are invited to an isolated island and are systematically murdered, one by one. The murderer is among them, but who is it?', 'Agatha Christie', 300.00, 1, 'Used', '2023-11-29 12:06:34.096621'),
(13, '3', '0-399-12321-5', 'Murder on the Orient Express', 'Hercule Poirot is on board the luxurious Orient Express when a murder occurs. He must use his detective skills to solve the case and bring the murderer to justice.', 'Agatha Christie', 350.00, 0, 'Used', '2023-11-29 12:06:34.096621'),
(14, '3', '0-06-092798-7', 'The Hound of the Baskervilles', 'Sherlock Holmes and his partner Dr. Watson investigate a series of strange and deadly events on the moors of Dartmoor.', 'Arthur Conan Doyle', 280.00, 1, 'New', '2023-11-29 12:06:34.096621'),
(15, '3', '0-7475-6320-6', 'The Adventures of Sherlock Holmes', 'A collection of twelve short stories featuring the brilliant detective Sherlock Holmes and his trusted companion Dr. Watson.', 'Arthur Conan Doyle', 400.00, 1, 'New', '2023-11-29 12:06:34.096621'),
(16, '3', '0-14-194949-5', 'The Maltese Falcon', 'Sam Spade, a private investigator in San Francisco, is hired to find a priceless jeweled falcon, but he soon finds himself entangled in a web of deceit and murder.', 'Dashiell Hammett', 320.00, 1, 'Used', '2023-11-29 12:06:34.096621'),
(17, '3', '0-394-55808-X', 'The Big Sleep', 'Raymond Chandler\'s classic detective novel follows Philip Marlowe, a private investigator, as he investigates the mysterious disappearance of a wealthy man\'s daughter.', 'Raymond Chandler', 350.00, 2, 'New', '2023-11-29 12:06:34.096621'),
(18, '3', '0-316-32223-X', 'In Cold Blood', 'Truman Capote\'s non-fiction novel recounts the real-life murder of a wealthy farm family in Kansas and the subsequent trial and execution of the killers.', 'Truman Capote', 400.00, 1, 'Used', '2023-11-29 12:06:34.096621'),
(20, '3', '0-399-12327-3', 'The Postman Always Rings Twice', 'Frank Chambers, a drifter, falls in love with Cora Knapp, a married diner waitress. Together, they plot to kill Cora\'s husband and collect the insurance money.', 'James M. Cain', 300.00, 1, 'Used', '2023-11-29 12:06:34.096621');

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(6) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_pass` varchar(40) NOT NULL,
  `user_datereg` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `user_phone` varchar(12) NOT NULL,
  `user_address` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_email`, `user_pass`, `user_datereg`, `user_phone`, `user_address`) VALUES
(1, 'Anis', 'anis@gmail.com', 'cf8af373300cd679b5e7facc2bfde6af57924ea8', '2023-12-08 05:11:29.500062', '010-2345678', '82A westgold LA'),
(2, 'amirah', 'amirah@gmail.com', 'c644531cef6545c768e1ab2ab7e7462ee2bd3a5f', '2023-12-10 01:09:45.779759', '', ''),
(3, 'aiman', 'tan@gmail.com', '389eee98c817d676afded558cdcfae03465504df', '2024-01-13 08:34:47.309636', '012-324567', '82 Linnmore Drive, Manchester CT 06040');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_carts`
--
ALTER TABLE `tbl_carts`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_carts`
--
ALTER TABLE `tbl_carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `order_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
