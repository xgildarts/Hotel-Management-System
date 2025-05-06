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
-- Table structure for table `cardpayment`
--

CREATE TABLE `cardpayment` (
  `Card_Transaction_ID` int(11) NOT NULL,
  `Card_Holder_Name` varchar(100) DEFAULT NULL,
  `Card_Number` varchar(100) DEFAULT NULL,
  `Type_of_Room` varchar(100) DEFAULT NULL,
  `Room_Quantity` int(11) DEFAULT NULL,
  `Room_Price` bigint(20) DEFAULT NULL,
  `total` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cardpayment`
--

INSERT INTO `cardpayment` (`Card_Transaction_ID`, `Card_Holder_Name`, `Card_Number`, `Type_of_Room`, `Room_Quantity`, `Room_Price`, `total`) VALUES
(1111, 'Ronalyn', 'A0ZJHKLSDSD2', 'Deluxe', 2, 15000, 30000),
(1112, '1112', 'Erza', 'Deluxe', 1, 20000, 20000),
(1113, 'asdas', 'asdasdasd', 'Standard', 2, 20000, 40000),
(1114, 'Mayen', 'A0ZJHKSK', 'Standard', 3, 20000, 60000),
(1115, 'Steven', 'asdasdas', 'Deluxe', 1, 20000, 20000),
(1116, 'Natsu', 'asdsadsad', 'Deluxe', 3, 20000, 60000),
(1117, 'Krei', 'asdasdas', 'Deluxe', 2, 20000, 40000),
(1118, 'Kirito', 'ASD0948132AS', 'Deluxe', 2, 20000, 40000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cardpayment`
--
ALTER TABLE `cardpayment`
  ADD PRIMARY KEY (`Card_Transaction_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cardpayment`
--
ALTER TABLE `cardpayment`
  MODIFY `Card_Transaction_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1119;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
