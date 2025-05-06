-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2025 at 04:01 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `check_in_customers`
--

CREATE TABLE `check_in_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `room_number` int(11) NOT NULL,
  `room_type` varchar(100) NOT NULL,
  `check_out_time` varchar(100) NOT NULL,
  `check_out_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_form_table`
--

CREATE TABLE `hotel_form_table` (
  `transaction_id` int(11) NOT NULL,
  `customer_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_number` varchar(100) NOT NULL,
  `type_of_room` varchar(100) NOT NULL,
  `room_number` int(11) NOT NULL,
  `check_in_date` date NOT NULL,
  `check_in_time` time DEFAULT NULL,
  `check_out_date` date NOT NULL,
  `check_out_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel_form_table`
--

INSERT INTO `hotel_form_table` (`transaction_id`, `customer_id`, `name`, `contact_number`, `type_of_room`, `room_number`, `check_in_date`, `check_in_time`, `check_out_date`, `check_out_time`) VALUES
(1111, 'A04AJKL', 'Erza', '09481239328', 'Standard', 0, '2025-02-07', '00:00:00', '2025-02-08', '00:00:00'),
(1148, '123123123213123123', 'Ronalyn', '09481233282', 'Standard Room', 0, '2025-02-08', '20:05:00', '2025-02-15', '08:05:00'),
(1149, '1231', 'Mayen', '09481233282', 'Standard Room', 0, '2025-02-08', '20:08:00', '2025-02-01', '08:08:00'),
(1150, 'A04AJKL', 'Steven John', '09481239328', 'Deluxe', 0, '2025-02-08', '00:00:00', '2025-02-08', '00:00:00'),
(1151, 'A04AJKL', 'Steven John', '09481239328', 'Deluxe', 0, '2025-02-08', '00:00:00', '2025-02-08', '00:00:00'),
(1152, '141', 'LA', '09481233282', 'Standard Room', 0, '2025-02-01', '12:38:00', '2025-02-15', '00:38:00'),
(1153, '123123123213123123', 'Ronalyn', '09481233282', 'Deluxe Room', 2, '2025-03-16', '11:37:00', '2025-03-16', '23:37:00'),
(1154, '123123', 'Ronalyn', '09481233282', 'Standard Room', 5, '2025-03-16', '11:39:00', '2025-03-16', '23:39:00'),
(1155, '1231', 'Chelsea', '09481233282', 'Deluxe Room', 6, '2025-03-29', '10:00:00', '2025-03-30', '10:00:00'),
(1156, '123123', 'Ronalynn', '09481233282', 'Deluxe Room', 7, '2025-03-29', '10:04:00', '2025-03-30', '10:04:00'),
(1157, '1', 'Ronalyn', '09481233282', 'Standard Room', 2, '2025-03-29', '10:12:00', '2025-03-30', '10:12:00'),
(1158, '123123', 'Ronalyn', '09481233282', 'Standard Room', 2, '2025-03-29', '10:13:00', '2025-03-30', '10:13:00'),
(1159, '4', 'Mayen', '09481233282', 'Deluxe Room', 4, '2025-03-29', '10:15:00', '2025-03-30', '10:15:00'),
(1160, '4', 'Mayen', '09481233282', 'Standard Room', 9, '2025-03-29', '10:16:00', '2025-03-30', '10:16:00'),
(1161, '123123', 'Ronalyn', '09481233282', 'Deluxe Room', 1, '2025-03-29', '13:00:00', '2025-03-30', '12:00:00'),
(1162, '123123', 'Ronalyn', '09481233282', 'Deluxe Room', 1, '2025-03-29', '13:08:00', '2025-03-30', '12:00:00'),
(1163, '123123', 'Ronalyn', '09481233282', 'Standard Room', 1, '2025-03-29', '19:09:00', '2025-03-30', '18:09:00'),
(1164, '112', 'Mayen', '09481233282', 'Standard Room', 2, '2025-03-29', '19:23:00', '2025-03-30', '19:13:00'),
(1165, '1231', 'Ronalynn', '09481233282', 'Standard Room', 3, '2025-03-29', '19:24:00', '2025-03-30', '19:15:00'),
(1166, '123123123213123123', 'Erza', '09481233282', 'Deluxe Room', 4, '2025-03-29', '19:25:00', '2025-03-30', '19:07:00'),
(1167, '4', 'Zaeijan', '09481233282', 'Deluxe Room', 5, '2025-03-29', '19:26:00', '2025-03-30', '19:17:00'),
(1168, '112', 'Ronalyn', '09481233282', 'Standard Room', 1, '2025-03-29', '20:34:00', '2025-03-30', '20:02:00'),
(1169, '123123123213123123', 'Mayen', '09481233282', 'Deluxe Room', 2, '2025-03-29', '20:37:00', '2025-03-30', '20:20:00'),
(1170, '123123123213123123', 'Mayen', '09481233282', 'Standard Room', 3, '2025-03-29', '20:38:00', '2025-03-30', '20:11:00'),
(1171, '1', 'Zaeijan', '09481233282', 'Deluxe Room', 4, '2025-03-29', '20:38:00', '2025-03-30', '20:01:00'),
(1172, '112', 'asdasd', '09481233282', 'Deluxe Room', 5, '2025-03-29', '20:39:00', '2025-03-30', '08:39:00'),
(1173, '123123', 'Ronalyn', '09481233282', 'Standard Room', 1, '2025-03-30', '14:43:00', '2025-03-31', '14:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `ID` int(11) NOT NULL,
  `Overall_Ratings_Score` varchar(100) NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp(),
  `Hotel_Ratings` varchar(100) NOT NULL,
  `Service_Ratings` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`ID`, `Overall_Ratings_Score`, `Date`, `Hotel_Ratings`, `Service_Ratings`) VALUES
(4, '80%', '2025-02-10 23:50:47', '', ''),
(5, '40%', '2025-02-10 23:51:15', '', ''),
(6, '40%', '2025-02-11 08:12:21', '', ''),
(7, '70%', '2025-02-11 10:05:39', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `status`) VALUES
(1, 'Available'),
(2, 'Used'),
(3, 'Reserved'),
(4, 'Available'),
(5, 'Available'),
(6, 'Available'),
(7, 'Available'),
(8, 'Available'),
(9, 'Available'),
(10, 'Available'),
(11, 'Used'),
(12, 'Available'),
(13, 'Available'),
(14, 'Available'),
(15, 'Available'),
(16, 'Available'),
(17, 'Available'),
(18, 'Available'),
(19, 'Available'),
(20, 'Available');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cardpayment`
--
ALTER TABLE `cardpayment`
  ADD PRIMARY KEY (`Card_Transaction_ID`);

--
-- Indexes for table `cash_payment`
--
ALTER TABLE `cash_payment`
  ADD PRIMARY KEY (`Transaction_Number`);

--
-- Indexes for table `check_in_customers`
--
ALTER TABLE `check_in_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_form_table`
--
ALTER TABLE `hotel_form_table`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cardpayment`
--
ALTER TABLE `cardpayment`
  MODIFY `Card_Transaction_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1119;

--
-- AUTO_INCREMENT for table `cash_payment`
--
ALTER TABLE `cash_payment`
  MODIFY `Transaction_Number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1123;

--
-- AUTO_INCREMENT for table `check_in_customers`
--
ALTER TABLE `check_in_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `hotel_form_table`
--
ALTER TABLE `hotel_form_table`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1174;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
