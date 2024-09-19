-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2024 at 11:01 AM
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
-- Database: `quicklly`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` text NOT NULL,
  `service_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`, `service_id`, `created_at`, `updated_at`) VALUES
(1, 'Personal Occasions', './assets/images/icons/occassion.png', 1, '2024-09-18 10:13:43', '2024-09-18 10:13:43'),
(2, 'Marriage', './assets/images/icons/marriage.png', 1, '2024-09-18 10:13:43', '2024-09-18 10:13:43'),
(3, 'Paaths & Japs', './assets/images/icons/pathh.png', 1, '2024-09-18 11:40:21', '2024-09-18 11:40:21'),
(4, 'Corporate & Business', './assets/images/icons/corporate.png', 1, '2024-09-18 11:40:21', '2024-09-18 11:40:21'),
(5, 'Funneral', './assets/images/icons/funerral.png', 1, '2024-09-18 11:41:49', '2024-09-18 11:41:49'),
(6, 'Vastu', './assets/images/icons/vastu.png', 1, '2024-09-18 11:41:49', '2024-09-18 11:41:49'),
(9, 'Celebrations', './assets/images/icons/celebration.png', 1, '2024-09-18 11:43:32', '2024-09-18 11:43:32'),
(10, 'Birth Doshas', './assets/images/icons/birth.png', 1, '2024-09-18 11:43:32', '2024-09-18 11:43:32'),
(11, 'Festive', './assets/images/icons/festive.png', 1, '2024-09-18 11:45:03', '2024-09-18 11:45:03'),
(12, 'Nakshatra & Grah Shanti', './assets/images/icons/nakshatra.png', 1, '2024-09-18 11:45:03', '2024-09-18 11:45:03'),
(13, 'Peace & Prosperity', './assets/images/icons/peace.png', 1, '2024-09-18 11:46:53', '2024-09-18 11:46:53'),
(14, 'Mental Stress & Depression', './assets/images/icons/stress.png', 1, '2024-09-18 11:46:53', '2024-09-18 11:46:53'),
(15, 'Black Magic & Evil Eye', './assets/images/icons/black-magic.png', 1, '2024-09-18 11:56:54', '2024-09-18 11:56:54'),
(16, 'House & Property', './assets/images/icons/house.png', 1, '2024-09-18 11:56:54', '2024-09-18 11:56:54'),
(17, 'Money & Career', './assets/images/icons/money.png', 1, '2024-09-18 11:58:12', '2024-09-18 11:58:12'),
(18, 'Legal', './assets/images/icons/legal.png', 1, '2024-09-18 11:58:12', '2024-09-18 11:58:12'),
(19, 'Education', './assets/images/icons/education.png', 1, '2024-09-18 11:59:21', '2024-09-18 11:59:21'),
(20, 'Children', './assets/images/icons/children.png', 1, '2024-09-18 11:59:21', '2024-09-18 11:59:21'),
(23, 'Good Health', './assets/images/icons/health.png', 1, '2024-09-18 12:00:46', '2024-09-18 12:00:46'),
(24, 'Love & Relationship', './assets/images/icons/love.png', 1, '2024-09-18 12:00:46', '2024-09-18 12:00:46');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `image` text NOT NULL,
  `price_range` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `image`, `price_range`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Sindhurmani Rati kamdev puja', './assets/images/Rati-Kamdev-puja.png', '$130 - $140', 24, '2024-09-18 12:45:02', '2024-09-18 12:45:02'),
(2, 'Sindhurmani Rati manmadha pujan', './assets/images/Rati-Manmadha-Pujan.png', '$110 - $120', 24, '2024-09-18 12:48:12', '2024-09-18 12:48:12'),
(3, 'Sindhurmani Rati kamdev puja', './assets/images/Rati-Kamdev-puja.png', '$130 - $140', 24, '2024-09-19 07:21:43', '2024-09-19 07:21:43'),
(4, 'Ardhanarishvara Puja', './assets/images/ardhnarishvara-puja.png', '$130 - $140', 24, '2024-09-19 07:22:58', '2024-09-19 07:22:58'),
(5, 'Gauri Shankar puja', './assets/images/Gauri-Shankar-Puja.png', '$130 - $140', 24, '2024-09-19 07:24:04', '2024-09-19 07:24:04'),
(6, 'Mangal dosh nivaran puja', './assets/images/Mangal-dosh-nivaran-puja.png', '$110 - $120', 24, '2024-09-19 07:25:24', '2024-09-19 07:25:24'),
(7, 'Gayatri puja for famliy', './assets/images/Gayatri-Puja_for-family.png', '$130 - $140', 24, '2024-09-19 07:26:42', '2024-09-19 07:26:42'),
(8, 'Gayatri Puja for friends', './assets/images/Gayatri-Puja_for-family.png', '$130 - $140', 24, '2024-09-19 07:27:18', '2024-09-19 07:27:18'),
(9, 'Sarvashtak Shanti puja', './assets/images/Sharvastak-shanti-puja.png', '$130 - $140', 24, '2024-09-19 07:28:23', '2024-09-19 07:28:23'),
(10, 'Rahu Mantra Puja', './assets/images/Rahu-Mantra-Puja.png', '$130 - $140', 24, '2024-09-19 07:29:21', '2024-09-19 07:29:21');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Online Puja', './assets/images/online-puja.jpg', '2024-09-18 07:20:47', '2024-09-18 07:20:47'),
(2, 'Astrology', './assets/images/astrology.png', '2024-09-18 07:20:47', '2024-09-18 07:20:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_category_id` (`service_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_id` (`category_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `service_category_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `product_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
