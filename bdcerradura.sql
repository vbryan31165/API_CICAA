-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2022 at 06:35 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdcerradura`
--

-- --------------------------------------------------------

--
-- Table structure for table `huella`
--

CREATE TABLE `huella` (
  `ID` int(10) NOT NULL,
  `ID_USUARIO` int(10) DEFAULT NULL,
  `FECHA_CREACION` datetime DEFAULT current_timestamp(),
  `FECHA_MODIFICACION` datetime DEFAULT current_timestamp(),
  `ESTADO` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log_ingresos`
--

CREATE TABLE `log_ingresos` (
  `ID` int(10) NOT NULL,
  `ID_USUARIO` int(10) DEFAULT NULL,
  `FECHA` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `ID_ROL` int(10) NOT NULL,
  `ROL` varchar(50) DEFAULT NULL,
  `ESTADO` int(1) DEFAULT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`ID_ROL`, `ROL`, `ESTADO`, `FECHA_CREACION`) VALUES
(1, 'ADMINISTRADOR', 1, '2022-10-09 05:28:43'),
(2, 'DOCENTE', 1, '2022-10-09 05:28:47'),
(3, 'ESTUDIANTE', 1, '2022-10-09 05:28:50');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_USUARIO` int(10) NOT NULL,
  `CEDULA` varchar(11) DEFAULT NULL,
  `NOMBRES` varchar(50) DEFAULT NULL,
  `APELLIDOS` varchar(50) DEFAULT NULL,
  `CORREO` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(50) DEFAULT NULL,
  `CONTRASENA` varchar(50) DEFAULT NULL,
  `ID_ROL` int(10) DEFAULT NULL,
  `ESTADO` int(10) DEFAULT 1,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIO`, `CEDULA`, `NOMBRES`, `APELLIDOS`, `CORREO`, `USUARIO`, `CONTRASENA`, `ID_ROL`, `ESTADO`, `FECHA_CREACION`) VALUES
(1, '1004568972', 'HUGO', 'DE LA HOZ', 'HUGO@GMAIL.COM', 'HUGO123', 'HUGO321', 1, 1, '2022-10-09 05:28:20'),
(2, '2337895', 'RAMIRO', 'QUINTANA', 'RAMIRO@HOTMAIL.COM', 'RAMIRO123', '123', 2, 1, '2022-10-09 05:29:41'),
(3, '1045908764', 'PEDRO', 'RIVAS', 'PEDRO69@GMAIL.COM', 'PEDRO69', '123', 3, 1, '2022-10-09 05:30:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `huella`
--
ALTER TABLE `huella`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indexes for table `log_ingresos`
--
ALTER TABLE `log_ingresos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_ROL`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD KEY `ID_ROL` (`ID_ROL`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `huella`
--
ALTER TABLE `huella`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_ROL` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_USUARIO` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `huella`
--
ALTER TABLE `huella`
  ADD CONSTRAINT `huella_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`);

--
-- Constraints for table `log_ingresos`
--
ALTER TABLE `log_ingresos`
  ADD CONSTRAINT `log_ingresos_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_ROL`) REFERENCES `roles` (`ID_ROL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
