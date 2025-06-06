-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 06-06-2025 a las 15:31:19
-- Versión del servidor: 10.11.13-MariaDB-ubu2204
-- Versión de PHP: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Agrifood_DB0`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `User`
--

INSERT INTO `User` (`id`, `name`, `email`, `password`) VALUES
(1, 'Pepito Grillo', 'pepito@grillo.cat', '111111111'),
(2, 'Joan', 'joan@perez.com', '111111'),
(3, 'Josep', 'josep@lopez.com', '222222');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_station`
--

CREATE TABLE `user_station` (
  `user_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user_station`
--

INSERT INTO `user_station` (`user_id`, `station_id`) VALUES
(1, 200),
(2, 100),
(2, 300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `weatherData`
--

CREATE TABLE `weatherData` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `avgAirTemperature` float DEFAULT NULL,
  `precipitation` float DEFAULT NULL,
  `minAirTemperature` float DEFAULT NULL,
  `maxAirTemperature` float DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `weatherData`
--

INSERT INTO `weatherData` (`id`, `date`, `avgAirTemperature`, `precipitation`, `minAirTemperature`, `maxAirTemperature`, `station_id`) VALUES
(6, '2024-06-10', 18.1, 0, 11.4, 24.8, 100),
(7, '2024-06-03', 13.5, 0, 7.8, 19.2, 200),
(8, '2025-06-01', 18.1, 20, 19.4, 24.8, 300),
(9, '2025-06-03', 13.6, 6, 9.9, 19.2, 300),
(10, '2025-05-22', 12.4, 6, 6.7, 20.7, 300),
(11, '2025-05-29', 20, 15, 2, 20, 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `weatherStation`
--

CREATE TABLE `weatherStation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `weatherStation`
--

INSERT INTO `weatherStation` (`id`, `name`, `province`, `latitude`, `longitude`) VALUES
(100, 'MANRESA', 'BARCELONA', 41.72, 1.84),
(200, 'PORQUERES', 'GIRONA', 42.1, 2.76),
(300, 'FABRA', 'BARCELONA', 41.41, 2.12);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `user_station`
--
ALTER TABLE `user_station`
  ADD PRIMARY KEY (`user_id`,`station_id`),
  ADD KEY `station_id` (`station_id`);

--
-- Indices de la tabla `weatherData`
--
ALTER TABLE `weatherData`
  ADD PRIMARY KEY (`id`),
  ADD KEY `station_id` (`station_id`);

--
-- Indices de la tabla `weatherStation`
--
ALTER TABLE `weatherStation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `weatherData`
--
ALTER TABLE `weatherData`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `weatherStation`
--
ALTER TABLE `weatherStation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `user_station`
--
ALTER TABLE `user_station`
  ADD CONSTRAINT `user_station_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`),
  ADD CONSTRAINT `user_station_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `weatherStation` (`id`);

--
-- Filtros para la tabla `weatherData`
--
ALTER TABLE `weatherData`
  ADD CONSTRAINT `weatherData_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `weatherStation` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
