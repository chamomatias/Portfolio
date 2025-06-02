-- **************************************************************
-- Función 1: calcular_volumen_paquete
-- Calcula el volumen (en cm³) de un paquete dado su ID
-- **************************************************************

DELIMITER //

CREATE FUNCTION calcular_volumen_paquete(p_id_paquete INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_alto DECIMAL(10,2);
    DECLARE v_ancho DECIMAL(10,2);
    DECLARE v_largo DECIMAL(10,2);
    DECLARE v_volumen DECIMAL(10,2);

    -- Obtener alto, ancho y largo del paquete
    SELECT alto, ancho, largo 
    INTO v_alto, v_ancho, v_largo
    FROM detalle_paquete
    WHERE id_paquete = p_id_paquete;

    -- Calcular volumen
    SET v_volumen = v_alto * v_ancho * v_largo;
    RETURN v_volumen;
END;
//

DELIMITER ;

-- **************************************************************
-- Función 2: calcular_total_envios_cliente
-- Devuelve el número total de envíos realizados por un cliente
-- **************************************************************

DELIMITER //

CREATE FUNCTION calcular_total_envios_cliente(p_id_cliente INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    -- Contar los envíos realizados por el cliente
    SELECT COUNT(*) 
    INTO total
    FROM envios
    WHERE id_cliente = p_id_cliente;

    RETURN total;
END;
//

DELIMITER ;
