-- **************************************************************
-- Script de creación de base de datos
-- Proyecto Final: Sistema de Logística de Envíos
-- Nombre: SQL_Proyecto_Final
-- Autor: [Tu Nombre]
-- Fecha: [Fecha actual]
-- **************************************************************

-- Si existe una base con el mismo nombre, se elimina (opcional)
DROP DATABASE IF EXISTS SQL_Proyecto_Final;

-- Se crea la base de datos principal del proyecto
CREATE DATABASE SQL_Proyecto_Final;

-- Se selecciona la base de datos para comenzar a trabajar
USE SQL_Proyecto_Final;

-- **************************************************************
-- NOTA:
-- A partir de este punto se comenzará con la creación
-- de las tablas del modelo relacional diseñado.
-- **************************************************************

-- **************************************************************
-- Tabla: clientes
-- Descripción: Almacena información de los clientes que solicitan envíos
-- **************************************************************
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,               -- Clave primaria autoincremental
    nombre VARCHAR(100) NOT NULL,                            -- Nombre del cliente
    apellido VARCHAR(100) NOT NULL,                          -- Apellido del cliente
    dni VARCHAR(20) UNIQUE NOT NULL,                         -- Documento de identidad
    email VARCHAR(100),                                      -- Correo electrónico
    telefono VARCHAR(20),                                    -- Teléfono de contacto
    direccion VARCHAR(150),                                  -- Dirección del cliente
    localidad VARCHAR(100),                                  -- Localidad
    provincia VARCHAR(100)                                   -- Provincia
);

-- **************************************************************
-- Tabla: sucursales
-- Descripción: Contiene los datos de las sucursales de la empresa
-- **************************************************************
CREATE TABLE sucursales (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,              -- Clave primaria
    nombre VARCHAR(100) NOT NULL,                            -- Nombre o denominación de la sucursal
    direccion VARCHAR(150),                                  -- Dirección física
    provincia VARCHAR(100),                                  -- Provincia
    telefono VARCHAR(20),                                    -- Teléfono de contacto
    email VARCHAR(100)                                       -- Correo electrónico
);

-- **************************************************************
-- Tabla: empleados
-- Descripción: Registra los empleados asignados a las distintas sucursales
-- **************************************************************
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,              -- Clave primaria
    nombre VARCHAR(100) NOT NULL,                            -- Nombre del empleado
    apellido VARCHAR(100) NOT NULL,                          -- Apellido del empleado
    rol VARCHAR(50),                                         -- Rol o cargo (chofer, operador, etc.)
    email VARCHAR(100),                                      -- Correo electrónico
    telefono VARCHAR(20),                                    -- Teléfono
    id_sucursal INT,                                         -- Sucursal a la que pertenece
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)  -- FK hacia sucursales
);

-- **************************************************************
-- Tabla: vehiculos
-- Descripción: Vehículos utilizados para los envíos logísticos
-- **************************************************************
CREATE TABLE vehiculos (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,              -- Clave primaria
    patente VARCHAR(20) NOT NULL UNIQUE,                     -- Patente del vehículo
    marca VARCHAR(50),                                       -- Marca del vehículo
    modelo VARCHAR(50),                                      -- Modelo
    capacidad_kg INT,                                        -- Capacidad de carga en kg
    estado VARCHAR(20),                                      -- Estado: activo/inactivo
    id_sucursal INT,                                         -- FK hacia sucursal de base
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

-- **************************************************************
-- Tabla: zonas
-- Descripción: Define las zonas de destino utilizadas en los envíos
-- **************************************************************
CREATE TABLE zonas (
    id_zona INT AUTO_INCREMENT PRIMARY KEY,                  -- Clave primaria
    nombre_zona VARCHAR(100) NOT NULL,                       -- Nombre de la zona
    provincia VARCHAR(100)                                   -- Provincia correspondiente
);

-- **************************************************************
-- Tabla: tipos_envio
-- Descripción: Define los tipos de envío disponibles (urgente, estándar, etc.)
-- **************************************************************
CREATE TABLE tipos_envio (
    id_tipo_envio INT AUTO_INCREMENT PRIMARY KEY,            -- Clave primaria
    descripcion VARCHAR(50) NOT NULL,                        -- Descripción del tipo de envío
    tiempo_estimado_dias INT                                 -- Tiempo estimado en días
);

-- **************************************************************
-- Tabla: estados_envio
-- Descripción: Estados posibles que puede tener un envío
-- **************************************************************
CREATE TABLE estados_envio (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,                -- Clave primaria
    descripcion VARCHAR(50) NOT NULL                         -- Estado: pendiente, en tránsito, entregado, cancelado, etc.
);

-- **************************************************************
-- Tabla: envios
-- Descripción: Registro principal de cada pedido de envío realizado por los clientes
-- **************************************************************
CREATE TABLE envios (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,                 -- Clave primaria
    id_cliente INT NOT NULL,                                 -- Cliente que solicita el envío
    id_tipo_envio INT NOT NULL,                              -- Tipo de envío elegido
    fecha_solicitud DATE NOT NULL,                           -- Fecha de solicitud del envío
    origen INT NOT NULL,                                     -- Sucursal origen (FK)
    destino INT NOT NULL,                                    -- Zona de destino (FK)
    estado_actual INT NOT NULL,                              -- Estado actual del envío (FK)
    costo_envio DECIMAL(10,2),                               -- Costo del servicio de envío
    id_asignacion INT,                                       -- Asignación de vehículo y chofer (FK opcional)
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_tipo_envio) REFERENCES tipos_envio(id_tipo_envio),
    FOREIGN KEY (origen) REFERENCES sucursales(id_sucursal),
    FOREIGN KEY (destino) REFERENCES zonas(id_zona),
    FOREIGN KEY (estado_actual) REFERENCES estados_envio(id_estado)
    -- FK hacia id_asignacion se agregará luego cuando exista la tabla asignaciones
);

-- **************************************************************
-- Tabla: detalle_paquete
-- Descripción: Detalles físicos y valor de cada paquete enviado
-- **************************************************************
CREATE TABLE detalle_paquete (
    id_paquete INT AUTO_INCREMENT PRIMARY KEY,               -- Clave primaria
    id_envio INT NOT NULL,                                   -- Enlace al envío correspondiente
    descripcion VARCHAR(255),                                -- Descripción del contenido
    peso DECIMAL(10,2),                                      -- Peso en kilogramos
    alto DECIMAL(10,2),                                      -- Alto en cm
    ancho DECIMAL(10,2),                                     -- Ancho en cm
    largo DECIMAL(10,2),                                     -- Largo en cm
    valor_declarado DECIMAL(10,2),                           -- Valor monetario declarado
    FOREIGN KEY (id_envio) REFERENCES envios(id_envio)
);

-- **************************************************************
-- Tabla: seguimiento_envio
-- Descripción: Historial de estados por los que pasa cada envío
-- **************************************************************
CREATE TABLE seguimiento_envio (
    id_seguimiento INT AUTO_INCREMENT PRIMARY KEY,           -- Clave primaria
    id_envio INT NOT NULL,                                   -- Enlace al envío
    id_estado INT NOT NULL,                                  -- Estado registrado en este paso
    id_sucursal INT,                                         -- Sucursal donde se registra el estado (opcional)
    fecha_evento DATETIME NOT NULL,                          -- Fecha y hora del evento
    observacion VARCHAR(255),                                -- Comentarios adicionales (opcional)
    FOREIGN KEY (id_envio) REFERENCES envios(id_envio),
    FOREIGN KEY (id_estado) REFERENCES estados_envio(id_estado),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

-- **************************************************************
-- Tabla: rutas
-- Descripción: Define rutas posibles entre sucursales, incluyendo distancia
-- **************************************************************
CREATE TABLE rutas (
    id_ruta INT AUTO_INCREMENT PRIMARY KEY,                  -- Clave primaria
    origen INT NOT NULL,                                     -- Sucursal de origen (FK)
    destino INT NOT NULL,                                    -- Sucursal de destino (FK)
    distancia_km INT,                                        -- Distancia estimada entre ambas sucursales
    FOREIGN KEY (origen) REFERENCES sucursales(id_sucursal),
    FOREIGN KEY (destino) REFERENCES sucursales(id_sucursal)
);

-- **************************************************************
-- Tabla: asignaciones
-- Descripción: Relación entre vehículos y empleados asignados a un envío
-- **************************************************************
CREATE TABLE asignaciones (
    id_asignacion INT AUTO_INCREMENT PRIMARY KEY,            -- Clave primaria
    id_vehiculo INT NOT NULL,                                -- Vehículo utilizado en la asignación
    id_empleado INT NOT NULL,                                -- Empleado responsable (ej. chofer)
    fecha_asignacion DATE NOT NULL,                          -- Fecha en que se asignó el recurso
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- **************************************************************
-- Tabla: reclamos
-- Descripción: Registro de reclamos realizados por los clientes sobre sus envíos
-- **************************************************************
CREATE TABLE reclamos (
    id_reclamo INT AUTO_INCREMENT PRIMARY KEY,               -- Clave primaria
    id_envio INT NOT NULL,                                   -- Envío relacionado al reclamo
    fecha_reclamo DATE NOT NULL,                             -- Fecha del reclamo
    tipo_reclamo VARCHAR(100),                               -- Tipo de reclamo (demora, extravío, daño, etc.)
    descripcion TEXT,                                        -- Descripción del problema
    estado VARCHAR(50),                                      -- Estado del reclamo (pendiente, resuelto, cerrado, etc.)
    FOREIGN KEY (id_envio) REFERENCES envios(id_envio)
);

-- **************************************************************
-- Tabla: usuarios_sistema
-- Descripción: Usuarios con acceso al sistema (administradores, operadores)
-- **************************************************************
CREATE TABLE usuarios_sistema (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,               -- Clave primaria
    username VARCHAR(50) UNIQUE NOT NULL,                    -- Nombre de usuario
    email VARCHAR(100),                                      -- Correo electrónico
    password_hash VARCHAR(255) NOT NULL,                     -- Hash de contraseña
    rol VARCHAR(50)                                          -- Rol del usuario (admin, operador, supervisor)
);

-- **************************************************************
-- Tabla: log_errores
-- Descripción: Registro de errores o eventos relevantes en el sistema
-- **************************************************************
CREATE TABLE log_errores (
    id_log INT AUTO_INCREMENT PRIMARY KEY,                   -- Clave primaria
    fecha DATETIME NOT NULL,                                 -- Fecha y hora del evento
    operacion VARCHAR(100),                                  -- Operación que produjo el error
    detalle TEXT,                                            -- Detalle del error o mensaje
    usuario VARCHAR(100)                                     -- Usuario que generó la acción (si aplica)
);


-- **************************************************************
-- Inserción de datos de prueba
-- Proyecto Final: Sistema de Logística de Envíos
-- **************************************************************

-- Tabla: clientes
INSERT INTO clientes (nombre, apellido, dni, email, telefono, direccion, localidad, provincia) VALUES
('Juan', 'Pérez', '30123456', 'juan.perez@email.com', '1134567890', 'Calle Falsa 123', 'CABA', 'Buenos Aires'),
('Laura', 'Gómez', '30987654', 'laura.gomez@email.com', '1145678901', 'Av. Siempre Viva 742', 'Lanús', 'Buenos Aires');

-- Tabla: sucursales
INSERT INTO sucursales (nombre, direccion, provincia, telefono, email) VALUES
('Sucursal Central', 'Av. Corrientes 1000', 'Buenos Aires', '1140000000', 'central@logistica.com'),
('Sucursal Oeste', 'Av. Rivadavia 4000', 'Buenos Aires', '1141111111', 'oeste@logistica.com');

-- Tabla: empleados
INSERT INTO empleados (nombre, apellido, rol, email, telefono, id_sucursal) VALUES
('Carlos', 'Martínez', 'Chofer', 'carlos.martinez@logistica.com', '1155551111', 1),
('María', 'López', 'Operador', 'maria.lopez@logistica.com', '1155552222', 2);

-- Tabla: vehiculos
INSERT INTO vehiculos (patente, marca, modelo, capacidad_kg, estado, id_sucursal) VALUES
('AA123BB', 'Fiat', 'Fiorino', 600, 'activo', 1),
('AB456CD', 'Peugeot', 'Partner', 800, 'activo', 2);

-- Tabla: zonas
INSERT INTO zonas (nombre_zona, provincia) VALUES
('Zona Norte', 'Buenos Aires'),
('Zona Sur', 'Buenos Aires');
