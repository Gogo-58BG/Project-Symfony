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
  `authorId` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BFDD3168A196F9FD` (`authorId`),
  CONSTRAINT `FK_BFDD3168A196F9FD` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table blog_2019.articles: ~3 rows (approximately)
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`id`, `title`, `content`, `dateAdded`, `authorId`, `view_count`, `image`) VALUES
	(9, 'fyuo', 'ftyi76edfgh', '2019-07-18 11:31:29', 1, 37, '9f6a9c4b5607bbc98fee6e85229e24cc.jpeg'),
	(10, 'sdvgf', 'aewrfg', '2019-07-18 11:34:26', 1, 5, 'ed832588dd909c0b93cf779c0e132b8f.jpeg'),
	(12, 'new title', 'new content', '2019-07-30 15:03:16', 1, 4, '7eb7b5e06a10dc73ff588aea8a41e1c3.jpeg');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;

-- Dumping structure for table blog_2019.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dateAdded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5F9E962AF675F31B` (`author_id`),
  KEY `IDX_5F9E962A7294869C` (`article_id`),
  CONSTRAINT `FK_5F9E962A7294869C` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `FK_5F9E962AF675F31B` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table blog_2019.comments: ~3 rows (approximately)
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `author_id`, `article_id`, `content`, `dateAdded`) VALUES
	(1, 4, 9, 'first comment', '2019-08-06 09:36:35'),
	(2, 4, 10, 'second comment', '2019-08-06 10:49:30'),
	(3, 2, 9, 'comment from gosho', '2019-08-06 12:31:44');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- Dumping structure for table blog_2019.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dateAdded` datetime NOT NULL,
  `is_seen` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DB021E96F624B39D` (`sender_id`),
  KEY `IDX_DB021E96E92F8F78` (`recipient_id`),
  CONSTRAINT `FK_DB021E96E92F8F78` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_DB021E96F624B39D` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table blog_2019.messages: ~4 rows (approximately)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`id`, `sender_id`, `recipient_id`, `about`, `content`, `dateAdded`, `is_seen`) VALUES
	(1, 2, 4, 'Hi', 'from gosho', '2019-08-06 13:57:54', 1),
	(2, 1, 4, 'ops', '12321123', '2019-08-06 15:31:28', 1),
	(4, 4, 1, ':(((', ':((((((', '2019-08-07 09:43:51', 1),
	(7, 3, 2, 'Hi', '777777777777777', '2019-08-08 11:19:30', 0);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

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
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table blog_2019.users: ~5 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `password`, `fullName`, `image`) VALUES
	(1, 'pesho@abv.bg', '$2y$13$HUgLdmmhEUMeKHadvPReGeaj7uoxqjMN5XocqVZwEx3xzcOjJHsSC', 'Pesho', '8165e23b39e06207c480cbecd75bebad.png'),
	(2, 'gosho@abv.bg', '$2y$13$u4bsvUUQPE0QXeaqfbqK4uZDtyQKqM50JnCViw/T.PNH7WdfieUj.', 'Gosho', 'b946dfc17513eec0a9d767d15dea7ea6.png'),
	(3, 'gichka@abv.bg', '$2y$13$ICUuWEG97xpLIbcigz.CtuJcR5j1V6AwMc6OmcWDjDomfgr8y1bAG', 'Gichka', ''),
	(4, 'maria@abv.bg', '$2y$10$KtE/MyNNW7DNJVph/CFZb.w7vKB4ujIYrX0UTnJddCZTW76bIqQgm', 'Maria', ''),
	(5, 'argon@abv.bg', '$argon2i$v=19$m=1024,t=2,p=2$akY3dm1uLmpqQzRUUjl0Zw$hb5BCa3Q4Z7gDX/FIziEBKOTjEzM78Tv96K8/q7qKm4', 'Argon', '');
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
