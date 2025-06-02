-- **************************************************************
-- Procedimiento 1: registrar_envio
-- Inserta un nuevo envío en la tabla 'envios'
-- **************************************************************

DELIMITER //

CREATE PROCEDURE registrar_envio(
    IN p_id_cliente INT,
    IN p_id_tipo_envio INT,
    IN p_fecha DATE,
    IN p_origen INT,
    IN p_destino INT,
    IN p_costo DECIMAL(10,2),
    IN p_estado_actual INT
)
BEGIN
    INSERT INTO envios (
        id_cliente, id_tipo_envio, fecha_solicitud, origen, destino, estado_actual, costo_envio
    ) VALUES (
        p_id_cliente, p_id_tipo_envio, p_fecha, p_origen, p_destino, p_estado_actual, p_costo
    );
END;
//

DELIMITER ;

-- **************************************************************
-- Procedimiento 2: registrar_reclamo
-- Crea un reclamo asociado a un envío existente
-- **************************************************************

DELIMITER //

CREATE PROCEDURE registrar_reclamo(
    IN p_id_envio INT,
    IN p_fecha DATE,
    IN p_tipo_reclamo VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_estado VARCHAR(50)
)
BEGIN
    INSERT INTO reclamos (
        id_envio, fecha_reclamo, tipo_reclamo, descripcion, estado
    ) VALUES (
        p_id_envio, p_fecha, p_tipo_reclamo, p_descripcion, p_estado
    );
END;
//

DELIMITER ;
