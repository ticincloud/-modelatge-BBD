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


-- Dumping database structure for ita_vueling
CREATE DATABASE IF NOT EXISTS `ita_vueling` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ita_vueling`;

-- Dumping structure for table ita_vueling.plane
CREATE TABLE IF NOT EXISTS `plane` (
  `id_plane` int(11) NOT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Model` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_plane`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_vueling.plane: ~0 rows (approximately)
/*!40000 ALTER TABLE `plane` DISABLE KEYS */;
/*!40000 ALTER TABLE `plane` ENABLE KEYS */;

-- Dumping structure for table ita_vueling.seat
CREATE TABLE IF NOT EXISTS `seat` (
  `id_seat` int(11) NOT NULL,
  `id_plane` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_seat`),
  CONSTRAINT `seat_plane` FOREIGN KEY (`id_seat`) REFERENCES `plane` (`id_plane`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ita_vueling.seat: ~0 rows (approximately)
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
