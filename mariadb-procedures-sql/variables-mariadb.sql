-- La forma en que se declaran variables en MariaDB SIN PL/SQL de Oracle
-- Declarar variables
SET @x = NULL;
SET @y = 3;

-- Asignar valores y realizar operaciones
SET @x = 2;
SELECT (@x + @y) AS result;
