-- Crear la tabla 'numbers'
CREATE TABLE numbers (
    num INT
);

-- Crear el procedimiento para realizar el bucle
DELIMITER //

CREATE PROCEDURE InsertNumbers()
BEGIN
    DECLARE i INT DEFAULT 1; -- Declarar la variable de control

    WHILE i <= 10 DO
        INSERT INTO numbers (num) VALUES (i); -- Insertar el valor de 'i' en la tabla
        SET i = i + 1; -- Incrementar el valor de 'i'
    END WHILE;
END;
//

DELIMITER ;

-- Llamar al procedimiento
CALL InsertNumbers();

-- Consultar los datos insertados
SELECT * FROM numbers;
