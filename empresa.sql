SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `articulos`;
CREATE TABLE IF NOT EXISTS `articulos` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(30) NOT NULL default '',
  `precio` float NOT NULL default '0',
  `codigo` varchar(7) NOT NULL default '',
  `grupo` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
);

INSERT INTO `articulos` VALUES (1, 'Monitor 16', 178, 'mon16', 1);
INSERT INTO `articulos` VALUES (2, 'Monitor 20', 200, 'mon20', 1);
INSERT INTO `articulos` VALUES (3, 'Monitor 22', 220, 'mon22', 1);
INSERT INTO `articulos` VALUES (4, 'Motherboard FX', 99, 'mthFX', 1);
INSERT INTO `articulos` VALUES (5, 'Papel A4-500', 5, 'PA4500', 2);
INSERT INTO `articulos` VALUES (6, 'Diskettes 10', 4, 'D10', 2);
INSERT INTO `articulos` VALUES (7, 'Diskettes 20', 8, 'D20', 2);

-- --------------------------------------------------------


