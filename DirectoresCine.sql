-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-11-2020 a las 16:24:13
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `DirectoresCine`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Administrador`
--

CREATE TABLE `Administrador` (
  `id` int(3) NOT NULL,
  `usuario` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `contraseña` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `Administrador`
--

INSERT INTO `Administrador` (`id`, `usuario`, `contraseña`) VALUES
(1, 'admin', 'admin'),
(4, 'admin2', 'admin2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Director`
--

CREATE TABLE `Director` (
  `id` int(3) NOT NULL,
  `Nombre` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `Director`
--

INSERT INTO `Director` (`id`, `Nombre`) VALUES
(1, 'Martin Scorcesese'),
(2, 'Steven Spielberg'),
(3, 'Pedro Almodóvar'),
(4, 'James Cameron');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pelicula`
--

CREATE TABLE `Pelicula` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `EdadMinima` int(11) DEFAULT 0,
  `FechaEstreno` date DEFAULT NULL,
  `idDirector` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `Pelicula`
--

INSERT INTO `Pelicula` (`id`, `Nombre`, `EdadMinima`, `FechaEstreno`, `idDirector`) VALUES
(2, 'Silencio', 16, '2017-01-05', 1),
(3, 'Indiana Jones y el reino de la calavera de cristal', 0, '2008-05-20', 2),
(14, 'El lobo de Wall Street', 16, '2014-01-17', 1),
(15, 'Titanic', 12, '1998-01-08', 4),
(16, 'Avatar', 7, '2009-12-18', 4),
(17, 'Dolor y gloria', 16, '2019-06-12', 3),
(18, 'Mujeres al borde de un ataque de nervios', 0, '1988-03-25', 3),
(20, 'E.T. el extraterrestre', 0, '1982-12-06', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Administrador`
--
ALTER TABLE `Administrador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Director`
--
ALTER TABLE `Director`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Pelicula`
--
ALTER TABLE `Pelicula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idDirector` (`idDirector`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Administrador`
--
ALTER TABLE `Administrador`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Director`
--
ALTER TABLE `Director`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Pelicula`
--
ALTER TABLE `Pelicula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Pelicula`
--
ALTER TABLE `Pelicula`
  ADD CONSTRAINT `Pelicula_ibfk_1` FOREIGN KEY (`idDirector`) REFERENCES `Director` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
