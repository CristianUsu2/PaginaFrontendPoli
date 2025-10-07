-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-10-2025 a las 02:24:10
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `onin_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `cantidad` int(11) DEFAULT 0,
  `promocion` tinyint(1) DEFAULT 0,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `precio`, `descripcion`, `cantidad`, `promocion`, `fecha_creacion`, `usuario_id`) VALUES
(1, 'Soporte Técnico', 150.00, 'Solucionamos fallas y mantenemos tus equipos activos.', 20, 1, '2025-10-06 23:57:14', NULL),
(2, 'Desarrollo de Software', 300.00, 'Creamos aplicaciones a la medida.', 15, 0, '2025-10-06 23:57:14', NULL),
(3, 'Mantenimiento de Equipos', 100.00, 'Mejoramos el rendimiento de tus dispositivos.', 30, 0, '2025-10-06 23:57:14', NULL),
(4, 'Instalación de Redes', 100.00, 'Implementamos redes seguras y eficientes.', 25, 1, '2025-10-06 23:57:14', NULL),
(5, 'Seguridad Informática', 150.00, 'Protegemos tus sistemas frente a amenazas.', 40, 0, '2025-10-06 23:57:14', NULL),
(6, 'Seguridad Informática Premium', 200.00, 'Ofrecemos protección avanzada y monitoreo.', 50, 1, '2025-10-06 23:57:14', NULL),
(7, 'Gestión de Proyectos', 90.00, 'Organizamos y guiamos tus proyectos al éxito.', 10, 0, '2025-10-06 23:57:14', NULL),
(8, 'Análisis de Datos', 75.00, 'Convertimos datos en decisiones estratégicas.', 30, 1, '2025-10-06 23:57:14', NULL),
(9, 'Análisis Estadístico', 90.00, 'Interpretamos datos con precisión profesional.', 20, 0, '2025-10-06 23:57:14', NULL),
(10, 'Soporte Técnico', 150.00, 'Solucionamos fallas y mantenemos tus equipos activos.', 20, 1, '2025-10-06 23:59:56', NULL),
(11, 'Desarrollo de Software', 300.00, 'Creamos aplicaciones a la medida.', 15, 0, '2025-10-06 23:59:56', NULL),
(12, 'Mantenimiento de Equipos', 100.00, 'Mejoramos el rendimiento de tus dispositivos.', 30, 0, '2025-10-06 23:59:56', NULL),
(13, 'Instalación de Redes', 100.00, 'Implementamos redes seguras y eficientes.', 25, 1, '2025-10-06 23:59:56', NULL),
(14, 'Seguridad Informática', 150.00, 'Protegemos tus sistemas frente a amenazas.', 40, 0, '2025-10-06 23:59:56', NULL),
(15, 'Seguridad Informática Premium', 200.00, 'Ofrecemos protección avanzada y monitoreo.', 50, 1, '2025-10-06 23:59:56', NULL),
(16, 'Gestión de Proyectos', 90.00, 'Organizamos y guiamos tus proyectos al éxito.', 10, 0, '2025-10-06 23:59:56', NULL),
(17, 'Análisis de Datos', 75.00, 'Convertimos datos en decisiones estratégicas.', 30, 1, '2025-10-06 23:59:56', NULL),
(18, 'Análisis Estadístico', 90.00, 'Interpretamos datos con precisión profesional.', 20, 0, '2025-10-06 23:59:56', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` enum('admin','cliente') DEFAULT 'cliente',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `usuario`, `contrasena`, `rol`, `fecha_creacion`) VALUES
(1, 'Admin', 'admin@onin.com', 'admin', 'admin123', 'admin', '2025-10-06 23:57:14');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
