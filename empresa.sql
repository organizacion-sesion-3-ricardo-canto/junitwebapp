SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
--
-- DROP DATABASE `empresa`;
CREATE DATABASE `empresa` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `empresa`;


-- phpMyAdmin SQL Dump
-- version 2.8.1
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 03-06-2007 a las 18:59:30
-- Versión del servidor: 5.0.21
-- Versión de PHP: 5.1.4
-- 
-- Base de datos: `empresa`
-- 

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `articulos`
-- 

DROP TABLE IF EXISTS `articulos`;
CREATE TABLE IF NOT EXISTS `articulos` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(30) NOT NULL default '',
  `precio` float NOT NULL default '0',
  `codigo` varchar(7) NOT NULL default '',
  `grupo` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `grupo` (`grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- 
-- Volcar la base de datos para la tabla `articulos`
-- 

INSERT INTO `articulos` VALUES (1, 'Monitor 16', 178, 'mon16', 1);
INSERT INTO `articulos` VALUES (2, 'Monitor 20', 200, 'mon20', 1);
INSERT INTO `articulos` VALUES (3, 'Monitor 22', 220, 'mon22', 1);
INSERT INTO `articulos` VALUES (4, 'Motherboard FX', 99, 'mthFX', 1);
INSERT INTO `articulos` VALUES (5, 'Papel A4-500', 5, 'PA4500', 2);
INSERT INTO `articulos` VALUES (6, 'Diskettes 10', 4, 'D10', 2);
INSERT INTO `articulos` VALUES (7, 'Diskettes 20', 8, 'D20', 2);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `clientes`
-- 

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(60) NOT NULL default '',
  `direccion` varchar(80) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Volcar la base de datos para la tabla `clientes`
-- 

INSERT INTO `clientes` VALUES (1, 'Matt Design', NULL);
INSERT INTO `clientes` VALUES (2, 'Diana Perez', 'Brito del Pino 1120');
INSERT INTO `clientes` VALUES (3, 'John Smith', 'Zum Felde 2024');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `facturas`
-- 

DROP TABLE IF EXISTS `facturas`;
CREATE TABLE IF NOT EXISTS `facturas` (
  `id` int(11) NOT NULL auto_increment,
  `serie` char(1) NOT NULL default '',
  `numero` int(11) NOT NULL default '0',
  `fecha` date default NULL,
  `cliente` int(11) NOT NULL default '0',
  `vendedor` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cliente` (`cliente`),
  KEY `vendedor` (`vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- 
-- Volcar la base de datos para la tabla `facturas`
-- 

INSERT INTO `facturas` VALUES (1, 'A', 1020, '2007-03-18', 1, 1);
INSERT INTO `facturas` VALUES (2, 'A', 1022, '2007-03-18', 2, 2);
INSERT INTO `facturas` VALUES (3, 'A', 1025, '2007-04-20', 3, 1);
INSERT INTO `facturas` VALUES (4, 'A', 1020, '2007-03-18', 1, 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `grupos`
-- 

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE IF NOT EXISTS `grupos` (
  `id` int(11) NOT NULL auto_increment,
  `descripcion` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Volcar la base de datos para la tabla `grupos`
-- 

INSERT INTO `grupos` VALUES (1, 'Hardware');
INSERT INTO `grupos` VALUES (2, 'Suministros');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `lineas_factura`
-- 

DROP TABLE IF EXISTS `lineas_factura`;
CREATE TABLE IF NOT EXISTS `lineas_factura` (
  `id` int(11) NOT NULL auto_increment,
  `factura` int(11) NOT NULL default '0',
  `importe` float NOT NULL default '0',
  `articulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL default '0000-00-00',
  `sucursal` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `sucursal` (`sucursal`),
  KEY `articulos` (`articulo`),
  KEY `factura` (`factura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- 
-- Volcar la base de datos para la tabla `lineas_factura`
-- 

INSERT INTO `lineas_factura` VALUES (1, 1, 178, 1, 1, '2007-03-14', 1);
INSERT INTO `lineas_factura` VALUES (2, 1, 200, 2, 1, '2007-03-14', 1);
INSERT INTO `lineas_factura` VALUES (3, 1, 220, 3, 1, '2007-03-14', 1);
INSERT INTO `lineas_factura` VALUES (4, 2, 199, 4, 2, '2007-03-18', 2);
INSERT INTO `lineas_factura` VALUES (5, 3, 22, 5, 4, '2007-04-20', 1);
INSERT INTO `lineas_factura` VALUES (6, 1, 99, 1, 1, '2007-03-18', 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `sucursales`
-- 

DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE IF NOT EXISTS `sucursales` (
  `id` int(11) NOT NULL auto_increment,
  `descripcion` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Volcar la base de datos para la tabla `sucursales`
-- 

INSERT INTO `sucursales` VALUES (1, 'Centro');
INSERT INTO `sucursales` VALUES (2, 'Uni¢n');
INSERT INTO `sucursales` VALUES (3, 'Malv¡n');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `vendedores`
-- 

DROP TABLE IF EXISTS `vendedores`;
CREATE TABLE IF NOT EXISTS `vendedores` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL default '',
  `fecha_ingreso` date NOT NULL default '0000-00-00',
  `salario` float NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Volcar la base de datos para la tabla `vendedores`
-- 

INSERT INTO `vendedores` VALUES (1, 'Carlos Zaltzman', '2007-01-01', 12000);
INSERT INTO `vendedores` VALUES (2, 'Juan Fern ndez', '2007-01-01', 12000);

-- --------------------------------------------------------

-- 
-- Filtros para la tabla `articulos`
-- 
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`grupo`) REFERENCES `grupos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- 
-- Filtros para la tabla `facturas`
-- 
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_4` FOREIGN KEY (`vendedor`) REFERENCES `vendedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facturas_ibfk_3` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- 
-- Filtros para la tabla `lineas_factura`
-- 
ALTER TABLE `lineas_factura`
  ADD CONSTRAINT `lineas_factura_ibfk_6` FOREIGN KEY (`sucursal`) REFERENCES `sucursales` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lineas_factura_ibfk_4` FOREIGN KEY (`factura`) REFERENCES `facturas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lineas_factura_ibfk_5` FOREIGN KEY (`articulo`) REFERENCES `articulos` (`id`);

