-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2022 a las 19:21:28
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdcerradura`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huella`
--

CREATE TABLE `huella` (
  `ID` int(10) NOT NULL,
  `ID_USUARIO` int(10) DEFAULT NULL,
  `FECHA_CREACION` datetime DEFAULT current_timestamp(),
  `FECHA_MODIFICACION` datetime DEFAULT current_timestamp(),
  `ESTADO` int(10) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `huella`
--

INSERT INTO `huella` (`ID`, `ID_USUARIO`, `FECHA_CREACION`, `FECHA_MODIFICACION`, `ESTADO`) VALUES
(1, 1, '2022-10-20 15:00:38', '2022-10-20 15:00:38', 1),
(2, 3, '2022-10-20 16:17:32', '2022-10-20 16:17:32', 1),
(3, 2, '2022-10-20 16:17:34', '2022-10-20 16:17:34', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_ingresos`
--

CREATE TABLE `log_ingresos` (
  `ID` int(10) NOT NULL,
  `ID_USUARIO` int(10) DEFAULT NULL,
  `FECHA` datetime DEFAULT current_timestamp(),
  `ID_SALON` int(10) DEFAULT NULL,
  `ESTADO` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `log_ingresos`
--

INSERT INTO `log_ingresos` (`ID`, `ID_USUARIO`, `FECHA`, `ID_SALON`, `ESTADO`) VALUES
(1, 5, '2022-08-06 02:47:36', 9, 0),
(2, 4, '2022-11-26 11:43:04', 3, 0),
(3, 2, '2022-11-14 04:00:35', 10, 1),
(4, 2, '2022-12-13 04:11:36', 7, 0),
(5, 3, '2022-02-16 08:41:06', 5, 1),
(6, 6, '2022-11-10 06:18:27', 10, 0),
(7, 1, '2022-08-26 22:37:01', 2, 0),
(8, 3, '2022-12-06 15:04:03', 7, 1),
(9, 5, '2022-03-13 11:04:12', 1, 1),
(10, 1, '2022-02-08 20:38:41', 2, 1),
(11, 5, '2022-12-03 04:29:31', 8, 0),
(12, 1, '2022-10-17 00:50:26', 2, 0),
(13, 4, '2022-04-20 12:38:51', 2, 0),
(14, 5, '2022-07-15 04:39:05', 3, 1),
(15, 6, '2022-02-01 14:01:53', 7, 1),
(16, 3, '2022-08-07 07:49:55', 1, 0),
(17, 2, '2022-02-08 10:05:51', 5, 1),
(18, 1, '2022-08-10 19:39:05', 6, 0),
(19, 3, '2022-05-18 17:04:05', 3, 0),
(20, 4, '2022-06-11 11:49:34', 2, 0),
(21, 3, '2022-08-08 14:30:56', 4, 1),
(22, 5, '2022-04-22 15:39:54', 4, 0),
(23, 5, '2022-03-13 11:32:12', 7, 0),
(24, 1, '2022-02-23 23:48:56', 8, 0),
(25, 6, '2022-05-07 18:30:44', 1, 0),
(26, 2, '2022-05-26 01:41:11', 10, 0),
(27, 3, '2022-09-28 12:17:26', 10, 1),
(28, 4, '2022-03-13 15:52:49', 7, 1),
(29, 1, '2022-09-05 07:47:30', 10, 0),
(30, 5, '2022-08-07 09:04:49', 4, 1),
(31, 4, '2022-04-17 13:04:20', 10, 1),
(32, 4, '2022-06-10 12:43:52', 10, 1),
(33, 2, '2022-03-05 06:26:42', 3, 1),
(34, 5, '2022-05-13 18:05:32', 7, 0),
(35, 5, '2022-12-06 16:34:03', 6, 0),
(36, 1, '2022-08-23 09:11:30', 2, 1),
(37, 6, '2022-09-28 18:27:21', 2, 1),
(38, 1, '2022-05-20 04:59:20', 10, 1),
(39, 5, '2022-02-01 14:50:18', 7, 0),
(40, 5, '2022-11-27 13:15:18', 10, 1),
(41, 6, '2022-11-06 05:50:05', 1, 1),
(42, 2, '2022-08-10 14:17:07', 10, 0),
(43, 6, '2022-07-24 00:09:45', 4, 1),
(44, 6, '2022-11-19 00:14:30', 2, 1),
(45, 2, '2022-06-19 18:21:55', 10, 1),
(46, 2, '2022-09-01 01:16:26', 10, 1),
(47, 3, '2022-02-10 02:44:45', 7, 1),
(48, 6, '2022-02-03 11:25:01', 7, 1),
(49, 5, '2022-11-08 13:21:04', 4, 1),
(50, 6, '2022-02-07 04:02:38', 7, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_salon`
--

CREATE TABLE `reserva_salon` (
  `ID_RESERVA` int(10) NOT NULL,
  `ID_USUARIO` int(10) NOT NULL,
  `ID_SALON` int(10) NOT NULL,
  `FECHA_INICIO` timestamp NOT NULL DEFAULT current_timestamp(),
  `FECHA_FINAL` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reserva_salon`
--

INSERT INTO `reserva_salon` (`ID_RESERVA`, `ID_USUARIO`, `ID_SALON`, `FECHA_INICIO`, `FECHA_FINAL`) VALUES
(1, 2, 1, '2022-11-07 15:00:00', '2022-11-07 16:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID_ROL` int(10) NOT NULL,
  `ROL` varchar(50) DEFAULT NULL,
  `ESTADO` int(1) DEFAULT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`ID_ROL`, `ROL`, `ESTADO`, `FECHA_CREACION`) VALUES
(1, 'ADMINISTRADOR', 1, '2022-10-10 23:46:01'),
(2, 'DOCENTE', 1, '2022-10-10 23:46:10'),
(3, 'ESTUDIANTE', 1, '2022-10-10 23:46:17'),
(4, 'prueba', NULL, '2022-10-18 20:15:11'),
(5, 'rol_prueba2', 1, '2022-10-19 15:25:44'),
(6, 'rol_prueba4', 1, '2022-11-24 15:18:50'),
(7, 'rol_prueba5', 1, '2022-11-24 15:21:54'),
(8, 'rol_prueba6', 1, '2022-11-24 15:25:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salones`
--

CREATE TABLE `salones` (
  `ID_SALON` int(10) NOT NULL,
  `SALON` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `salones`
--

INSERT INTO `salones` (`ID_SALON`, `SALON`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, '6'),
(7, '7'),
(8, '8'),
(9, '9'),
(10, '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_USUARIO` int(1) NOT NULL,
  `CEDULA` varchar(11) DEFAULT NULL,
  `NOMBRES` varchar(50) DEFAULT NULL,
  `APELLIDOS` varchar(50) DEFAULT NULL,
  `CORREO` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(50) NOT NULL,
  `CONTRASENA` varchar(50) DEFAULT NULL,
  `ID_ROL` int(10) DEFAULT NULL,
  `ID_HUELLA` int(10) DEFAULT NULL,
  `ESTADO` int(10) DEFAULT 1,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIO`, `CEDULA`, `NOMBRES`, `APELLIDOS`, `CORREO`, `USUARIO`, `CONTRASENA`, `ID_ROL`, `ID_HUELLA`, `ESTADO`, `FECHA_CREACION`) VALUES
(1, '1234567658', 'juaco', 'dominguez', 'juanco@hot.com', 'juaco123', 'juaco123', 2, 1, 1, '2022-10-18 20:52:49'),
(2, '3456788', 'maria', 'perez', 'maria@gmail.com', 'maria123', 'maria123', 2, 3, 1, '2022-10-18 20:53:31'),
(3, '123456789', 'juan', 'de jesus', 'juandeoz12@gmail.com', 'juan123', 'juan123', 2, 2, 1, '2022-10-19 13:57:18'),
(4, '5678788', 'pedro', 'rivas', 'pedror@gmail.com', 'pedro123', 'pedro123', 2, NULL, 1, '2022-10-19 14:07:17'),
(5, '1237890980', 'carlos', 'sanchez', 'carloss@gmail.com', 'calros123', 'carlos123', 2, NULL, 1, '2022-10-19 14:09:30'),
(6, '2005968', 'lidia', 'zocorro', 'lidiaz@gmail.com', 'lidiaz123', 'lidia123', 2, NULL, 1, '2022-10-20 20:41:20'),
(7, '11111', 'admin', 'cicaa', 'admin@gmail.com', 'admin', '123', 1, NULL, 1, '2022-11-21 15:35:11'),
(8, '00000', 'soporte', 'cicaa', 'soportecicaa@gmail.com', 'soporte', '123', 1, NULL, 1, '2022-11-22 13:29:26');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `huella`
--
ALTER TABLE `huella`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `log_ingresos`
--
ALTER TABLE `log_ingresos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `reserva_salon`
--
ALTER TABLE `reserva_salon`
  ADD PRIMARY KEY (`ID_RESERVA`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`),
  ADD KEY `ID_SALON` (`ID_SALON`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_ROL`);

--
-- Indices de la tabla `salones`
--
ALTER TABLE `salones`
  ADD PRIMARY KEY (`ID_SALON`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_USUARIO`,`USUARIO`),
  ADD KEY `ID_ROL` (`ID_ROL`),
  ADD KEY `ID_HUELLA` (`ID_HUELLA`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `huella`
--
ALTER TABLE `huella`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `log_ingresos`
--
ALTER TABLE `log_ingresos`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `reserva_salon`
--
ALTER TABLE `reserva_salon`
  MODIFY `ID_RESERVA` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_ROL` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `salones`
--
ALTER TABLE `salones`
  MODIFY `ID_SALON` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_USUARIO` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `huella`
--
ALTER TABLE `huella`
  ADD CONSTRAINT `huella_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`);

--
-- Filtros para la tabla `log_ingresos`
--
ALTER TABLE `log_ingresos`
  ADD CONSTRAINT `log_ingresos_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`);

--
-- Filtros para la tabla `reserva_salon`
--
ALTER TABLE `reserva_salon`
  ADD CONSTRAINT `reserva_salon_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`),
  ADD CONSTRAINT `reserva_salon_ibfk_2` FOREIGN KEY (`ID_SALON`) REFERENCES `salones` (`ID_SALON`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_ROL`) REFERENCES `roles` (`ID_ROL`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`ID_HUELLA`) REFERENCES `huella` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
