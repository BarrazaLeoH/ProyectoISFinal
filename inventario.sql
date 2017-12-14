-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-12-2017 a las 21:29:48
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envasadora`
--

CREATE TABLE `envasadora` (
  `idEnvasadora` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `idProduccion` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(11) NOT NULL COMMENT 'En litros',
  `ID_vina` int(11) NOT NULL,
  `ID_producto` int(11) NOT NULL,
  `ID_envasadora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `cepa` varchar(50) NOT NULL,
  `reserva` int(1) NOT NULL,
  `stock_minimo` int(11) DEFAULT '0',
  `stock_maximo` int(11) DEFAULT '0',
  `stock` int(11) NOT NULL,
  `id_tipovolumen` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `marca`, `tipo`, `cepa`, `reserva`, `stock_minimo`, `stock_maximo`, `stock`, `id_tipovolumen`, `id_usuario`) VALUES
(7, 'De martino', 'Tinto', 'carmenere', 1, 10, 500, 43, 11, 3),
(8, 'Montgras', 'Tinto', 'Ensamblaje', 1, 10, 1000, 86, 11, 3),
(9, 'Armidita', 'blanco', 'Moscatel', 1, 15, 600, 129, 10, 3),
(10, 'Calcu', 'Tinto', 'carmenere', 0, 25, 500, 165, 11, 3),
(11, 'Ventisquero', 'Tinto', 'carmenere', 1, 10, 255, 49, 11, 3),
(12, 'Ventisquero', 'Tinto', 'Merlot', 1, 25, 750, 83, 11, 3),
(13, 'Ventisquero', 'Tinto', 'Syrah', 1, 25, 450, 67, 11, 3),
(14, 'Laberinto', 'Blanco', 'Sauvignon Blanc', 1, 50, 800, 159, 11, 3),
(15, 'Montgras', 'Tinto', 'Cabernet Sauvignon', 1, 10, 500, 158, 11, 3),
(17, 'Morande', 'Tinto', 'carmenere', 1, 5, 250, 45, 11, 3),
(18, 'Miguel Torres', 'Blanco', 'LATE HARVEST', 1, 15, 250, 45, 12, 5),
(19, 'Miguel Torres', 'Tinto', 'Carignan', 1, 5, 148, 45, 11, 5),
(20, 'Miguel Torres', 'Rose', 'ROSE', 1, 10, 500, 78, 11, 5),
(21, 'Miguel Torres', 'Tinto', 'carmenere', 1, 5, 850, 78, 11, 5),
(22, 'Miguel Torres', 'Tinto', 'MERLOT', 1, 5, 450, 83, 11, 5),
(23, 'Miguel Torres', 'Tinto', 'CABERNET SAUVIGNON', 1, 5, 780, 450, 11, 5),
(24, 'Miguel Torres', 'Blanco', 'MUSCAT', 1, 15, 100, 56, 11, 5),
(25, 'Donum Massenez', 'Blanco', 'Ensamblaje', 1, 15, 500, 49, 11, 5),
(26, 'Donum Massenez', 'Tinto', 'Pinot Noir', 1, 5, 100, 43, 11, 5),
(27, 'Casa Marin', 'Tinto', 'Pinot Noir', 1, 5, 450, 89, 11, 5),
(28, 'Casa Marin', 'Tinto', 'Pinot Noir', 1, 5, 150, 86, 11, 5),
(29, 'Miguel Torres', 'Tinto', 'Pinot Noir', 1, 5, 50, 32, 11, 5),
(30, 'Miguel Torres', 'Tinto', 'Syrah', 1, 5, 45, 20, 11, 5),
(31, 'Miguel Torres', 'Tinto', 'Cabernet Sauvignon', 1, 50, 450, 86, 11, 3),
(32, 'Amaral', 'Blanco', 'Sauvignon Blanc', 1, 5, 500, 456, 11, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_volumen`
--

CREATE TABLE `tipo_volumen` (
  `id` int(11) NOT NULL,
  `Formato` varchar(45) NOT NULL,
  `cantidadxlitro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_volumen`
--

INSERT INTO `tipo_volumen` (`id`, `Formato`, `cantidadxlitro`) VALUES
(6, 'lata (350 cc)', 600),
(7, 'botella (1 lt)', 500),
(8, 'garrafa (5 lt)', 10000),
(10, 'Botella (0.5 L)', 500),
(11, 'Botella (0.75 L)', 750),
(12, 'Botella (0.375L)', 375);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `nombre_Persona` varchar(150) NOT NULL,
  `nombre_Empresa` varchar(100) DEFAULT NULL,
  `rango` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `contrasena`, `correo`, `nombre_Persona`, `nombre_Empresa`, `rango`) VALUES
(3, 'Usuario 1', 'asd123', 'usuario1@hotmail.com', 'Usuario1', 'Empresa1', 0),
(4, 'Admin', 'admin123', 'admin@hotmail.com', 'admin', 'admin', 1),
(5, 'Usuario2', 'asd123', 'usuario2@hotmail.com', 'user2', 'user2', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vina`
--

CREATE TABLE `vina` (
  `idVina` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `ID_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `envasadora`
--
ALTER TABLE `envasadora`
  ADD PRIMARY KEY (`idEnvasadora`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`idProduccion`),
  ADD KEY `produccion_vina_idx` (`ID_vina`),
  ADD KEY `produccion_producto_idx` (`ID_producto`),
  ADD KEY `produccion_envasadora_idx` (`ID_envasadora`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_tipo_volumen_idx` (`id_tipovolumen`),
  ADD KEY `producto_usuario_idx` (`id_usuario`);

--
-- Indices de la tabla `tipo_volumen`
--
ALTER TABLE `tipo_volumen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vina`
--
ALTER TABLE `vina`
  ADD PRIMARY KEY (`idVina`),
  ADD KEY `vina_usuario_idx` (`ID_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `envasadora`
--
ALTER TABLE `envasadora`
  MODIFY `idEnvasadora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `idProduccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `tipo_volumen`
--
ALTER TABLE `tipo_volumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `vina`
--
ALTER TABLE `vina`
  MODIFY `idVina` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD CONSTRAINT `produccion_envasadora` FOREIGN KEY (`ID_envasadora`) REFERENCES `envasadora` (`idEnvasadora`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produccion_producto` FOREIGN KEY (`ID_producto`) REFERENCES `producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produccion_vina` FOREIGN KEY (`ID_vina`) REFERENCES `vina` (`idVina`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_tipo_volumen` FOREIGN KEY (`id_tipovolumen`) REFERENCES `tipo_volumen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `producto_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vina`
--
ALTER TABLE `vina`
  ADD CONSTRAINT `vina_usuario` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
