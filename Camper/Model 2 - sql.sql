-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2022 at 05:19 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `camper`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(6) NOT NULL,
  `campName` varchar(100) DEFAULT NULL,
  `participant` int(11) DEFAULT NULL,
  `dateFrom` date NOT NULL,
  `dateTo` date NOT NULL,
  `additional` varchar(100) DEFAULT NULL,
  `totalprice` double(9,2) DEFAULT NULL,
  `userID` int(6) NOT NULL,
  `campID` int(11) NOT NULL,
  `bookDate` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL DEFAULT 'Pending',
  `bookTime` time NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `campName`, `participant`, `dateFrom`, `dateTo`, `additional`, `totalprice`, `userID`, `campID`, `bookDate`, `status`, `bookTime`) VALUES
(100063, 'SMK Banggol Katong', 100, '2022-06-26', '2022-06-30', 'Firewoods, \nCharcoal, \nMedical Kit, \n', 5500.00, 100029, 3, '2022-06-26', 'Confirm', '02:25:57'),
(100064, 'SMK Banggol Katong', 100, '2022-07-05', '2022-06-30', 'Charcoal, \nMedical Kit, \n', 5500.00, 100029, 3, '2022-06-26', 'Confirm', '03:15:11'),
(100065, 'Family', 16, '2022-06-27', '2022-06-30', 'Firewoods, \nCharcoal, \nMedical Kit, \n', 880.00, 100029, 2, '2022-06-27', 'Confirm', '11:27:15'),
(100074, 'Solo', 4, '2022-06-29', '2022-07-08', 'Firewoods, \nCharcoal, \nMedical Kit, \n', 220.00, 100029, 1, '2022-06-28', 'Pending', '00:21:12'),
(100075, 'Family', 16, '2022-07-08', '2022-07-10', 'Medical Kit, \n', 880.00, 100029, 2, '2022-06-28', 'Pending', '00:34:58');

-- --------------------------------------------------------

--
-- Table structure for table `campground`
--

CREATE TABLE `campground` (
  `id` int(11) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `maxParticipant` int(11) DEFAULT NULL,
  `pricePerson` decimal(9,2) DEFAULT NULL,
  `maxTent` int(11) DEFAULT NULL,
  `priceTent` decimal(9,2) DEFAULT NULL,
  `campStatus` varchar(50) DEFAULT NULL,
  `hall` varchar(20) DEFAULT NULL,
  `package` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `campground`
--

INSERT INTO `campground` (`id`, `category`, `maxParticipant`, `pricePerson`, `maxTent`, `priceTent`, `campStatus`, `hall`, `package`) VALUES
(1, 'Solo/Couple', 4, '30.00', 2, '100.00', 'Available', 'No', '2 DAYS 1 NIGHT'),
(2, 'Family', 16, '30.00', 4, '100.00', 'Available', 'Yes', '3 DAYS 2 NIGHT'),
(3, 'School Campground', 100, '30.00', 25, '100.00', 'Available', 'Yes', '5 DAYS 4 NIGHT');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `cardNumber` longtext DEFAULT NULL,
  `expDate` varchar(10) DEFAULT NULL,
  `cvv` int(3) DEFAULT NULL,
  `nameCard` varchar(100) DEFAULT NULL,
  `userID` int(6) DEFAULT NULL,
  `bookID` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `cardNumber`, `expDate`, `cvv`, `nameCard`, `userID`, `bookID`) VALUES
(11, '5555 5555 5555 5555 ', '06/22', 232, 'Asyraf', 100029, 100063),
(12, '5555 5555 5555 5555 ', '06/22', 232, 'Asyraf', 100029, 100063),
(13, '5555 5555 5555 6546 ', '06/22', 232, 'Asyraf', 100029, 100063),
(14, '5555 5555 5555 6546 ', '06/22', 232, 'Asyraf', 100029, 100063),
(15, '1111 1111 1111 1111', '06/22', 232, 'Asyraf', 100029, 100064),
(16, '5555 5555 5555 5555', '02/33', 232, 'Asyraf', 100029, 100065),
(17, '5555 5555 5555 5555', '02/33', 232, 'Asyraf', 100029, 100065);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleID` int(11) NOT NULL,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleID`, `roleName`, `roleDesc`) VALUES
(1, 'Staff', 'Manage booking and customers'),
(2, 'Customer', 'Create booking');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(6) NOT NULL,
  `fName` varchar(50) DEFAULT NULL,
  `lName` varchar(50) DEFAULT NULL,
  `phoneNo` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `passwords` varchar(100) DEFAULT NULL,
  `roleID` int(11) DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fName`, `lName`, `phoneNo`, `email`, `passwords`, `roleID`) VALUES
(100029, 'Asyraf', 'Razali', '012-1234567', 'test@mail.com', '1234', 2),
(100030, 'Admin', 'Admin', '012-1234567', 'admin@mail.com', '1234', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PK_bookID` (`dateFrom`,`dateTo`,`userID`,`bookDate`),
  ADD KEY `fk_userID` (`userID`),
  ADD KEY `fk_campID` (`campID`);

--
-- Indexes for table `campground`
--
ALTER TABLE `campground`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `FK_bookID` (`bookID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_roleID` (`roleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100076;

--
-- AUTO_INCREMENT for table `campground`
--
ALTER TABLE `campground`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `roleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100031;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_campID` FOREIGN KEY (`campID`) REFERENCES `campground` (`id`),
  ADD CONSTRAINT `fk_userID` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_bookID` FOREIGN KEY (`bookID`) REFERENCES `booking` (`id`),
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_roleID` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
