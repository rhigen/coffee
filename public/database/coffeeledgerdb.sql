-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 26, 2024 at 02:32 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffeeledgerdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminusers`
--

CREATE TABLE `adminusers` (
  `user_id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `role` varchar(150) NOT NULL,
  `Created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `adminusers`
--

INSERT INTO `adminusers` (`user_id`, `name`, `username`, `password`, `role`, `Created_at`) VALUES
(1, 'Nicolle Gutierrez', 'Nicsxx', '$2y$10$qm6j/rt7ysX9Wuvij/7PPurE8uTwB4FVzPhKkXOgJ9Jj/djDxu8sm', 'Staff', '2024-01-23 09:25:56'),
(2, 'Aldrich Gutierrez', 'aldrich', '$2y$10$nxpBG6XtB5XNrA4a.3rXY.PT.y5./mrc/iV5fsoyqSK8Sk75IP54G', 'Admin', '2024-01-25 12:45:40');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `complaintID` int NOT NULL,
  `Complaint` varchar(150) NOT NULL,
  `CustomerID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Ratings` int NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int NOT NULL,
  `FullName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `file` varchar(259) NOT NULL,
  `email` varchar(150) NOT NULL,
  `ContactNo` bigint NOT NULL,
  `gender` varchar(150) NOT NULL,
  `age` int NOT NULL,
  `address` varchar(150) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` int NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `EmployeeType` varchar(150) NOT NULL,
  `ContactNo` int NOT NULL,
  `email` varchar(150) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `idNumber` int NOT NULL,
  `IDType` varchar(150) NOT NULL,
  `EmployeeSchedule` datetime NOT NULL,
  `EmployeeSalary` double(10,2) NOT NULL,
  `EmployeeStatus` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `orderID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `empID` int NOT NULL,
  `ProductID` int NOT NULL,
  `paymentStatus` text NOT NULL,
  `orderType` text NOT NULL,
  `orderDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalPrice` double(10,2) NOT NULL,
  `Quantity` int NOT NULL,
  `requiredDate` datetime NOT NULL,
  `shippDate` datetime NOT NULL,
  `orderStatus` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `order_detail_id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`order_detail_id`, `order_id`, `product_id`, `quantity`, `price`, `subtotal`) VALUES
(8, 5, 4, 2, '2.75', '5.50'),
(7, 5, 1, 1, '12.50', '12.50'),
(6, 4, 3, 1, '3.50', '3.50'),
(5, 4, 1, 2, '12.50', '25.00'),
(4, 3, 4, 1, '2.75', '2.75'),
(3, 2, 2, 3, '14.22', '42.66'),
(2, 1, 3, 1, '3.50', '3.50'),
(1, 1, 1, 2, '12.50', '25.00'),
(9, 6, 3, 2, '3.50', '7.00'),
(10, 6, 2, 1, '14.22', '14.22'),
(11, 7, 1, 1, '12.50', '12.50'),
(12, 7, 3, 1, '3.50', '3.50'),
(97, 8, 2, 2, '14.22', '28.44'),
(98, 8, 3, 1, '3.50', '3.50'),
(99, 9, 1, 2, '12.50', '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `product_tbl`
--

CREATE TABLE `product_tbl` (
  `prod_id` int NOT NULL,
  `prod_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prod_quantity` int NOT NULL,
  `prod_mprice` decimal(10,2) NOT NULL,
  `prod_lprice` double(10,2) NOT NULL,
  `prod_categ` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prod_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_tbl`
--

INSERT INTO `product_tbl` (`prod_id`, `prod_name`, `prod_quantity`, `prod_mprice`, `prod_lprice`, `prod_categ`, `prod_code`) VALUES
(1, 'Quesadillas', 50, '160.00', 0.00, 'Appetizer', '00001'),
(2, 'Nachos', 4, '120.00', 0.00, 'Appetizer', '121212121'),
(3, 'Fries', 8, '120.00', 0.00, 'Appetizer', '8'),
(4, 'Fried Chicken w/ Gravy', 5, '148.00', 0.00, 'Meals', '00777'),
(5, 'Honey', 6, '155.00', 0.00, 'Meals', '3'),
(6, 'Orange Chicken', 5, '155.00', 0.00, 'Meals', '8'),
(7, 'Burger Steak', 9, '160.00', 0.00, 'Meals', '8'),
(8, 'Sizzling Pepper Beef Steak', 7, '165.00', 0.00, 'Meals', '3'),
(9, 'Beef Tapa', 1, '128.00', 0.00, 'Meals', '1'),
(10, 'Crispy Lechon Sisig', 2, '165.00', 0.00, 'Meals', '9'),
(11, 'Lechon Kawali', 1, '148.00', 0.00, 'Meals', '1'),
(12, 'Bacon and Egg', 1, '155.00', 0.00, 'Meals', '1'),
(13, 'Spam and Egg', 1, '115.00', 0.00, 'Meals', '1'),
(14, 'Beef Bulgogi', 1, '168.00', 0.00, 'Meals', '1'),
(15, 'Korean Beef Stew', 1, '188.00', 0.00, 'Meals', '1'),
(16, 'Chicken Parmegiana', 1, '168.00', 0.00, 'Meals', '1'),
(17, 'Carbonara', 1, '170.00', 0.00, 'Pasta', '10121'),
(18, 'Classic Spaghetti', 1, '170.00', 0.00, 'Pasta', '1'),
(19, 'Truffle Pasta', 1, '170.00', 0.00, 'Pasta', '1'),
(20, 'Chicken Alfrado', 1, '170.00', 0.00, 'Pasta', '1'),
(21, 'Tuna Pesto', 1, '170.00', 0.00, 'Pasta', '1'),
(22, 'Parmegiana Meatball', 1, '190.00', 0.00, 'Pasta', '1'),
(30, 'Classic Ceasar', 1, '180.00', 0.00, 'Salad', '1'),
(31, 'Chef Salad', 1, '180.00', 0.00, 'Salad', '1'),
(32, 'Chicken Salad', 1, '180.00', 0.00, 'Salad', '1'),
(33, 'Tuna Salad', 1, '180.00', 0.00, 'Salad', '1'),
(34, 'Mushroom Soup', 12, '150.00', 0.00, 'Soup', '128212'),
(35, 'Crab and Corn', 1, '150.00', 0.00, 'Soup', '1'),
(36, 'Pumpkin Soup', 1, '150.00', 0.00, 'Soup', '1'),
(37, 'Beef Bulgogi', 10, '160.00', 0.00, 'Others', '1'),
(38, 'Pork BBQ Teriyaki', 1, '180.00', 0.00, 'Others', '1'),
(39, 'Smoke Beef and Cheese Brisket', 1, '250.00', 0.00, 'Others', '1'),
(40, 'Meat Balls', 1, '200.00', 0.00, 'Others', '1'),
(41, 'Cheesy Egg', 1, '140.00', 0.00, 'Others', '1'),
(42, 'Cheese Pepperoni', 1, '180.00', 0.00, 'Others', '1'),
(43, 'Vanilla', 10, '145.00', 160.00, 'Coffee Frappe', '102012'),
(44, 'Mocha', 13, '145.00', 160.00, 'Coffee Frappe', '1237'),
(45, 'Caramel', 7, '150.00', 165.00, 'Coffee Frappe', '19199'),
(46, 'Cookies and Cream', 15, '165.00', 180.00, 'Coffee Frappe', '1636'),
(47, 'Hazel Nut', 14, '150.00', 165.00, 'Coffee Frappe', '1325'),
(48, 'Java Chip', 32, '155.00', 170.00, 'Coffee Frappe', '131424'),
(49, 'Salted Caramel', 16, '155.00', 170.00, 'Coffee Frappe', '1212'),
(50, 'Vanilla Latte', 18, '140.00', 150.00, 'Flavored Coffee', '123'),
(51, 'Mocha Latte', 12, '140.00', 155.00, 'Flavored Coffee', '213'),
(52, 'Caramel Latte', 45, '145.00', 180.00, 'Flavored Coffee', '1245'),
(53, 'Cookies and Cream', 13, '150.00', 170.00, 'Flavored Coffee', '32422'),
(54, 'Spanish Latte', 23, '140.00', 155.00, 'Flavored Coffee', '61361'),
(55, 'Brewed Coffee', 23, '45.00', 0.00, 'Hot Coffee', '0027'),
(56, 'Espresso', 34, '40.00', 55.00, 'Hot Coffee', '1213'),
(57, 'Capuccino', 24, '80.00', 90.00, 'Hot Coffee', 'q7275'),
(58, 'Caphe Vietnam', 23, '80.00', 0.00, 'Hot Coffee', '43'),
(59, 'Americano', 21, '80.00', 100.00, 'Hot Coffee', '213'),
(60, 'Caffe Latte', 32, '90.00', 100.00, 'Hot Coffee', '13'),
(61, 'Vanilla Latte', 25, '90.00', 100.00, 'Hot Coffee', '1213'),
(62, 'Mocha Latte', 12, '90.00', 100.00, 'Hot Coffee', '123'),
(63, 'Caramel Latte', 1, '95.00', 105.00, 'Hot Coffee', '1265'),
(64, 'Spanish Latte', 18, '90.00', 100.00, 'Hot Coffee', '123'),
(65, 'Americano', 12, '90.00', 0.00, 'Iced Coffee', '1010'),
(66, 'Caphe Vietnam', 23, '120.00', 0.00, 'Iced Coffee', '1'),
(67, 'Caffe Latte', 12, '130.00', 140.00, 'Iced Coffee', '21'),
(68, 'Vanilla', 12, '140.00', 155.00, 'Non Coffee Frappe', '2'),
(69, 'Mocha', 12, '140.00', 155.00, 'Non Coffee Frappe', '1'),
(70, 'Caramel', 20, '140.00', 155.00, 'Non Coffee Frappe', '12'),
(71, 'Cookies and Cream', 23, '150.00', 175.00, 'Non Coffee Frappe', '1'),
(72, 'Hazel Nut', 23, '150.00', 165.00, 'Non Coffee Frappe', '1'),
(73, 'Java Chip', 12, '150.00', 175.00, 'Non Coffee Frappe', '12'),
(74, 'Salted Caramel', 1, '150.00', 165.00, 'Non Coffee Frappe', '12'),
(75, 'Taro Cream Cheese', 24, '150.00', 165.00, 'Non Coffee Frappe', '12'),
(76, 'Double Dutch', 34, '150.00', 165.00, 'Non Coffee Frappe', '1'),
(79, 'lasagna', 12, '80.00', 0.00, 'Pasta', '101010');

-- --------------------------------------------------------

--
-- Table structure for table `tablereservation`
--

CREATE TABLE `tablereservation` (
  `TableID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `productID` int NOT NULL,
  `emplpyeeID` int NOT NULL,
  `totalPayment` double(10,2) NOT NULL,
  `TableCategory` varchar(150) NOT NULL,
  `TableType` int NOT NULL,
  `paymentStatus` varchar(150) NOT NULL,
  `reservationDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` double(10,2) NOT NULL,
  `amount_paid` double(10,2) NOT NULL,
  `change_amount` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`order_id`, `user_id`, `order_date`, `total_amount`, `amount_paid`, `change_amount`) VALUES
(1, 1, '2023-07-01 01:30:00', 25.50, 30.00, 4.50),
(2, 2, '2023-07-02 07:45:00', 42.75, 50.00, 7.25),
(3, 3, '2023-07-03 03:20:00', 17.25, 20.00, 2.75),
(4, 4, '2023-07-04 10:15:00', 28.75, 30.00, 1.25),
(5, 5, '2023-07-05 04:00:00', 18.25, 20.00, 1.75),
(6, 6, '2023-07-06 06:30:00', 32.50, 40.00, 7.50),
(7, 7, '2023-07-07 02:15:00', 9.25, 10.00, 0.75),
(8, 8, '2023-07-09 23:25:35', 31.94, 40.00, 8.06),
(9, 9, '2023-07-09 23:25:59', 25.00, 30.00, 5.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminusers`
--
ALTER TABLE `adminusers`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`complaintID`),
  ADD KEY `CustomerID` (`CustomerID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `CustomerID` (`CustomerID`,`empID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `ProductID_2` (`ProductID`),
  ADD KEY `empID` (`empID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD UNIQUE KEY `order_id` (`order_id`,`product_id`);

--
-- Indexes for table `product_tbl`
--
ALTER TABLE `product_tbl`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `tablereservation`
--
ALTER TABLE `tablereservation`
  ADD PRIMARY KEY (`TableID`),
  ADD KEY `CustomerID` (`CustomerID`,`productID`),
  ADD KEY `productID` (`productID`),
  ADD KEY `emplpyeeID` (`emplpyeeID`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminusers`
--
ALTER TABLE `adminusers`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `complaintID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EmployeeID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `orderID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `order_detail_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `product_tbl`
--
ALTER TABLE `product_tbl`
  MODIFY `prod_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `tablereservation`
--
ALTER TABLE `tablereservation`
  MODIFY `TableID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product_tbl` (`prod_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`empID`) REFERENCES `employee` (`EmployeeID`) ON UPDATE RESTRICT;

--
-- Constraints for table `tablereservation`
--
ALTER TABLE `tablereservation`
  ADD CONSTRAINT `tablereservation_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tablereservation_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product_tbl` (`prod_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tablereservation_ibfk_3` FOREIGN KEY (`emplpyeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD CONSTRAINT `tbl_orders_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `product_tbl` (`prod_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
