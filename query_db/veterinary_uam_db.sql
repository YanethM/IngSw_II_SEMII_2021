-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-08-2021 a las 16:01:50
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `veterinary_uam_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_hospital`
--

CREATE TABLE `tb_hospital` (
  `id` int(11) NOT NULL,
  `name_hospital` varchar(50) NOT NULL,
  `nit` varchar(13) NOT NULL,
  `address` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_hospital_pet`
--

CREATE TABLE `tb_hospital_pet` (
  `id_pet` int(11) NOT NULL,
  `id_hospital` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_owner_pet`
--

CREATE TABLE `tb_owner_pet` (
  `id` int(11) NOT NULL,
  `name_owner` varchar(50) NOT NULL,
  `document_type` varchar(50) NOT NULL,
  `document` int(11) NOT NULL,
  `contact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_pet`
--

CREATE TABLE `tb_pet` (
  `id` int(11) NOT NULL,
  `name_pet` varchar(20) NOT NULL,
  `breed` varchar(20) NOT NULL,
  `pedigree` tinyint(1) NOT NULL DEFAULT 0,
  `id_owner` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_hospital`
--
ALTER TABLE `tb_hospital`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_hospital_pet`
--
ALTER TABLE `tb_hospital_pet`
  ADD KEY `id_pet` (`id_pet`),
  ADD KEY `id_hospital` (`id_hospital`);

--
-- Indices de la tabla `tb_owner_pet`
--
ALTER TABLE `tb_owner_pet`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_pet`
--
ALTER TABLE `tb_pet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_owner` (`id_owner`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_hospital`
--
ALTER TABLE `tb_hospital`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_owner_pet`
--
ALTER TABLE `tb_owner_pet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_pet`
--
ALTER TABLE `tb_pet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_hospital_pet`
--
ALTER TABLE `tb_hospital_pet`
  ADD CONSTRAINT `tb_hospital_pet_ibfk_1` FOREIGN KEY (`id_pet`) REFERENCES `tb_pet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_hospital_pet_ibfk_2` FOREIGN KEY (`id_hospital`) REFERENCES `tb_hospital` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_pet`
--
ALTER TABLE `tb_pet`
  ADD CONSTRAINT `tb_pet_ibfk_1` FOREIGN KEY (`id_owner`) REFERENCES `tb_owner_pet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
