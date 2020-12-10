-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2020 a las 23:20:06
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cesta`
--

CREATE TABLE `cesta` (
  `id_visitante` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `usuario_login_usu` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `pago` int(11) DEFAULT NULL,
  `cod_operacion` int(11) DEFAULT NULL,
  `importe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `usuario_login_usu`, `pago`, `cod_operacion`, `importe`) VALUES
(0, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(20) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` mediumtext COLLATE utf8_spanish_ci NOT NULL,
  `precio` double NOT NULL,
  `img` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `youtube` varchar(500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio`, `img`, `youtube`) VALUES
(0, 'Queso \"La Flor del ESLA\"', 'Queso elaborado con leche de oveja obtenida en las explotaciones leonesas sometidas a estrictos controles sanitarios y pasteurizada. La practica del pastoreo combinando pastos secos con la variada vegetación de la Vega del Esla y los montes cercanos. Combinación de la leche con los fermentos. el cuajo y la sal. acompañados de una maduración en cámara con temperatura y humedad controladas durante más de ocho meses\r\n', 34, 'queso-flor-esla.jpg', 'qIcTM8WXFjk'),
(1, 'Jamon Reserva Mirasierra', 'El monte y la sierra son el mejor entorno y lugar para elaborar los mejores jamones y productos ibéricos. Aprovechamos los recursos que nos ofrece la madre naturaleza para fundirlos con nuestra experiencia, vanguardia técnica y exhaustivos controles de sanidad. Esto junto la labor de las cuatro generaciones de la familia Martín, dan como resultado exquisitos jamones ibéricos y productos cárnicos para disfrutar.', 119.2, 'mirasierra.jpg', 'ZCMpuolL0z8'),
(2, 'Jamón Ibérico ROAL', 'Jamón Ibérico de Cebo elaborado por Industrias Cárnicas Roal. Empresa en cuyas instalaciones se lleva a cabo el sacrificio del animal, despiece y elaboración de los distintos productos cárnicos que componen la amplia gama Roal.\r\n<br><br>\r\nIndustrias Cárnicas Roal, que cuenta con más de 50 profesionales a su servicio, ha ido incorporando las más novedosas tecnologías para garantizar el más alto grado de calidad, respetando al máximo la legislación sanitaria exigida por la Unión Europea. Todo ello sin olvidar el buen saber hacer propio de la tradición, que junto con una excelente materia prima se consiguen productos delicatessen como el Jamón Ibérico de Cebo Roal.\r\n<br><br>\r\nIndustrias Cárnicas Roal hace especial hincapie en los productos ibéricos, sabedores de que estos son un referente en la gastronomía tradicional y que además de su insuperable sabor resultan más beneficiosos para nuestra salud.', 170.5, 'jamon-roal.jpg', 'uIfghi773WI'),
(3, 'Lomo Iberico ROAL', 'En ROAL sabemos que el producto ibérico es uno de los referentes más importantes de nuestra gastronomía. Esta gama nos permite disfrutar de su sabor y los innumerables beneficios que aporta a nuestra salud.', 31.99, 'lomo-iberico.jpg', 'Qkr_ikiJU4k'),
(4, 'Pechugas de Pollo', 'Pechuga de pollo de corral peso aproximado bandeja 400 g ', 5.02, 'pechugas-pollo.jpeg', 'Z3xSGv3Hfio'),
(5, 'Alitas de Pollo', 'Alitas de pollo frescas y limpias para disfrutar fritas o al horno.', 2.39, 'Alitas-pollo.jpg', 'edYCtaNueQY'),
(6, 'Carne Picada de Vaca', 'Cadena de frío garantizada en los envíos.\r\nConservación entre 0 y 4º. \r\nSiempre se podrá prolongar su conservación congelándolo, ya que no se verá alterado ni su sabor ni su textura. \r\nProducto sin gluten. \r\nSin lactosa. \r\nIngredientes: carne de vaca 99%, aroma y dextrina. \r\n<br>\r\nPaquete de 1 kg.', 8.2, 'carne-picada.jpg', 'vgQNOIhRsV4'),
(7, 'Cecina de Vaca', 'El clima reinante hace posible una desecación lenta de la carne, con lo que se consiguen el aroma y sabor peculiares de la cecina.\r\nSe ahúma muy ligeramente utilizando leña de roble o encina.\r\n<br><br>\r\nEste producto se presenta envasado al vacío y debe estar conservado de 2-4 grados centígrados siendo su caducidad en fresco de 20 días. \r\nSiempre se podrá prolongar su conservación congelándolo, ya que no se verá alterado ni su sabor ni su textura', 20.9, 'cecina.jpg', 'okZiu65HJcM'),
(8, 'Contramuslos de Pavo', 'Precio indicado es por kg.<br>\r\nLos precios indicados pueden variar dependiendo del peso de la pieza.<br>', 5.95, 'Contramuslo.jpg', 'g3bfjtUpKPc'),
(9, 'Jamoncitos De Pollo', 'Riquísimos muslos de pollo ya limpios y perfectamente envasados para que los disfrutes.\r\n<br><br>\r\nEsta pieza del pollo la puedes hacer de muchas maneras distintas, desde plancha, horno, guisos, en parrilla acompañados de distintas salsas...\r\n<br><br>\r\nOs los preparamos y enviamos en bandeja con un peso de 1 Kg con 9 o 10 muslitos.', 18.9, 'jamoncitos-de-pollo.jpg', 'MmB9b5njVbA'),
(10, 'Presa de Cerdo Iberica', 'Presa de cerdo ibérico, un gran bocado que ha revolucionado la cocina en estos últimos años.\r\n<br><br>\r\nEs muy apreciada por que quizás sea la pieza con más grasa intramuscular, lo cual la hace perfecta para prepararla a la plancha o a la brasa y que se vaya fundiendo en su propio jugo.\r\n<br><br>\r\nEn Masmit os la ofrecemos limpia y envasada en bandeja de 1 kilogramo.', 23.55, 'presa-iberica.jpg', 'Bf85wwJuFBE'),
(11, 'Solomillo Black Angus', 'Un corte de los más escogidos tanto en restaurantes como hogares por su terneza y sabor suave, y este de Black Angus seguro que no os defraudará.\r\n<br><br>\r\nCortado a mano y envasado al vacío por unidad con un peso de 200gr.', 11.99, 'Solomillo-de-ternera.jpg', 'fuBajsiGVXE'),
(12, 'Rabillo de Ternera', 'El rabillo de ternera es una parte que se encuentra en distinas piezas de la pierna, nosotros la seleccionamos de la cadera por ser más sabrosa.\r\n<br><br>\r\nEs muy similar al redondo y se puede cocinar como este. Se puede servir frío, caliente, acompañado de salsas...\r\n<br><br>\r\nOs la enviamos perfectamente preparado, al igual que en la carnicería, peso aproximado de 1 Kilogramo.', 11.2, 'rabillo.jpg', 'fsfsfsfs'),
(13, 'Conejo Tierno', 'Conejo fresco de granja perfectamente limpio y listo para cocinar.', 8.75, 'conejo-tierno.jpg', ''),
(14, 'Chuletas de Cordero', 'Chuletas de cordero recental de origen nacional, deliciosas. Una opción imprescindible si quieres hacer una gran barbacoa.\r\n<br><br>\r\nLas chuletas de cordero recental son algo más grandes que las del cordero lechal, debido a que el cordero es también de un tamaño superior.', 18.7, 'chuleta-de-aguja.jpg', 'fsfsfs');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_pedido`
--

CREATE TABLE `producto_pedido` (
  `producto_id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `login_usu` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`login_usu`, `email`, `password`, `direccion`) VALUES
('', '', '$2y$10$imJCIXEP8KDT7NZEixp0aeW2fqaTYvE1rp6Xo21PRjpY4zvn6QS3K', ''),
('alvaro', 'alvaro@gmail.com', '$2y$10$iYWlmVXZAU6Ym1Vtk.iEqu9Fuf6nnVYwQWUwclbh4zxpLQiqF9NP6', 'Madrid'),
('patata', 'luropatata@gmail.com', '$2y$10$qWvx5FQ1ChekowlUC/MjMOzSa4sLtrM1ITEdNFY3SFN70iNr0Gfzy', 'madrid'),
('patata2', 'luropatata@gmail.com', '$2y$10$AT.zy.UmH9wmuIDplZgg9ebSN/fzcSxx09mdki/yo6zlU3TYdU03O', 'madrid'),
('sergio', 'sergio@gmail.com', '$2y$10$KLHs0fEjz3FQNkk8i74CJue6/KPnki77OvaSmpKjndUiegPyJhJFe', 'Calle Brasil,13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cesta`
--
ALTER TABLE `cesta`
  ADD KEY `id_producto_idx` (`id_producto`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`,`usuario_login_usu`),
  ADD KEY `fk_pedido_usuario1_idx` (`usuario_login_usu`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto_pedido`
--
ALTER TABLE `producto_pedido`
  ADD PRIMARY KEY (`producto_id`,`pedido_id`),
  ADD KEY `fk_producto_has_pedido_pedido1_idx` (`pedido_id`),
  ADD KEY `fk_producto_has_pedido_producto_idx` (`producto_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`login_usu`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cesta`
--
ALTER TABLE `cesta`
  ADD CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_usuario1` FOREIGN KEY (`usuario_login_usu`) REFERENCES `usuario` (`login_usu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_pedido`
--
ALTER TABLE `producto_pedido`
  ADD CONSTRAINT `fk_producto_has_pedido_pedido1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_has_pedido_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
