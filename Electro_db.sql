# SQL Manager Lite for MySQL 5.4.3.43929
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : Electro_db


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `electro_db`;

CREATE DATABASE `Electro_db`
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

USE `electro_db`;

#
# Structure for the `electrodomestico` table : 
#

CREATE TABLE `electrodomestico` (
  `id_electro` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `color_elect` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `consumo_elect` CHAR(2) COLLATE latin1_swedish_ci NOT NULL,
  `precio_elect` DECIMAL(11,2) NOT NULL,
  `peso_elect` INTEGER(11) NOT NULL,
  `carga_lava` DECIMAL(11,2) DEFAULT NULL,
  `Resol_tele` DECIMAL(11,2) DEFAULT NULL,
  `Sintoniz_tele` TINYINT(1) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id_electro`) COMMENT '',
  UNIQUE INDEX `id_electro` USING BTREE (`id_electro`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=11 AVG_ROW_LENGTH=2048 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 4096 kB'
;

#
# Structure for the `usuarios` table : 
#

CREATE TABLE `usuarios` (
  `idUsuario` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `password` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`idUsuario`) COMMENT ''
)ENGINE=InnoDB
AVG_ROW_LENGTH=8192 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Data for the `electrodomestico` table  (LIMIT -491,500)
#

INSERT INTO `electrodomestico` (`id_electro`, `descripcion`, `color_elect`, `consumo_elect`, `precio_elect`, `peso_elect`, `carga_lava`, `Resol_tele`, `Sintoniz_tele`) VALUES

  (1,'abcdef','Blanco','B',1860.00,100,NULL,NULL,NULL),
  (2,'LavarropaB','Negro','B',1670.00,150,25.00,NULL,NULL),
  (3,'idkfa','Azul','A',1470.00,90,NULL,29.00,0),
  (6,'PAPA','BLANCO','B',90.00,12,NULL,NULL,NULL),
  (7,'ASA','BLANCO','A',110.00,1,NULL,NULL,NULL),
  (8,'aa','BLANCO','A',111.00,1,NULL,NULL,NULL),
  (9,'dddd','AZUL','A',120.00,10,NULL,NULL,NULL),
  (10,'Televisor','Blanco','A',100.00,100,NULL,29.00,1);
COMMIT;

#
# Data for the `usuarios` table  (LIMIT -497,500)
#

INSERT INTO `usuarios` (`idUsuario`, `password`) VALUES

  ('dante','dante'),
  ('martin','martin');
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;