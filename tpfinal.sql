-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2023 a las 00:49:18
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpfinal`
--
CREATE DATABASE IF NOT EXISTS `tpfinal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tpfinal`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `cuit` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `servicios_contratados` varbinary(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `apellido`, `cuit`, `email`, `nombre`, `razon_social`, `servicios_contratados`) VALUES
(1, 'argento', '12312333', 'arg@hotmail.com', 'pepe', 'nose', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e72002f636f6d2e61726770726f6772616d612e636f726e656a6f2e747066696e616c312e6d6f64656c2e536572766963696f00000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400056c696e757878);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id`, `descripcion`, `nombre`) VALUES
(1, 'optimizacion de Sistemas', 'limpiezaSistemas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidente`
--

CREATE TABLE `incidente` (
  `id` int(11) NOT NULL,
  `consideraciones` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_estimada_resolucion` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fecha_resolucion` date DEFAULT NULL,
  `servicio` tinyint(4) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_especialidad` int(11) DEFAULT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `id_tipo_problema` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `incidente`
--

INSERT INTO `incidente` (`id`, `consideraciones`, `descripcion`, `estado`, `fecha`, `fecha_estimada_resolucion`, `fecha_ingreso`, `fecha_resolucion`, `servicio`, `titulo`, `id_cliente`, `id_especialidad`, `id_tecnico`, `id_tipo_problema`) VALUES
(1, 'ninguna', 'funciona lento', 2, '2000-01-01', '2000-01-01', '2000-01-01', '2000-01-01', 0, 'problemas con linux', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medio_comunicacion`
--

CREATE TABLE `medio_comunicacion` (
  `id` int(11) NOT NULL,
  `contacto` varchar(255) DEFAULT NULL,
  `medio` tinyint(4) DEFAULT NULL,
  `id_tecnico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medio_comunicacion`
--

INSERT INTO `medio_comunicacion` (`id`, `contacto`, `medio`, `id_tecnico`) VALUES
(1, '030303', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `id` int(11) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `cuit` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnico`
--

INSERT INTO `tecnico` (`id`, `apellido`, `cuit`, `email`, `nombre`, `razon_social`) VALUES
(1, 'aki', '123132', 'nex@hotmail.com', 'hector', 'TecnoSoluciones S.A.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico_especialidad`
--

CREATE TABLE `tecnico_especialidad` (
  `id_tecnico` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnico_especialidad`
--

INSERT INTO `tecnico_especialidad` (`id_tecnico`, `id_especialidad`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_problema`
--

CREATE TABLE `tipo_problema` (
  `id` int(11) NOT NULL,
  `tiempo_estimado` int(11) NOT NULL,
  `tiempomax` int(11) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `id_especialidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_problema`
--

INSERT INTO `tipo_problema` (`id`, `tiempo_estimado`, `tiempomax`, `tipo`, `id_especialidad`) VALUES
(1, 4, 7, 'ralentización de sistema', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `incidente`
--
ALTER TABLE `incidente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKk7yq8gmskogf51j6s5khpafak` (`id_cliente`),
  ADD KEY `FK30g4sgc8im3m38wo2ynykarf9` (`id_especialidad`),
  ADD KEY `FKpd6362f0xofs9wwrygfovdc3v` (`id_tecnico`),
  ADD KEY `FKd378mqyepl7llavf3e60i54fq` (`id_tipo_problema`);

--
-- Indices de la tabla `medio_comunicacion`
--
ALTER TABLE `medio_comunicacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrq2mvpr4fhid6lde9bmrgxfy8` (`id_tecnico`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tecnico_especialidad`
--
ALTER TABLE `tecnico_especialidad`
  ADD KEY `FKg3p2cielvkeoodn66ssyj8rh7` (`id_especialidad`),
  ADD KEY `FK93noqwuf29guv7i5o1so7vt72` (`id_tecnico`);

--
-- Indices de la tabla `tipo_problema`
--
ALTER TABLE `tipo_problema`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKteted7875tbtuc6batbj57p31` (`id_especialidad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `incidente`
--
ALTER TABLE `incidente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `medio_comunicacion`
--
ALTER TABLE `medio_comunicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_problema`
--
ALTER TABLE `tipo_problema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `incidente`
--
ALTER TABLE `incidente`
  ADD CONSTRAINT `FK30g4sgc8im3m38wo2ynykarf9` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id`),
  ADD CONSTRAINT `FKd378mqyepl7llavf3e60i54fq` FOREIGN KEY (`id_tipo_problema`) REFERENCES `tipo_problema` (`id`),
  ADD CONSTRAINT `FKk7yq8gmskogf51j6s5khpafak` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `FKpd6362f0xofs9wwrygfovdc3v` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id`);

--
-- Filtros para la tabla `medio_comunicacion`
--
ALTER TABLE `medio_comunicacion`
  ADD CONSTRAINT `FKrq2mvpr4fhid6lde9bmrgxfy8` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id`);

--
-- Filtros para la tabla `tecnico_especialidad`
--
ALTER TABLE `tecnico_especialidad`
  ADD CONSTRAINT `FK93noqwuf29guv7i5o1so7vt72` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id`),
  ADD CONSTRAINT `FKg3p2cielvkeoodn66ssyj8rh7` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id`);

--
-- Filtros para la tabla `tipo_problema`
--
ALTER TABLE `tipo_problema`
  ADD CONSTRAINT `FKteted7875tbtuc6batbj57p31` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
