-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2025 at 04:07 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `cash_payment`
--

CREATE TABLE `cash_payment` (
  `Cashier` varchar(100) DEFAULT NULL,
  `Transaction_Number` int(11) NOT NULL,
  `Customer_Name` varchar(100) DEFAULT NULL,
  `Room_Type` varchar(100) DEFAULT NULL,
  `Room_Quantity` int(11) DEFAULT NULL,
  `Room_Price` bigint(20) DEFAULT NULL,
  `total` bigint(20) NOT NULL,
  `Amount` bigint(20) DEFAULT NULL,
  `Changes` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cash_payment`
--

INSERT INTO `cash_payment` (`Cashier`, `Transaction_Number`, `Customer_Name`, `Room_Type`, `Room_Quantity`, `Room_Price`, `total`, `Amount`, `Changes`) VALUES
('Jaybe', 1111, 'Erza', 'Deluxe', 1, 20000, 20000, 50000, 30000),
('Jaybe', 1112, 'Erza', 'Deluxe', 1, 20000, 20000, 50000, 30000),
('Mayen', 1113, 'Ronalyn Barsicula', 'Standard', 2, 20000, 40000, 50000, 10000),
('Ronalyn', 1114, 'Mayen', '', 1, 15000, 15000, 21000, 6000),
('Juvia', 1115, 'Gray', '', 1, 15000, 15000, 35000, 20000),
('asdsad', 1116, 'sdasd', '', 2, 15000, 30000, 100000, 70000),
('asdasd', 1117, 'asdasd', '', 2, 20000, 40000, 50000, 10000),
('adas', 1118, 'sdasda', 'Standard', 2, 15000, 30000, 50000, 20000),
('asd', 1119, 'asdasd', 'Standard', 2, 15000, 30000, 50000, 20000),
('Natsu', 1120, 'asdas', 'Deluxe', 2, 20000, 40000, 50000, 10000),
('asdas', 1121, 'Erza', 'Deluxe', 1, 20000, 20000, 30000, 10000),
('Fea', 1122, 'Ishi', 'Standard', 2, 15000, 30000, 30000, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cash_payment`
--
ALTER TABLE `cash_payment`
  ADD PRIMARY KEY (`Transaction_Number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cash_payment`
--
ALTER TABLE `cash_payment`
  MODIFY `Transaction_Number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1123;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
