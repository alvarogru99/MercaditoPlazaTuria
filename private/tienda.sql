

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
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
(0, 'Cyberpunk 2077', 'Cyberpunk 2077 es un futuro videojuego desarrollado y publicado por CD Projekt, y se lanzará para Microsoft Windows, PlayStation 4, Xbox One y Google Stadia. Adaptado del juego de mesa Cyberpunk 2020, se establece cincuenta y siete años más tarde en la ciudad distópica Night City, California. Es un mundo abierto con seis distritos diferentes, con una perspectiva de primera persona y los jugadores asumen el papel del personaje personalizable llamado V, quienes pueden mejorar sus estadísticas con experiencia. V tiene un arsenal de armas y opciones para combate cuerpo a cuerpo, los cuales pueden ser modificados. Su lanzamiento se producirá el 17 de septiembre de 2020.\r\n<br><br>\r\nEl videojuego está siendo desarrollado por CD Projekt Red, un estudio interno dentro de CD Projekt, usando el motor de juegos REDengine 4. Lanzaron una nueva división en Wrocław y se asociaron con Digital Scapes para ayudar al desarrollo. El personal excede el número de los que trabajaron en The Witcher 3: Wild Hunt.\r\n<br><br>\r\nDurante la E3 del 2019, se declaró la fecha oficial del lanzamiento del videojuego, además, se reveló que el actor Keanu Reeves formará parte del elenco de personajes que tendrán relevancia en el transcurso del juego. Estos datos fueron presentados por el mismo actor en la presentación del juego en el E3 quien fue el conductor del evento del videojuego. ', 49.99, 'Cyberpunk.png', 'qIcTM8WXFjk'),
(1, 'Temtem', 'Temtem es un juego de rol en línea multijugador masivo (MMORPG) desarrollado por el estudio de desarrollo español Crema y publicado por Humble Bundle . El juego fue lanzado en acceso temprano a través de Steam el 21 de enero de 2020. Hay planes adicionales para futuros lanzamientos de Temtem en PlayStation 4 , Xbox One y Nintendo Switch . El juego utiliza el motor de desarrollo Unity , y es un videojuego de colección de criaturas inspirado en gran medida por la serie Pokémon de Nintendo . El juego fue financiado en parte a través de la plataforma de crowdfunding Kickstarter , de mayo a junio de 2018. <br><br>\r\nLa jugabilidad de Temtem está inspirada en gran medida en la serie Pokémon . Los jugadores exploran el área capturando a las criaturas epónimas de Temtem y las comanda en batallas contra otros Temtem controlados por un NPC u otro jugador.<br><br>\r\n\r\nEn el juego, los jugadores asumen el papel de un domador novato de Temtem que comienza su viaje alrededor de las seis islas flotantes del archipiélago de Airbone mientras enfrentan la amenaza del Clan Belsoto, una organización malvada que planea gobernar las islas por la fuerza.', 24.99, 'temtem.png', 'ZCMpuolL0z8'),
(2, 'Overwatch 2', 'Overwatch 2 se anunció en la BlizzCon el 1 de noviembre de 2019. Overwatch 2 mantendrá un \"entorno multijugador compartido\" entre este y el Overwatch original, de modo que los jugadores en cualquier videojuego puedan competir juntos en los modos jugador contra jugador (PvP) existentes, retener todos los cosméticos desbloqueados y otras características. Todos los nuevos héroes, mapas y modos PvP se agregarán a ambos videojuegos para mantener este entorno compartido. Se agregarán al menos dos nuevos héroes. Se introducirá un nuevo modo PvP, \"Push\", que funciona como un tira y afloja, donde cada equipo compite por el control de un robot que empuja una carga explosiva hacia el lado contrario del mapa cuando un equipo lo controla; Push se convertirá en parte de la rotación de mapas estándar en la Overwatch League y estará disponible para el juego Causal y Competitivo.\r\n<br><br>\r\nEl contenido exclusivo de Overwatch 2 serán los modos persistentes de jugador contra entorno (PvE). Estos son similares a los eventos especiales de temporada, que contarán con misiones cooperativas de cuatro jugadores contra oponentes controlados por computadora. En este modo, los jugadores pueden ganar experiencia para el héroe que están usando, y en ciertos niveles de experiencia, podrán desbloquear nuevas habilidades pasivas que aumentan las habilidades actuales del héroe, lo que les permite personalizar la forma en que los héroes combaten. Se agregarán al menos dos modos: un modo de misión basado en la historia, donde los jugadores están limitados a su selección de héroes para realizar misiones basadas en la historia de Overwatch, y misiones de héroes que permiten que todos los héroes se usen para enfrentarse a oleadas de enemigos en varios lugares. \r\n<br><br>\r\nSe espera que Overwatch 2 se lance para Microsoft Windows, PlayStation 4, Xbox One y Nintendo Switch.', 49.99, 'overwatch2.png', 'uIfghi773WI'),
(3, 'Diablo IV', 'Diablo IV es un videojuego en desarrollo perteneciente al género de rol de acción y de Cortar y destripar, desarrollado por la empresa Blizzard Entertainment, es el cuarto título principal y numérico de la serie Diablo.​ Y el décimo título de la serie en general, el videojuego se anuncio con la presentación de cinemáticas en el evento principal de Blizzard.<br><br>\r\nEl videojuego se anunció oficialmente en el evento de la BlizzCon 2019 el 1 de noviembre del año 2019. La fecha de lanzamiento no ha sido anunciada formalmente por Blizzard Entertainment, sin embargo, fuentes cercanas al departamento de producción han declarado que se busca un lanzamiento para finales de 2020 aunque podría retrasarse hasta 2021. algunas estimaciones predicen que el lanzamiento se retrasara a algún momento durante el otoño del 2021.\r\n<br><br>\r\nEjecutivos de Blizzard declararon que la experiencia de juego en Diablo IV requeriría conexión estable a Internet para desarrollar toda la parte jugable en la trama principal y los modos de juego centrales.', 61.99, 'diablo.png', 'Qkr_ikiJU4k'),
(4, 'Final Fantasy VII', 'Final Fantasy VII es un videojuego de rol desarrollado y publicado por la empresa Square para la plataforma PlayStation. Publicado en 1997, se trata de la séptima entrega de la serie Final Fantasy y la primera de la saga en presentar gráficos tridimensionales, mostrando personajes completamente renderizados sobre escenarios prerenderizados.\r\n<br><br>\r\nEl desarrollo de Final Fantasy VII comenzó en 1994. El juego fue inicialmente concebido para Super Nintendo Entertainment System, pero su desarrollo fue trasladado a Nintendo 64. Sin embargo, dado que los cartuchos de Nintendo 64 carecían de la capacidad de almacenamiento necesaria; Square decidió publicarlo para el sistema PlayStation en su lugar, ya que utiliza el CD-ROM como soporte de almacenamiento. Final Fantasy VII fue dirigido por Yoshinori Kitase, escrito por Kazushige Nojima y Kitase, y producido por Hironobu Sakaguchi. La música fue compuesta por el veterano de la saga Nobuo Uematsu, mientras que el antiguo diseñador de personajes, Yoshitaka Amano, fue reemplazado por Tetsuya Nomura.\r\n<br><br>\r\nDurante el E3 del 2019, se presentó el adelanto del juego Final Fantasy VII Remake, con todos los gráficos remasterizados y un nuevo sistema de juego, con fecha de lanzamiento el 3 de marzo de 2020. ', 62.99, 'finalfantasy.png', 'Z3xSGv3Hfio'),
(5, 'Counter Strike: Global Offensive', 'Counter Strike: Global Offensive (o simplemente CS:GO) es un videojuego de acción shooter en primera persona. Cuarta entrega de la saga de Valve, CSGO repite el planteamiento de siempre: dos equipos, terroristas y antiterroristas, luchando entre sí por cumplir objetivos como plantar/ desactivar una bomba. Se trata del FPS multijugador más popular entre los eSports y cuenta con servidores dedicados así como partidas personalizadas donde disfrutar de hasta seis modos de juego.<br><br>\r\n\r\nAunque es posible jugar offline a Counter Strike con bots, la vertiente más popular del juego es su multijugador a través de internet. A lo largo de cinco modos de juego (competitivo, casual, deathmatch, carrera de armamento y demolición) los avatares de los jugadores pueden adquirir armas y equipamiento realistas con dinero virtual durante una partida, y las pierden al morir. La jugabilidad de Counter Strike: Global Offensive lo ha vuelto en el favorito de muchos jugadores, particularmente en la comunidad de PC. También está disponible en Mac, Linux, y las consolas Xbox 360 y PS3. CSGO es un auténtico Top en el mundo de los juegos eSports.', 10, 'csgo.png', 'edYCtaNueQY'),
(6, 'Fifa 20', 'FIFA 20 es el simulador futbolístico que presenta EA Sports para la temporada 2019-2020 volcándose en esta ocasión no solo en competición profesional deportiva número uno del planeta, sino también en el fútbol callejero más auténtico a través de Volta, una de las principales novedades del videojuego frente a entregas pasadas. Además, desde Electronic Arts también garantizan un mayor realismo, sin precedentes, en todos los aspectos con Football Inteligence así como aún más opciones para crear el equipo de nuestros sueños en el exitoso modo FIFA: Ultimate Team.', 39.99, 'fifa.png', 'vgQNOIhRsV4'),
(7, 'Red Dead Redemption 2', 'Red Dead Redemption 2 es un videojuego de mundo abierto ambientado en el corazón de América en el año 1899 y desarrollado por Rockstar, creadores de GTA V y Red Dead Redemption entre otros premiados títulos de perfil sandbox. La historia de Arthur Morgan, (no Nate Harlow héroe de Red Dead Revolver, ni tampoco John Marston, el protagonista del Redemption original) es una aventura western con una extraordinaria atmósfera y ambientación muy cuidada y centrada en la naturaleza que, además de modo individual de juego, también presenta multijugador centrado en seguir la senda de GTA Online.<br><br>\r\n\r\nRDR 2 es una epopeya de vaqueros o western sólo en su envoltorio, pues como en todo juego de Rockstar, en su interior nos cuenta una hermosa y triste historia sobre gente que intenta cambiar y no siempre puede. En esta ocasión el videojuego Red Dead Redemption 2 está protagonizado por un bandolero, el mencionado Morgan, que es la mano derecha de Dutch Van der Linde, el líder de la banda de atracadores del mismo nombre, quienes se abren camino por un vasto y abrupto territorio norteamericano robando y luchando para sobrevivir. Siguiendo la estela de Grand Theft Auto 5, el título otorga una enorme importancia a los atracos a bancos, furgones blindados y trenes, con las típicas fases de planificación, ejecución y huida que se hicieron tan populares en la aventura de Trevor, Franklin y Michael. Excepcionales gráficos, música, acción, una historia adulta, un sentimiento muy cuidado de familia para la banda de forajidos, enormes posibilidades de interacción y de definir cómo queremos que sea nuestra historia y un mimo exquisito en la representación de los caballos son vitales en este Red Dead Redemption 2 que tiene fijada su fecha de lanzamiento en PS4 y Xbox One para el 26 de octubre de 2018. El juego de Rockstar tiene además una vertiente multijugador al estilo de GTA Online que recibe el nombre de Red Dead Online.', 61.99, 'rdr2.png', 'okZiu65HJcM'),
(8, 'The Last Of Us 2', 'The Last of Us 2 es un videojuego de acción y aventuras, con elementos de supervivencia, enmarcado en un mundo postapocalíptico donde habitan unos seres infectados. Al igual que la primera parte, esta continuación o Part II de The Last of Us busca hacerse fuerte en mecánicas jugables como la exploración o el combate con un fuerte elemento táctico, no sólo plantando cara a los zombies y criaturas de pesadilla de su mundo de infectados, sino también ofreciendo resistencia a los humanos... Peores en algunos casos que las más infernales de las criaturas.<br><br>\r\n\r\nEsta secuela de la premiada obra de Naughty Dog lanzada originalmente en 2013, promete una historia al nivel de sus personajes, de gran intensidad, desgarradora y emocional protagonizada por Ellie, aunque también hay partes jugables para Joel. Neil Druckmann, principal guionista del estudio creador de la serie Uncharted, ya ha prometido que la historia de The Last of Us: Part II girará alrededor del odio, en contraposición a un juego original donde la temática principal era el amor. The Last of Us 2 (TLoU2) es actualmente uno de los juegos más esperados de PS4 y PS4 Pro. ', 59.95, 'thelastofus.png', 'g3bfjtUpKPc'),
(9, 'Minecraft', 'Minecraft, más que un simple videojuego, es todo un fenómeno social, de hecho el segundo juego más vendido de la historia por detrás de Tetris es este sandbox diseñado por Markus \"Notch\" Persson y desarrollado por Mojang, más tarde adquirido por Microsoft. La propuesta invita a los jugadores a sobrevivir, crear y explorar un mundo abierto generado proceduralmente, dividido en biomas y compuesto íntegramente por bloques, tanto en personajes como entorno y objetos, confiriendo una estética pixel art a su mundo en 3D.\r\n<br><br>\r\nCon la libertad y la originalidad por bandera, Minecraft ofrece modo creativo con herramientas y bloques suficientes para construir casi cualquier mecanismo imaginable; así como un modo supervivencia donde los jugadores, en la piel de Steve, luchan sin parar contra los mobs (creepers, zombies, arañas, esqueletos, Enderman) por aguantar vivos un día más; y también compartir tales mundos en modo multijugador tanto cooperativo como PvP. Minecraft ha llevado su popularidad a consolas y compatibles de séptima y octava generación, y también posee un modo historia (Minecraft: Story Mode) desarrollado por Telltale Games.', 18.9, 'minecraft.png', 'MmB9b5njVbA'),
(10, 'Dragon Ball Z Kakarot', 'Dragon Ball Z Kakarot es un videojuego de rol y acción a cargo de Cyberconnect y Bandai Namco basado en la conocida marca Dragon Ball, que nos propone revivir los mejores momentos de la serie de Akira Toriyama con una gran aventura de rol que incluye, claro, emocionantes combates contra personajes tan icónicos como Vegeta, Raditz o Freezer. De hecho, el arco de Buu se incluirá en el juego.', 59.95, 'dragonball.png', 'Bf85wwJuFBE'),
(11, 'PlayerUnknown\'s Battlegrounds', 'Una auténtica Battle Royale es lo que promete el videojuego PlayerUnknown\'s Battlegrounds. Tienes total libertad para sembrar el caos en cada rincón de su extenso mapa y utilizar todas las armas disponibles para acabar con tus rivales sin que se den cuenta de tu mera presencia. La supervivencia es vital: cada minuto vivo es una victoria en el juego.\r\n<br>\r\nBattlegrounds es obra de Brendan Greene, todo un veterano que fue el principal desarrollador a cargo del Mod de ARMA Battle Royale y del King of the Hill de H1Z1. PlayerUnknown\'s Battlegrounds usa el motor gráfico Unreal Engine 4, y el juego hace mucho hincapié en el tema de las físicas para dar al jugador la experiencia battle royale más purista y sádica dentro de sus partidas dinámicas.\r\n<br>\r\nA simple vista PUBG puede parecer un shooter sin más, pero su esencia es que es un Battle Royale realista que avanza con la retroalimentación con la comunidad. En el juego comienzas de la nada, con los jugadores de pubg enfrentándose o luchando unos contra otros tratando de localizar armas y todo tipo de suministros que les permita ser el único sobreviviente.', 11.99, 'pubg.png', 'fuBajsiGVXE');

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

('alvaro', 'luro@gmail.com', '$2y$10$RALRZxsvynZMFfYRc8.7qurAAAjJyI4QOMf86mh4YQueFBLHH1RTK', 'Calle Extremadura, nº14'),
('sergio', 'sergio@gmail.com', '$2y$10$0Ba5pWaxsfchLPKEA07qbeCQ9x/KXX/.r63I9t4gJoEBbQeY4HUne', 'Calle Brasil,13');

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
