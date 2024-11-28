-- Crear la tabla 'numbers'
CREATE TABLE numbersCombining (
    num INT
);

-- Insertar datos iniciales en la tabla
INSERT INTO numbersCombining (num) VALUES (1), (2), (3), (4), (5);

-- Crear un procedimiento que usa cursor y lógica IF-ELSE
DELIMITER //

CREATE PROCEDURE ProcessNumbers()
BEGIN
    DECLARE done INT DEFAULT FALSE; -- Indicador para terminar el cursor
    DECLARE current_num INT; -- Variable para almacenar el valor actual del cursor

    -- Declarar el cursor
    DECLARE c CURSOR FOR SELECT num FROM numbersCombining;

    -- Manejo del fin del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Abrir el cursor
    OPEN c;

    -- Leer fila por fila
    read_loop: LOOP
        FETCH c INTO current_num; -- Obtener el valor actual
        IF done THEN
            LEAVE read_loop; -- Salir del bucle si no hay más filas
        END IF;

        -- Condición para insertar valores
        IF current_num % 2 = 0 THEN
            INSERT INTO numbersCombining (num) VALUES (2);
        ELSE
            INSERT INTO numbersCombining (num) VALUES (1);
        END IF;
    END LOOP;

    -- Cerrar el cursor
    CLOSE c;
END;
//

DELIMITER ;

-- Llamar al procedimiento
CALL ProcessNumbers();

-- Consultar los datos actualizados
SELECT * FROM numbersCombining;
