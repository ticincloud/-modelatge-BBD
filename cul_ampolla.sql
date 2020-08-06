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


-- Dumping database structure for ita_cul_ampolla
CREATE DATABASE IF NOT EXISTS `ita_cul_ampolla` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ita_cul_ampolla`;

-- Dumping structure for table ita_cul_ampolla.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `id_brand` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_brand`),
  KEY `supplier_brand` (`id_supplier`),
  CONSTRAINT `supplier_brand` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_cul_ampolla.brand: ~1 rows (approximately)
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` (`id_brand`, `id_supplier`, `brand`) VALUES
	(1, 1, 'marc 1');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;

-- Dumping structure for table ita_cul_ampolla.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  PRIMARY KEY (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_cul_ampolla.customer: ~2 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`id_customer`, `name`, `address`, `phone`, `email`, `registration_date`) VALUES
	(1, 'client 1', 'c. llar, 5', '112233', 'clint1@client.com', '2020-08-06'),
	(2, 'client 2', 'c. més llarg, 25', '123456', 'client2@clint.com', '2020-08-06');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table ita_cul_ampolla.customer_recommendation
CREATE TABLE IF NOT EXISTS `customer_recommendation` (
  `id_recommendation` int(11) NOT NULL,
  `id_customer_has_recommended` int(11) DEFAULT NULL,
  `id_customer_have_recommended` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_recommendation`),
  KEY `customer_has_recommended` (`id_customer_has_recommended`),
  KEY `customer_have_recommended` (`id_customer_have_recommended`),
  CONSTRAINT `customer_has_recommended` FOREIGN KEY (`id_customer_has_recommended`) REFERENCES `customer` (`id_customer`),
  CONSTRAINT `customer_have_recommended` FOREIGN KEY (`id_customer_have_recommended`) REFERENCES `customer` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_cul_ampolla.customer_recommendation: ~1 rows (approximately)
/*!40000 ALTER TABLE `customer_recommendation` DISABLE KEYS */;
INSERT INTO `customer_recommendation` (`id_recommendation`, `id_customer_has_recommended`, `id_customer_have_recommended`) VALUES
	(1, 1, 2);
/*!40000 ALTER TABLE `customer_recommendation` ENABLE KEYS */;

-- Dumping structure for table ita_cul_ampolla.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `id_employee` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_cul_ampolla.employee: ~1 rows (approximately)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`id_employee`, `name`) VALUES
	(1, 'empleat 1');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Dumping structure for table ita_cul_ampolla.frame
CREATE TABLE IF NOT EXISTS `frame` (
  `id_frame` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_frame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_cul_ampolla.frame: ~3 rows (approximately)
/*!40000 ALTER TABLE `frame` DISABLE KEYS */;
INSERT INTO `frame` (`id_frame`, `description`) VALUES
	(1, 'Flotant'),
	(2, 'Pasta'),
	(3, 'Metàl·lica');
/*!40000 ALTER TABLE `frame` ENABLE KEYS */;

-- Dumping structure for table ita_cul_ampolla.glasses
CREATE TABLE IF NOT EXISTS `glasses` (
  `id_glasses` int(11) NOT NULL,
  `id_brand` int(11) DEFAULT NULL,
  `id_frame` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `left glass graduation` float DEFAULT NULL,
  `right glass graduation` float DEFAULT NULL,
  `left glass color` varchar(50) DEFAULT NULL,
  `right glass color` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id_glasses`),
  KEY `brand_glasses` (`id_brand`),
  KEY `glasses_frame` (`id_frame`),
  CONSTRAINT `brand_glasses` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id_brand`),
  CONSTRAINT `glasses_frame` FOREIGN KEY (`id_frame`) REFERENCES `frame` (`id_frame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_cul_ampolla.glasses: ~1 rows (approximately)
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` (`id_glasses`, `id_brand`, `id_frame`, `name`, `left glass graduation`, `right glass graduation`, `left glass color`, `right glass color`, `price`) VALUES
	(1, 1, 1, 'gfloat1', 2, 3, 'blau', 'blau', 125);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;

-- Dumping structure for table ita_cul_ampolla.sale
CREATE TABLE IF NOT EXISTS `sale` (
  `id_sale` int(11) NOT NULL,
  `id_glasses` int(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_employee` int(11) DEFAULT NULL,
  `import` double DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_sale`),
  KEY `glasses_sale` (`id_glasses`),
  KEY `customer_sale` (`id_customer`),
  KEY `employee_sale` (`id_employee`),
  CONSTRAINT `customer_sale` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`),
  CONSTRAINT `employee_sale` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`),
  CONSTRAINT `glasses_sale` FOREIGN KEY (`id_glasses`) REFERENCES `glasses` (`id_glasses`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_cul_ampolla.sale: ~1 rows (approximately)
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` (`id_sale`, `id_glasses`, `id_customer`, `id_employee`, `import`, `date`) VALUES
	(1, 1, 1, 1, 125, '2020-08-06 19:36:25');
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;

-- Dumping structure for table ita_cul_ampolla.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `id_supplier` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `floor` varchar(10) DEFAULT NULL,
  `door` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `NIF` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_cul_ampolla.supplier: ~1 rows (approximately)
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`id_supplier`, `name`, `street`, `number`, `floor`, `door`, `city`, `postal_code`, `country`, `phone`, `fax`, `NIF`) VALUES
	(1, 'prov 1', 'nou', '1', NULL, NULL, 'barcelona', '080000', 'spain', '34345', NULL, '1234r');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
