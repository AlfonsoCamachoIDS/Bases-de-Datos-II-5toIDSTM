-- Crear la tabla 'numbercursors'
CREATE TABLE numberscursor (
    num INT
);

-- Insertar datos iniciales en la tabla
INSERT INTO numberscursor (num) VALUES (1), (2), (3), (4), (5), (6);

-- Crear el procedimiento con cursor
DELIMITER //

CREATE PROCEDURE UseCursor()
BEGIN
    DECLARE done INT DEFAULT FALSE; -- Indicador para terminar el cursor
    DECLARE current_num INT; -- Variable para almacenar el valor actual del cursor

    -- Declarar el cursor
    DECLARE c CURSOR FOR SELECT num FROM numberscursor;

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

        -- Insertar el doble del valor en la tabla
        INSERT INTO numberscursor (num) VALUES (current_num * 2);
    END LOOP;

    -- Cerrar el cursor
    CLOSE c;
END;
//

DELIMITER ;

-- Llamar al procedimiento
CALL UseCursor();

-- Consultar los datos actualizados
SELECT * FROM numberscursor;
