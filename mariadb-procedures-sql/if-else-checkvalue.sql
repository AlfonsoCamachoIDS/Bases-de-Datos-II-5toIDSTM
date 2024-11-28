
-- Creacion del procedimiento almacenado
DELIMITER //

CREATE PROCEDURE CheckValue() -- Nombre del procedimiento almacenado
BEGIN
    DECLARE x INT DEFAULT 6; -- Declaracion de variable

    IF x > 7 THEN -- Inicio de la condicion
        SELECT 'Good' AS result;
    ELSEIF x > 4 THEN -- Uso de ELSEIF 
        SELECT 'Average' AS result;
    ELSE -- Uso de ELSE en caso de no ser ninguna de las condiciones anteriores
        SELECT 'Bad' AS result;
    END IF; -- Fin de la condicion
END; -- Fin del procedimiento almacenado
//

DELIMITER ; -- Fin del delimidador para MariaDB

		test
		
-- Llamada al procedimiento almacenado
CALL CheckValue();
