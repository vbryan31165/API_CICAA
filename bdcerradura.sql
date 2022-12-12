-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2022 a las 22:38:26
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
(1, 1, '2022-12-06 19:47:44', '2022-12-06 19:47:44', 1),
(2, 2, '2022-12-06 19:47:45', '2022-12-06 19:47:45', 1),
(3, 3, '2022-12-06 19:47:46', '2022-12-06 19:47:46', 1),
(4, 4, '2022-12-06 19:47:47', '2022-12-06 19:47:47', 1),
(5, 5, '2022-12-06 19:47:47', '2022-12-06 19:47:47', 1),
(6, 6, '2022-12-06 19:47:48', '2022-12-06 19:47:48', 1),
(7, 7, '2022-12-06 19:47:49', '2022-12-06 19:47:49', 1),
(8, 8, '2022-12-06 19:47:49', '2022-12-06 19:47:49', 1),
(9, 9, '2022-12-06 19:47:50', '2022-12-06 19:47:50', 1),
(10, 10, '2022-12-06 19:47:53', '2022-12-06 19:47:53', 1),
(11, 11, '2022-12-06 19:48:55', '2022-12-06 19:48:55', 1),
(12, 12, '2022-12-06 19:48:56', '2022-12-06 19:48:56', 1);

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
(1, 6, '2022-08-27 05:00:57', 2, 0),
(2, 2, '2022-10-19 06:31:55', 5, 0),
(3, 6, '2022-12-13 11:48:28', 8, 1),
(4, 1, '2022-08-30 19:53:16', 4, 1),
(5, 1, '2022-03-20 19:44:20', 6, 0),
(6, 2, '2022-05-06 16:09:15', 1, 0),
(7, 6, '2022-12-07 01:35:22', 1, 0),
(8, 4, '2022-11-03 07:17:50', 8, 1),
(9, 3, '2022-06-30 20:11:00', 3, 0),
(10, 3, '2022-10-24 15:53:58', 6, 0),
(11, 3, '2022-05-29 20:43:12', 5, 1),
(12, 5, '2022-06-28 12:18:33', 1, 0),
(13, 2, '2022-06-12 15:45:30', 1, 0),
(14, 4, '2022-09-11 17:41:22', 5, 1),
(15, 3, '2022-11-01 05:44:34', 10, 0),
(16, 4, '2022-05-12 07:57:19', 1, 1),
(17, 5, '2022-08-14 20:40:21', 6, 1),
(18, 5, '2022-06-17 22:44:14', 5, 0),
(19, 5, '2022-06-13 20:40:16', 7, 0),
(20, 3, '2022-03-20 15:31:09', 9, 1),
(21, 3, '2022-06-27 00:03:15', 8, 0),
(22, 5, '2022-07-17 01:48:15', 10, 0),
(23, 4, '2022-06-05 04:15:49', 5, 1),
(24, 5, '2022-05-15 15:12:12', 2, 1),
(25, 4, '2022-11-05 00:52:59', 4, 0),
(26, 3, '2022-09-17 15:17:17', 5, 0),
(27, 4, '2022-06-11 07:13:23', 7, 0),
(28, 5, '2022-10-30 20:19:28', 3, 1),
(29, 2, '2022-03-27 21:43:50', 7, 1),
(30, 1, '2022-09-24 09:22:41', 2, 0),
(31, 3, '2022-12-02 20:38:39', 5, 0),
(32, 4, '2022-12-28 10:20:56', 8, 1),
(33, 5, '2022-11-25 10:56:39', 5, 1),
(34, 6, '2022-02-11 14:40:44', 4, 0),
(35, 2, '2022-03-12 19:43:04', 10, 0),
(36, 1, '2022-06-09 14:39:43', 3, 0),
(37, 1, '2022-09-18 08:08:55', 5, 1),
(38, 1, '2022-04-17 06:19:16', 7, 1),
(39, 2, '2022-09-05 17:02:25', 2, 1),
(40, 3, '2022-05-11 05:22:51', 7, 0),
(41, 2, '2022-03-10 21:41:43', 6, 0),
(42, 3, '2022-12-18 21:17:44', 8, 1),
(43, 4, '2022-09-16 07:57:52', 7, 0),
(44, 2, '2022-07-05 03:02:21', 1, 0),
(45, 1, '2022-07-14 22:53:33', 3, 1),
(46, 2, '2022-08-22 23:30:56', 10, 0),
(47, 1, '2022-05-14 07:55:34', 10, 1),
(48, 5, '2022-05-29 17:33:33', 8, 0),
(49, 1, '2022-04-28 01:03:40', 1, 0),
(50, 3, '2022-06-12 10:14:39', 2, 1),
(51, 4, '2022-08-09 20:36:18', 1, 1),
(52, 5, '2022-08-21 12:50:41', 10, 0),
(53, 3, '2022-08-18 20:19:50', 5, 1),
(54, 2, '2022-07-16 14:13:22', 7, 0),
(55, 4, '2022-08-04 09:46:20', 5, 1),
(56, 1, '2022-10-24 18:00:48', 3, 0),
(57, 5, '2022-09-30 05:31:27', 6, 0),
(58, 2, '2022-12-28 20:40:20', 6, 1),
(59, 3, '2022-07-14 20:01:10', 4, 1),
(60, 3, '2022-06-23 01:46:17', 2, 1),
(61, 3, '2022-06-24 11:42:51', 7, 0),
(62, 4, '2022-07-29 13:56:24', 10, 1),
(63, 6, '2022-02-17 17:01:56', 3, 1),
(64, 4, '2022-02-03 09:38:46', 7, 0),
(65, 5, '2022-11-21 17:12:57', 2, 1),
(66, 5, '2022-06-23 08:37:47', 7, 1),
(67, 2, '2022-08-19 13:33:52', 9, 0),
(68, 1, '2022-11-11 23:56:15', 5, 0),
(69, 4, '2022-05-29 12:28:37', 3, 1),
(70, 3, '2022-03-09 02:18:06', 1, 1),
(71, 5, '2022-06-23 12:02:22', 2, 1),
(72, 2, '2022-09-25 05:47:01', 4, 0),
(73, 4, '2022-09-10 12:07:29', 7, 0),
(74, 2, '2022-12-12 03:18:04', 2, 0),
(75, 1, '2022-12-03 01:11:44', 8, 1),
(76, 3, '2022-07-07 21:57:07', 7, 0),
(77, 5, '2022-04-25 02:58:24', 10, 0),
(78, 5, '2022-05-17 04:54:23', 8, 1),
(79, 6, '2022-06-16 21:36:04', 9, 1),
(80, 1, '2022-07-22 22:41:09', 7, 0),
(81, 5, '2022-08-22 19:00:56', 5, 1),
(82, 6, '2022-09-29 17:08:32', 4, 1),
(83, 1, '2022-05-22 09:27:33', 4, 0),
(84, 2, '2022-08-06 22:25:34', 8, 1),
(85, 3, '2022-06-01 20:07:51', 6, 0),
(86, 1, '2022-10-27 19:00:02', 9, 0),
(87, 6, '2022-07-01 16:03:10', 4, 0),
(88, 6, '2022-05-08 14:53:29', 10, 0),
(89, 6, '2022-08-26 19:48:05', 3, 1),
(90, 1, '2022-04-30 02:23:37', 5, 0),
(91, 5, '2022-11-21 04:41:06', 9, 0),
(92, 1, '2022-10-17 20:57:07', 8, 1),
(93, 3, '2022-03-04 07:29:20', 10, 1),
(94, 3, '2022-07-23 17:29:10', 8, 1),
(95, 4, '2022-07-01 14:46:47', 8, 0),
(96, 3, '2022-11-26 05:53:30', 7, 1),
(97, 4, '2022-06-22 06:15:24', 10, 1),
(98, 5, '2022-03-22 19:22:39', 7, 0),
(99, 6, '2022-07-23 05:52:03', 4, 1),
(100, 5, '2022-02-02 03:29:06', 9, 1),
(101, 6, '2022-03-21 06:45:30', 2, 0),
(102, 6, '2022-09-14 16:16:20', 9, 1),
(103, 6, '2022-05-28 15:25:25', 4, 1),
(104, 6, '2022-09-16 11:41:25', 6, 0),
(105, 1, '2022-06-05 18:52:04', 10, 1),
(106, 4, '2022-12-22 02:26:20', 2, 0),
(107, 6, '2022-11-05 02:08:43', 5, 1),
(108, 4, '2022-03-23 09:39:48', 7, 1),
(109, 1, '2022-02-01 17:19:25', 7, 0),
(110, 4, '2022-11-10 01:24:36', 7, 1),
(111, 3, '2022-07-11 01:33:17', 8, 0),
(112, 3, '2022-09-30 12:54:36', 10, 1),
(113, 3, '2022-07-17 16:03:00', 10, 1),
(114, 3, '2022-03-28 14:20:56', 8, 0),
(115, 6, '2022-12-05 16:15:46', 1, 1),
(116, 3, '2022-05-17 11:10:03', 2, 1),
(117, 3, '2022-03-03 23:19:37', 7, 1),
(118, 5, '2022-08-17 13:36:37', 5, 0),
(119, 2, '2022-05-07 14:55:50', 7, 1),
(120, 1, '2022-12-05 05:52:16', 8, 1),
(121, 3, '2022-07-20 17:48:06', 2, 1),
(122, 5, '2022-02-04 02:12:22', 1, 0),
(123, 6, '2022-03-04 20:43:33', 2, 0),
(124, 4, '2022-10-06 00:31:20', 6, 0),
(125, 3, '2022-02-14 04:29:37', 5, 0),
(126, 5, '2022-10-15 09:56:49', 5, 0),
(127, 6, '2022-08-23 03:30:43', 10, 1),
(128, 5, '2022-08-17 08:45:21', 3, 1),
(129, 3, '2022-06-29 10:49:15', 5, 1),
(130, 6, '2022-06-01 23:34:10', 7, 0),
(131, 4, '2022-09-01 14:50:31', 4, 1),
(132, 5, '2022-08-24 11:17:58', 9, 0),
(133, 5, '2022-12-10 07:04:58', 2, 0),
(134, 2, '2022-04-25 22:28:42', 7, 1),
(135, 5, '2022-06-07 08:45:18', 3, 1),
(136, 4, '2022-09-27 03:33:13', 3, 0),
(137, 4, '2022-09-05 23:00:12', 2, 0),
(138, 5, '2022-02-03 10:31:50', 7, 1),
(139, 5, '2022-07-07 13:11:44', 8, 0),
(140, 2, '2022-05-22 04:56:06', 5, 1),
(141, 6, '2022-02-26 08:26:23', 1, 0),
(142, 6, '2022-03-17 06:29:44', 7, 1),
(143, 3, '2022-02-22 13:33:43', 1, 0),
(144, 2, '2022-02-03 21:23:40', 6, 1),
(145, 2, '2022-10-04 13:13:30', 5, 1),
(146, 3, '2022-11-15 05:23:39', 1, 0),
(147, 6, '2022-10-16 09:49:02', 1, 0),
(148, 1, '2022-05-25 12:28:26', 1, 1),
(149, 5, '2022-09-16 11:11:59', 10, 0),
(150, 1, '2022-12-10 13:06:01', 6, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `ID_PERMISO` int(10) NOT NULL,
  `PERMISO` int(1) DEFAULT NULL,
  `ID_USUARIO` int(10) DEFAULT NULL,
  `ID_SALON` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`ID_PERMISO`, `PERMISO`, `ID_USUARIO`, `ID_SALON`) VALUES
(1, 1, 1, 6),
(2, 1, 2, 6),
(3, 1, 3, 6),
(4, 0, 4, 6),
(5, 1, 5, 6),
(6, 1, 6, 6),
(7, 0, 9, 6),
(8, 1, 10, 6),
(9, 1, 11, 6),
(10, 0, 12, 6),
(11, 0, 12, 4);

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
(2, '3456788', 'maria', 'perez', 'maria@gmail.com', 'maria123', 'maria123', 2, 2, 1, '2022-10-18 20:53:31'),
(3, '123456789', 'juan', 'de la hoz', 'juandeoz12@gmail.com', 'juan123', 'juan123', 2, 3, 1, '2022-10-19 13:57:18'),
(4, '5678788', 'pedro', 'rivas', 'pedror@gmail.com', 'pedro123', 'pedro123', 2, 4, 1, '2022-10-19 14:07:17'),
(5, '1237890980', 'carlos', 'sanchez', 'carloss@gmail.com', 'calros123', 'carlos123', 2, 5, 1, '2022-10-19 14:09:30'),
(6, '2005968', 'lidia', 'zocorro', 'lidiaz@gmail.com', 'lidiaz123', 'lidia123', 2, 6, 1, '2022-10-20 20:41:20'),
(7, '11111', 'admin', 'admin', 'admin@gmail.com', 'admin', '123', 1, 7, 1, '2022-11-21 15:35:11'),
(8, '00000', 'soporte', 'soporte', 'soportecicaa@gmail.com', 'soporte', '123', 1, 8, 1, '2022-11-22 13:29:26'),
(9, '1230094839', 'carla', 'dominguez', 'carlad@gmail.com', 'carlad', '123', 2, 9, 1, '2022-12-02 00:30:02'),
(10, '1215318309', 'alberto', 'perez', 'alver@gmail.com', 'alverp', '123', 2, 10, 1, '2022-12-02 00:31:48'),
(11, '34563224', 'federico', 'perea', 'fedep@gmail.com', 'fedep', '123', 2, 11, 1, '2022-12-07 00:48:35'),
(12, '1089345689', 'juliana', 'correa', 'julic@gmail.com', 'julicorrea', '123', 2, 12, 1, '2022-12-07 00:48:47');

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
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`ID_PERMISO`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`),
  ADD KEY `ID_SALON` (`ID_SALON`);

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
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `log_ingresos`
--
ALTER TABLE `log_ingresos`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `ID_PERMISO` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `ID_USUARIO` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`),
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`ID_SALON`) REFERENCES `salones` (`ID_SALON`);

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
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_ROL`) REFERENCES `roles` (`ID_ROL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
