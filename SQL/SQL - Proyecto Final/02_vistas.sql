-- **************************************************************
-- Vista 1: vista_envios_por_cliente
-- Muestra todos los envíos realizados por cada cliente con información básica
-- **************************************************************
CREATE VIEW vista_envios_por_cliente AS
SELECT 
    c.id_cliente,
    CONCAT(c.nombre, ' ', c.apellido) AS cliente,
    e.id_envio,
    e.fecha_solicitud,
    e.costo_envio,
    ee.descripcion AS estado
FROM envios e
JOIN clientes c ON e.id_cliente = c.id_cliente
JOIN estados_envio ee ON e.estado_actual = ee.id_estado;

-- **************************************************************
-- Vista 2: vista_envios_por_sucursal_origen
-- Reporta los envíos salidos por sucursal origen y su tipo
-- **************************************************************
CREATE VIEW vista_envios_por_sucursal_origen AS
SELECT 
    s.nombre AS sucursal_origen,
    te.descripcion AS tipo_envio,
    COUNT(e.id_envio) AS total_envios
FROM envios e
JOIN sucursales s ON e.origen = s.id_sucursal
JOIN tipos_envio te ON e.id_tipo_envio = te.id_tipo_envio
GROUP BY s.nombre, te.descripcion;

-- **************************************************************
-- Vista 3: vista_asignaciones_detalle
-- Muestra detalle de asignaciones de vehículo y chofer
-- **************************************************************
CREATE VIEW vista_asignaciones_detalle AS
SELECT 
    a.id_asignacion,
    e.nombre AS chofer,
    e.apellido AS chofer_apellido,
    v.patente,
    v.marca,
    v.modelo,
    a.fecha_asignacion
FROM asignaciones a
JOIN empleados e ON a.id_empleado = e.id_empleado
JOIN vehiculos v ON a.id_vehiculo = v.id_vehiculo;

-- **************************************************************
-- Vista 4: vista_envios_con_zona_destino
-- Asocia envíos con nombre de zona y provincia destino
-- **************************************************************
CREATE VIEW vista_envios_con_zona_destino AS
SELECT 
    e.id_envio,
    z.nombre_zona,
    z.provincia,
    e.fecha_solicitud,
    e.costo_envio
FROM envios e
JOIN zonas z ON e.destino = z.id_zona;

-- **************************************************************
-- Vista 5: vista_historial_estados_envio
-- Muestra el historial completo de estados de cada envío
-- **************************************************************
CREATE VIEW vista_historial_estados_envio AS
SELECT 
    se.id_envio,
    ee.descripcion AS estado,
    s.nombre AS sucursal,
    se.fecha_evento,
    se.observacion
FROM seguimiento_envio se
JOIN estados_envio ee ON se.id_estado = ee.id_estado
LEFT JOIN sucursales s ON se.id_sucursal = s.id_sucursal
ORDER BY se.id_envio, se.fecha_evento;
