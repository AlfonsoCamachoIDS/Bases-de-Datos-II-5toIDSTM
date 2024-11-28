-- Crear la tabla 'numbersfor'
CREATE TABLE numbersfor (
    num INT
);

-- Crear el procedimiento para realizar el bucle FOR
DELIMITER //

CREATE PROCEDURE InsertNumbersWithFor()
BEGIN
    DECLARE i INT; -- Declarar la variable de control

    -- Inicializar la variable y realizar el bucle equivalente al FOR
    SET i = 1;
    WHILE i <= 10 DO
        INSERT INTO numbersfor (num) VALUES (i); -- Insertar el valor de 'i' en la tabla
        SET i = i + 1; -- Incrementar el valor de 'i'
    END WHILE;
END;
//

DELIMITER ;

-- Llamar al procedimiento
CALL InsertNumbersWithFor();

-- Consultar los datos insertados
SELECT * FROM numbersfor;
