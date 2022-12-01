-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2022 a las 05:15:56
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
(1, 3, '2022-04-20 13:07:11', 6, 1),
(2, 6, '2022-09-12 08:08:59', 2, 0),
(3, 2, '2022-08-10 04:57:42', 3, 0),
(4, 1, '2022-08-12 03:06:40', 3, 0),
(5, 1, '2022-04-12 08:17:00', 2, 0),
(6, 5, '2022-12-23 15:31:12', 1, 0),
(7, 1, '2022-06-03 08:54:58', 9, 1),
(8, 1, '2022-05-12 01:23:44', 9, 0),
(9, 5, '2022-10-12 00:36:35', 10, 0),
(10, 5, '2022-11-23 16:01:44', 3, 1),
(11, 1, '2022-06-16 02:08:42', 5, 0),
(12, 4, '2022-06-08 17:55:01', 9, 1),
(13, 6, '2022-06-23 01:30:24', 3, 0),
(14, 1, '2022-10-19 05:41:21', 6, 1),
(15, 3, '2022-03-25 22:33:56', 6, 0),
(16, 4, '2022-04-24 22:35:34', 8, 1),
(17, 6, '2022-05-06 18:10:47', 4, 1),
(18, 5, '2022-10-15 18:58:14', 10, 0),
(19, 5, '2022-07-09 21:01:41', 3, 1),
(20, 5, '2022-11-13 05:06:14', 3, 1),
(21, 2, '2022-12-03 10:38:03', 3, 0),
(22, 6, '2022-12-30 12:32:39', 9, 1);

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
(1, 0, 2, 4),
(2, 1, 4, 1),
(3, 1, 6, 1),
(4, 0, 5, 1),
(5, 1, 2, 4);

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
(7, '11111', 'admin', 'admin', 'admin@gmail.com', 'admin', '123', 1, NULL, 1, '2022-11-21 15:35:11'),
(8, '00000', 'soporte', 'soporte', 'soportecicaa@gmail.com', 'soporte', '123', 1, NULL, 1, '2022-11-22 13:29:26');

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
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `log_ingresos`
--
ALTER TABLE `log_ingresos`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `ID_PERMISO` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_ROL`) REFERENCES `roles` (`ID_ROL`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`ID_HUELLA`) REFERENCES `huella` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
