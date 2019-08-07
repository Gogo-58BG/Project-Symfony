-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.15-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for blog_2019
CREATE DATABASE IF NOT EXISTS `blog_2019` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `blog_2019`;

-- Dumping structure for table blog_2019.articles
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dateAdded` datetime NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `view_count` int(11) NOT NULL,
  `image_url` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BFDD3168A196F9FD` (`authorId`),
  CONSTRAINT `FK_BFDD3168A196F9FD` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table blog_2019.articles: ~11 rows (approximately)
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`id`, `title`, `content`, `dateAdded`, `authorId`, `view_count`, `image_url`) VALUES
	(1, 'some title - edited', 'some content - edited', '2019-07-15 14:33:31', 2, 1, ''),
	(2, 'second article', 'second content', '2019-07-15 14:42:58', 2, 2, ''),
	(3, 'third title', 'third contend', '2019-07-15 14:44:28', 2, 0, ''),
	(4, 'Article from Pesho', 'Pesho`s content', '2019-07-15 15:27:04', 1, 0, ''),
	(5, '99999999999', '999999999999999-10', '2019-07-17 09:35:29', 1, 0, ''),
	(6, 'Test url', 'testing url', '2019-07-18 10:19:35', 1, 9, 'https://images.pexels.com/photos/257360/pexels-photo-257360.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
	(7, 'date test', 'date test', '2019-07-18 10:59:16', 1, 2, 'data:image/jpeg;base64,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'),
	(8, 'test flash', 'test flash', '2019-07-18 11:27:24', 1, 0, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Bachalpsee_reflection.jpg/250px-Bachalpsee_reflection.jpg'),
	(9, 'fyuo', 'ftyi76edfgh', '2019-07-18 11:31:29', 1, 0, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Bachalpsee_reflection.jpg/250px-Bachalpsee_reflection.jpg'),
	(10, 'sdvgf', 'aewrfg', '2019-07-18 11:34:26', 1, 0, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Bachalpsee_reflection.jpg/250px-Bachalpsee_reflection.jpg'),
	(11, '123546', '456123', '2019-07-18 11:38:22', 1, 1, '456');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;

-- Dumping structure for table blog_2019.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B63E2EC75E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table blog_2019.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`) VALUES
	(2, 'ROLE_ADMIN'),
	(1, 'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table blog_2019.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table blog_2019.users: ~5 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `password`, `fullName`) VALUES
	(1, 'pesho@abv.bg', '$2y$13$HUgLdmmhEUMeKHadvPReGeaj7uoxqjMN5XocqVZwEx3xzcOjJHsSC', 'Pesho'),
	(2, 'gosho@abv.bg', '$2y$13$u4bsvUUQPE0QXeaqfbqK4uZDtyQKqM50JnCViw/T.PNH7WdfieUj.', 'Gosho'),
	(3, 'gichka@abv.bg', '$2y$13$ICUuWEG97xpLIbcigz.CtuJcR5j1V6AwMc6OmcWDjDomfgr8y1bAG', 'Gichka'),
	(4, 'maria@abv.bg', '$2y$10$KtE/MyNNW7DNJVph/CFZb.w7vKB4ujIYrX0UTnJddCZTW76bIqQgm', 'Maria'),
	(5, 'argon@abv.bg', '$argon2i$v=19$m=1024,t=2,p=2$akY3dm1uLmpqQzRUUjl0Zw$hb5BCa3Q4Z7gDX/FIziEBKOTjEzM78Tv96K8/q7qKm4', 'Argon');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table blog_2019.users_roles
CREATE TABLE IF NOT EXISTS `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `IDX_51498A8EA76ED395` (`user_id`),
  KEY `IDX_51498A8ED60322AC` (`role_id`),
  CONSTRAINT `FK_51498A8EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_51498A8ED60322AC` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table blog_2019.users_roles: ~6 rows (approximately)
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(3, 2),
	(4, 1),
	(5, 1);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
