-- **************************************************************
-- Trigger 1: after_insert_reclamo
-- Registra automáticamente un log cada vez que se inserta un reclamo
-- **************************************************************

DELIMITER //

CREATE TRIGGER after_insert_reclamo
AFTER INSERT ON reclamos
FOR EACH ROW
BEGIN
    INSERT INTO log_errores (fecha, operacion, detalle, usuario)
    VALUES (
        NOW(),  -- Fecha y hora actual
        'INSERT reclamo',  -- Tipo de operación
        CONCAT('Reclamo ID: ', NEW.id_reclamo, ' creado. Tipo: ', NEW.tipo_reclamo),  -- Detalle del reclamo
        'sistema'  -- Usuario generador del log (automático)
    );
END;
//

DELIMITER ;

-- **************************************************************
-- Trigger 2: before_delete_envio
-- Previene que se eliminen envíos con estado 'entregado'
-- **************************************************************

DELIMITER //

CREATE TRIGGER before_delete_envio
BEFORE DELETE ON envios
FOR EACH ROW
BEGIN
    DECLARE estado_nombre VARCHAR(50);

    -- Obtener el nombre del estado del envío antes de eliminar
    SELECT descripcion INTO estado_nombre
    FROM estados_envio
    WHERE id_estado = OLD.estado_actual;

    -- Si el estado es 'entregado', lanzar un error y cancelar el DELETE
    IF estado_nombre = 'entregado' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar un envío que ya fue entregado.';
    END IF;
END;
//

DELIMITER ;
