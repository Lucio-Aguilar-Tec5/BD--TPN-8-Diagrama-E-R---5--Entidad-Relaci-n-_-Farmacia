SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` tinytext NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `con_credito` tinyint(1) NOT NULL,
  `id_datos_bancarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `datos_bancarios` (
  `id_datos_bancarios` int(11) NOT NULL,
  `titular` tinytext NOT NULL,
  `numero_tarjeta` varchar(20) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `codigo_seguridad` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `familias` (
  `id_codigo_familia` int(11) NOT NULL,
  `nombre_familia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `laboratorios` (
  `id_codigo_laboratorio` int(11) NOT NULL,
  `nombre_laboratorio` varchar(30) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `fax` varchar(30) NOT NULL,
  `nombre_contacto` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `medicamentos` (
  `id_codigo_medicamento` int(11) NOT NULL,
  `nombre_medicamento` varchar(30) NOT NULL,
  `tipo_medicamento` tinytext NOT NULL,
  `unidades_stock` int(11) NOT NULL,
  `unidades_vendidas` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `requiere_receta` tinyint(1) NOT NULL,
  `id_codigo_laboratorio` int(11) NOT NULL,
  `id_codigo_familia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `metodo_pago` varchar(20) NOT NULL,
  `fecha_compra` datetime NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `unidades_compradas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `pedidos` (
  `id_pago` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_codigo_medicamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

ALTER TABLE `datos_bancarios`
  ADD PRIMARY KEY (`id_datos_bancarios`);

ALTER TABLE `familias`
  ADD PRIMARY KEY (`id_codigo_familia`);

ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`id_codigo_laboratorio`);

ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id_codigo_medicamento`);

ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`);
COMMIT;