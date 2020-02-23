-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2020 a las 21:16:09
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agenda_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `dia_completo` tinyint(1) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `titulo` varchar(100) NOT NULL,
  `fk_usuario` int(11) NOT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `dia_completo`, `fecha_inicio`, `fecha_fin`, `titulo`, `fk_usuario`, `hora_inicio`, `hora_fin`) VALUES
(2, 1, '2020-02-06', NULL, 'evento2', 1, NULL, NULL),
(3, 0, '2020-02-04', '2020-02-05', 'evento3', 1, '07:00:00', '07:00:00'),
(5, 1, '2019-12-31', NULL, 'evento1', 2, NULL, NULL),
(6, 0, '2020-01-08', '2020-01-10', 'evento2', 2, '07:00:00', '07:00:00'),
(7, 1, '2020-01-03', NULL, 'evento1', 3, NULL, NULL),
(8, 0, '2020-01-05', '2020-01-07', 'evento2', 3, '05:00:00', '09:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `email` varchar(45) NOT NULL,
  `psw` varchar(250) NOT NULL,
  `fechaNto` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `email`, `psw`, `fechaNto`) VALUES
(1, 'Dante Sergio Caballero', 'Dante@mail.com', '$2y$10$1Q.Q59exORzlC/A2sf.hV.uSaei2v2wKFrsNWvy6T6K4gzaTxuB1C', '1972-11-14'),
(2, 'Diego Sebastian Caballero', 'Diego@mail.com', '$2y$10$0i3pKKr6o4.72e9r53enGuKKw.n89LIAcGknBla/8S2zye5RzpgWe', '1982-11-14'),
(3, 'Daniel Silvio Caballero', 'Daniel@mail.com', '$2y$10$TGJA1zBjVWeDzVxTQKio7OQMqYTEd7qyLPJqHNO1T77XnzvlZ.WQy', '1992-11-14');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario` (`fk_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
