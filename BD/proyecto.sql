-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3360
-- Tiempo de generación: 19-12-2021 a las 14:26:18
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `usuario` varchar(32) NOT NULL,
  `titulo` varchar(32) NOT NULL,
  `contenido` text NOT NULL,
  `fecha_de_registro` datetime NOT NULL,
  `fecha_de_vencimiento` datetime NOT NULL,
  `categoria` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tarea`
--

INSERT INTO `tarea` (`usuario`, `titulo`, `contenido`, `fecha_de_registro`, `fecha_de_vencimiento`, `categoria`) VALUES
('adrian', 'tarea1', 'programar', '2021-12-18 23:01:00', '2021-12-19 23:01:00', 'archivado'),
('adrian', 'tarea2', 'desarrollar una pagina web', '2021-12-18 23:02:00', '2021-12-20 23:02:00', 'archivado'),
('adrian', 'tarea3', 'proyecto1', '2021-12-18 23:03:00', '2021-12-23 23:03:00', 'archivado'),
('adrian', 'add1', 'programar en php', '2021-12-18 23:04:00', '2021-12-18 23:04:00', 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `nombre` varchar(32) NOT NULL,
  `apellido` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`nombre`, `apellido`, `username`, `password`) VALUES
('Adrian', 'Aguilar', 'adrian', '$2y$10$T2CPaA3U2bkbEIXrvHxv1ul0ITdTyEG/jFYzWB8lKQXazdTMfYhMK'),
('Katherine ', 'Marcas', 'kathe', '$2y$10$6JCAeWWDapmTwqIewD5YC.Xoe9ixI.svn3csl8Y.qBZwrGdan1sXa');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD UNIQUE KEY `username` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
