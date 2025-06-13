-- Crear la BD
CREATE DATABASE MotoresPredictivo;
GO

USE MotoresPredictivo;

-- Creo las tablas

CREATE TABLE sensores (
    fecha DATE,
    motor_id VARCHAR(10),
    corriente FLOAT,
    temperatura FLOAT,
    vibracion FLOAT
);

CREATE TABLE mantenimiento (
    motor_id VARCHAR(10),
    fecha_mtto DATE,
    tipo_mtto VARCHAR(50)
);


CREATE TABLE fallas (
    motor_id VARCHAR(10),
    fecha_falla DATE,
    tipo_falla VARCHAR(50)
);


-- Importamos los CSVs

-- Unimos las tablas en una tabla maestra

SELECT 
    s.fecha,
    s.motor_id,
    s.corriente,
    s.temperatura,
    s.vibracion,
    m.tipo_mtto,
    m.fecha_mtto,
    f.tipo_falla,
    f.fecha_falla,
    CASE 
        WHEN f.fecha_falla BETWEEN s.fecha AND DATEADD(DAY, 30, s.fecha)
        THEN 1 ELSE 0
    END AS falla_en_30_dias
INTO sensores_maestra
FROM sensores s
LEFT JOIN mantenimiento m
    ON s.motor_id = m.motor_id AND s.fecha = m.fecha_mtto
LEFT JOIN fallas f
    ON s.motor_id = f.motor_id;
