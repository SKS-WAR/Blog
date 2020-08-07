-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Aug 07, 2020 at 09:03 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_08_04_190046_create_posts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 'new post', 'New post\'s body that has some body value.', NULL, NULL),
(2, 1, '2nd', 'New post\'s body that has some body value.', NULL, '2020-08-06 23:12:52'),
(3, 1, '3rd post', 'Thrird post body is this', '2020-08-05 05:01:35', '2020-08-05 05:01:35'),
(4, 2, '4rd post but by another acc', 'Bigggggg text', '2020-08-05 05:02:53', '2020-08-05 05:02:53'),
(5, 2, '5th post but by another acc', 'adsasdc weferg rtgb rtj hn djn dryh nfrht drstgh drt', '2020-08-05 05:10:13', '2020-08-05 05:10:13'),
(6, 2, '3rd post', 'adasdasda sd sd asd a', '2020-08-05 05:11:12', '2020-08-05 05:11:12'),
(7, 2, '3rd post', 'TEXT ONLY', '2020-08-05 06:33:03', '2020-08-05 06:38:27'),
(8, 2, '3rd post', 'UPDATED ONLY', '2020-08-05 06:33:24', '2020-08-05 06:38:19'),
(9, 2, '3rd post', 'UPDATED TEXT', '2020-08-05 06:33:35', '2020-08-05 06:38:11'),
(10, 1, '10rd post', 'fsdfsdfsafsdfsadfasdf', '2020-08-05 07:04:04', '2020-08-05 07:04:04'),
(11, 6, 'Hello', 'Hello WOrld.', '2020-08-06 06:43:41', '2020-08-06 06:43:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `batch`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'skswar', 'sahoosudeep2010@gmail.com', '2016', NULL, '$2y$10$S8cRMq2fCiK8Zf20.2wJHOUkuiWXjFpVkONyzzaC37mBOHe/7lJle', NULL, '2020-08-05 00:59:10', '2020-08-05 00:59:10'),
(2, 'SKS', 'spesina.infra@gmail.com', '2016', NULL, '$2y$10$GouxQZN/BorseCe135dIpu5zdwWxWekqBN88rqze1wEzVm/LE5Hse', NULL, '2020-08-05 01:51:31', '2020-08-05 01:51:31'),
(4, 'WAR', 'sahoidasddd@gmail.com', '2017', NULL, '$2y$10$QsgS1Ehdbd/8AT351BpcYuA02TNqFvbZLB2TYO9RGICcmSCIEBGGC', NULL, '2020-08-06 03:02:06', '2020-08-06 03:02:06'),
(5, '2017', 'sks@gmail.com', '2017', NULL, '$2y$10$vLEasROtORcv/dra0FtbSOoNXcPzIXSwSXsfKUIWxtQYsfRjs1ZN2', NULL, '2020-08-06 03:55:46', '2020-08-06 03:55:46'),
(6, '2017', 'sksks@gmail.com', '2016', NULL, '$2y$10$zFLmcjjQXNrxnv3B30cCwO64/d/4Z8sHJFJXvrKrX0ghrrJAaJmaW', NULL, '2020-08-06 03:57:34', '2020-08-06 03:57:34');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
