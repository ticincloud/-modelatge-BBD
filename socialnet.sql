-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for ita_socialnet
CREATE DATABASE IF NOT EXISTS `ita_socialnet` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ita_socialnet`;

-- Dumping structure for table ita_socialnet.knowledge
CREATE TABLE IF NOT EXISTS `knowledge` (
  `id_knowledge` int(11) NOT NULL,
  `id_user_1` int(11) DEFAULT NULL,
  `id_user_2` int(11) DEFAULT NULL,
  `knowledge` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_knowledge`),
  UNIQUE KEY `id_knowledge` (`id_knowledge`),
  KEY `user1_knowledge` (`id_user_1`),
  KEY `user2_knowledge` (`id_user_2`),
  CONSTRAINT `user1_knowledge` FOREIGN KEY (`id_user_1`) REFERENCES `user` (`id_user`),
  CONSTRAINT `user2_knowledge` FOREIGN KEY (`id_user_2`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_socialnet.knowledge: ~1 rows (approximately)
/*!40000 ALTER TABLE `knowledge` DISABLE KEYS */;
INSERT INTO `knowledge` (`id_knowledge`, `id_user_1`, `id_user_2`, `knowledge`) VALUES
	(1, 1, 2, 'curs fotografia');
/*!40000 ALTER TABLE `knowledge` ENABLE KEYS */;

-- Dumping structure for table ita_socialnet.photo
CREATE TABLE IF NOT EXISTS `photo` (
  `id_photo` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id_photo`),
  UNIQUE KEY `id_photo` (`id_photo`),
  KEY `user_photo` (`id_user`),
  CONSTRAINT `user_photo` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_socialnet.photo: ~1 rows (approximately)
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` (`id_photo`, `id_user`, `address`, `url`) VALUES
	(1, 1, 'address photo 1', 'https:\\\\photouser.com\\1\\1');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;

-- Dumping structure for table ita_socialnet.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_socialnet.user: ~2 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id_user`, `name`, `email`, `password`) VALUES
	(1, 'user 1', 'user1@user.com', 'pass1'),
	(2, 'user 2', 'user2@user.com', 'pass2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
