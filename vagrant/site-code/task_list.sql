-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-10-2016 a las 10:08:52
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `todo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task` text NOT NULL,
  `date` date NOT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`id`, `task`, `date`, `duration`) VALUES
(6, 'tes', '2016-10-04', 23),
(7, 'test ', '2016-10-04', 2),
(10, 'tarea 3', '2016-10-04', 1),
(11, 'tarea 4', '2016-10-04', 5),
(12, 'tarea 20', '2016-10-04', 10),
(13, 'tarea 50', '2016-10-04', 50),
(14, 'tarea 40', '2016-10-04', 10),
(15, 'tarea 20', '2016-10-04', 6),
(16, 'tarea 10', '2016-10-04', 9),
(17, 'tarea 50', '2016-10-04', 45),
(18, 'tarea 423', '2016-10-04', 25),
(19, 'tarea 2323', '2016-10-04', 16);
