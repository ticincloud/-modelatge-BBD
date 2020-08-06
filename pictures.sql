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


-- Dumping database structure for ita_pictures
CREATE DATABASE IF NOT EXISTS `ita_pictures` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ita_pictures`;

-- Dumping structure for table ita_pictures.author
CREATE TABLE IF NOT EXISTS `author` (
  `id_author` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_pictures.author: ~0 rows (approximately)
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` (`id_author`, `name`) VALUES
	(1, 'Pablo Picasso');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;

-- Dumping structure for table ita_pictures.buyer
CREATE TABLE IF NOT EXISTS `buyer` (
  `id_buyer` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dni` varchar(15) NOT NULL,
  PRIMARY KEY (`id_buyer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_pictures.buyer: ~0 rows (approximately)
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` (`id_buyer`, `name`, `dni`) VALUES
	(1, 'comprador1', '123456789K');
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;

-- Dumping structure for table ita_pictures.picture
CREATE TABLE IF NOT EXISTS `picture` (
  `id_picture` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `price` float DEFAULT NULL,
  `id_author` int(11) NOT NULL,
  PRIMARY KEY (`id_picture`),
  KEY `autor_quadre` (`id_author`),
  CONSTRAINT `autor_quadre` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_pictures.picture: ~1 rows (approximately)
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
INSERT INTO `picture` (`id_picture`, `title`, `price`, `id_author`) VALUES
	(1, '', 1000000, 1);
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;

-- Dumping structure for table ita_pictures.sale
CREATE TABLE IF NOT EXISTS `sale` (
  `id_sale` int(11) NOT NULL,
  `id_buyer` int(11) DEFAULT NULL,
  `id_picture` int(11) DEFAULT NULL,
  `date_sale` datetime DEFAULT NULL,
  PRIMARY KEY (`id_sale`),
  KEY `quadre_venda` (`id_picture`),
  KEY `comprador_venda` (`id_buyer`),
  CONSTRAINT `comprador_venda` FOREIGN KEY (`id_buyer`) REFERENCES `buyer` (`id_buyer`),
  CONSTRAINT `quadre_venda` FOREIGN KEY (`id_picture`) REFERENCES `picture` (`id_picture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_pictures.sale: ~0 rows (approximately)
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` (`id_sale`, `id_buyer`, `id_picture`, `date_sale`) VALUES
	(1, 1, 1, '2020-08-06 16:15:42');
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
