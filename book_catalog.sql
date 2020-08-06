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


-- Dumping database structure for ita_book_catalog
CREATE DATABASE IF NOT EXISTS `ita_book_catalog` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ita_book_catalog`;

-- Dumping structure for table ita_book_catalog.author
CREATE TABLE IF NOT EXISTS `author` (
  `id_author` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `written_books` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_book_catalog.author: ~1 rows (approximately)
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` (`id_author`, `name`, `address`, `written_books`) VALUES
	(1, 'author 1', 'one street', 12);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;

-- Dumping structure for table ita_book_catalog.book
CREATE TABLE IF NOT EXISTS `book` (
  `id_book` int(11) NOT NULL,
  `id_author` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `available_stock` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id_book`),
  KEY `author_book` (`id_author`),
  CONSTRAINT `author_book` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_book_catalog.book: ~1 rows (approximately)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`id_book`, `id_author`, `title`, `available_stock`, `price`) VALUES
	(1, 1, 'title 1', 24, 21);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;

-- Dumping structure for table ita_book_catalog.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id_invoice` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `data_invoice` datetime DEFAULT NULL,
  PRIMARY KEY (`id_invoice`),
  KEY `user_invoice` (`id_user`),
  CONSTRAINT `user_invoice` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_book_catalog.invoice: ~1 rows (approximately)
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` (`id_invoice`, `id_user`, `data_invoice`) VALUES
	(1, 1, '2020-08-06 17:43:42');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;

-- Dumping structure for table ita_book_catalog.invoice_line
CREATE TABLE IF NOT EXISTS `invoice_line` (
  `id_line` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_book` int(11) NOT NULL,
  `import` float DEFAULT NULL,
  PRIMARY KEY (`id_line`),
  KEY `invoice_line` (`id_invoice`),
  KEY `book_invoice_lin` (`id_book`),
  CONSTRAINT `book_invoice_lin` FOREIGN KEY (`id_book`) REFERENCES `book` (`id_book`),
  CONSTRAINT `invoice_line` FOREIGN KEY (`id_invoice`) REFERENCES `invoice` (`id_invoice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_book_catalog.invoice_line: ~1 rows (approximately)
/*!40000 ALTER TABLE `invoice_line` DISABLE KEYS */;
INSERT INTO `invoice_line` (`id_line`, `id_invoice`, `id_book`, `import`) VALUES
	(1, 1, 1, 21);
/*!40000 ALTER TABLE `invoice_line` ENABLE KEYS */;

-- Dumping structure for table ita_book_catalog.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_book_catalog.user: ~1 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id_user`, `name`, `email`, `password`) VALUES
	(1, 'user 1', 'user1@user1.com', 'pass1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
