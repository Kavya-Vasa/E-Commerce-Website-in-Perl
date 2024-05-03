-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2022 at 05:43 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_site`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `user_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(255) NOT NULL,
  `stock` int(255) NOT NULL,
  `url` varchar(2550) NOT NULL,
  `user_id` int(255) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `url`, `user_id`, `category`) VALUES
(1, 'A pink dress', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem cupiditate odit eligendi explicabo, nihil fugit laudantium quam, ipsum totam neque reiciendis ratione ipsam voluptatem at eaque rem aperiam dignissimos consectetur.', 2000, 10, 'https://img.freepik.com/free-photo/slender-girl-great-mood-is-having-fun-dancing-with-bag-her-hands-shot-italian-model-wrap-dress_197531-9980.jpg', 8, 'tending'),
(2, 'Smart Watch', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem cupiditate odit eligendi explicabo, nihil fugit laudantium quam, ipsum totam neque reiciendis ratione ipsam voluptatem at eaque rem aperiam dignissimos consectetur.', 5000, 200, 'https://img.freepik.com/free-psd/realistic-smart-watch-mockup_165789-538.jpg', 8, 'moat_popular'),
(3, 'Mens Shoes', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem cupiditate odit eligendi explicabo, nihil fugit laudantium quam, ipsum totam neque reiciendis ratione ipsam voluptatem at eaque rem aperiam dignissimos consectetur.', 1000, 250, 'https://img.freepik.com/free-photo/unbranded-modern-sporty-shoes-sneakers-white-isolated_120794-337.jpg', 8, 'new_arrival'),
(4, 'Perfume Spray', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem cupiditate odit eligendi explicabo, nihil fugit laudantium quam, ipsum totam neque reiciendis ratione ipsam voluptatem at eaque rem aperiam dignissimos consectetur.', 500, 50, 'https://img.freepik.com/free-psd/glass-perfume-spray-bottle-packaging-mockup_439185-6236.jpg', 8, 'new_arrival'),
(5, 'Mens blue pant', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem cupiditate odit eligendi explicabo, nihil fugit laudantium quam, ipsum totam neque reiciendis ratione ipsam voluptatem at eaque rem aperiam dignissimos consectetur.', 800, 70, 'https://img.freepik.com/free-photo/fashion-men-accessories-new-trendy-blue-jeans_1357-154.jpg?t=st=1651844204~exp=1651844804~hmac=42942c930fcffc623266b47a0a2bc5358be5506136c5f61c3b329d21d950952f&w=1060', 10, 'tending'),
(7, 'Dell Laptop', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem cupiditate odit eligendi explicabo, nihil fugit laudantium quam, ipsum totam neque reiciendis ratione ipsam voluptatem at eaque rem aperiam dignissimos consectetur.', 60000, 800, 'https://img.freepik.com/free-psd/laptop-black-screen-mockup-digital-device_53876-98738.jpg?t=st=1651842655~exp=1651843255~hmac=781db7ab70b4da59d8fad1ac9b40cafda0d8b9b0de275aea76be08755c285b7e&w=996', 10, 'moat_popular'),
(8, 'Smart Phone', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem cupiditate odit eligendi explicabo, nihil fugit laudantium quam, ipsum totam neque reiciendis ratione ipsam voluptatem at eaque rem aperiam dignissimos consectetur. Completed', 45000, 250, 'https://img.freepik.com/free-psd/shiny-smartphone-mockup_1310-814.jpg?t=st=1651844532~exp=1651845132~hmac=980b57456ac91586cf747697927272e35db26af0e9cb173a18ab4d47a0fe7739&w=1060', 10, 'moat_popular'),
(9, 'Sun Glasses', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem cupiditate odit eligendi explicabo, nihil fugit laudantium quam, ipsum totam neque reiciendis ratione ipsam voluptatem at eaque rem aperiam dignissimos consectetur.', 400, 60, 'https://img.freepik.com/free-photo/sunglasses-sand_1169-59.jpg?1&t=st=1651844340~exp=1651844940~hmac=d82d80f62f615135f99fe5d573a0cde62786c6fecc41dfe373fefdc264c11097&w=1380', 10, 'tending');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'some one esle ', 'hsvhsh@hjhjdf.commmm', 'hudvhied'),
(2, 'jsfjoij', 'jvnjs@Jdkd.com', 'hvudv'),
(3, 'temp user', 'temp@gmail.comft', 'hivjidj'),
(4, 'fhsuhfb', 'hivjh@Ihif.com', 'hvudhd'),
(5, 'fjdhih', 'hvidjh@Iidd.com', 'uudhvd'),
(6, 'vjijdfi', 'bijdiv@Iif.com', 'hudhdv'),
(7, 'dvdhihih', 'bvd@ihifv.com', 'gvudhvdv'),
(8, 'Varshil Shah', 'varshil.as@somaiya.edu', 'root'),
(10, 'Kavya Vasa', 'kavya.vasa@somaiya.edu', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `user_products`
--

CREATE TABLE `user_products` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `order_id` int(255) NOT NULL,
  `wishlist` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_products`
--
ALTER TABLE `user_products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_products`
--
ALTER TABLE `user_products`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
