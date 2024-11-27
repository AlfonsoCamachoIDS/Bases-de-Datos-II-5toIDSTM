# Tarea: Crear tablas y cargar datos en SQL

**Maestro**: Arturo De Casso
**Materia:** Bases de Datos II  
**Fecha de Entrega:** 9 sept 24
**Fecha de Elaboracion:** 25 Nov 24

## Instrucciones

Cree las siguientes tablas, con sus tipos de dato respectivos, llaves primarias y foráneas, después cargue los datos correspondientes.
La primera línea de cada tabla indica como las columnas, ese linea no se carga. Se debe entregar el código SQL en bloc de notas. En Person, name es llave primaria.
En Serves, pizzeria es llave primaria. En Frequents, name es llave foránea a name en Person; pizzeria es llave foránea a pizzeria en Serves.
En Eats, name es llave foránea a name en Person. Las datos que son cadenas van entre comillas dobles "", se puede usar VARCHAR.

```Plain Text
Tabla Person
name, age, gender
"Amy",16,"female"
"Ben",21,"male"
"Cal",33,"male"
"Dan",13,"male"
"Eli",45,"male"
"Fay",21,"female"
"Gus",24,"male"
"Hil",30,"female"
"Ian",18,"male"

Tabla Serves
pizzeria, pizza, price
"Pizza Hut","pepperoni",12
"Pizza Hut","sausage",12
"Pizza Hut","cheese",9
"Pizza Hut","supreme",12
"Little Caesars","pepperoni",9.75
"Little Caesars","sausage",9.5
"Little Caesars","cheese",7
"Little Caesars","mushroom",9.25
"Dominos","cheese",9.75
"Dominos","mushroom",11
"Straw Hat","pepperoni",8
"Straw Hat","cheese",9.25
"Straw Hat","sausage",9.75
"New York Pizza","pepperoni",8
"New York Pizza","cheese",7
"New York Pizza","supreme",8.5
"Chicago Pizza","cheese",7.75
"Chicago Pizza","supreme",8.5

Tabla Frequents
name, pizzeria
"Amy","Pizza Hut"
"Ben","Pizza Hut"
"Ben","Chicago Pizza"
"Cal","Straw Hat"
"Cal","New York Pizza"
"Dan","Straw Hat"
"Dan","New York Pizza"
"Eli","Straw Hat"
"Eli","Chicago Pizza"
"Fay","Dominos"
"Fay","Little Caesars"
"Gus","Chicago Pizza"
"Gus","Pizza Hut"
"Hil","Dominos"
"Hil","Straw Hat"
"Hil","Pizza Hut"
"Ian","New York Pizza"
"Ian","Straw Hat"
"Ian","Dominos"

Tabla Eats
name, pizza
"Amy","pepperoni"
"Amy","mushroom"
"Ben","pepperoni"
"Ben","cheese"
"Cal","supreme"
"Dan","pepperoni"
"Dan","cheese"
"Dan","sausage"
"Dan","supreme"
"Dan","mushroom"
"Eli","supreme"
"Eli","cheese"
"Fay","mushroom"
"Gus","mushroom"
"Gus","supreme"
"Gus","cheese"
"Hil","supreme"
"Hil","cheese"
"Ian","supreme"
"Ian","pepperoni"
```

## Desarrollo

```SQL
-- Crear la tabla Person
CREATE TABLE Person (
    name VARCHAR(50) PRIMARY KEY,
    age INT,
    gender VARCHAR(10)
);

-- Insertar datos en la tabla Person
INSERT INTO Person (name, age, gender) VALUES ("Amy", 16, "female");
INSERT INTO Person (name, age, gender) VALUES ("Ben", 21, "male");
INSERT INTO Person (name, age, gender) VALUES ("Cal", 33, "male");
INSERT INTO Person (name, age, gender) VALUES ("Dan", 13, "male");
INSERT INTO Person (name, age, gender) VALUES ("Eli", 45, "male");
INSERT INTO Person (name, age, gender) VALUES ("Fay", 21, "female");
INSERT INTO Person (name, age, gender) VALUES ("Gus", 24, "male");
INSERT INTO Person (name, age, gender) VALUES ("Hil", 30, "female");
INSERT INTO Person (name, age, gender) VALUES ("Ian", 18, "male");

-- Crear la tabla Serves con clave primaria compuesta
CREATE TABLE Serves (
    pizzeria VARCHAR(50),
    pizza VARCHAR(50),
    price DECIMAL(5,2),
    PRIMARY KEY (pizzeria, pizza)
);

-- Insertar datos en la tabla Serves
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Pizza Hut", "pepperoni", 12);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Pizza Hut", "sausage", 12);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Pizza Hut", "cheese", 9);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Pizza Hut", "supreme", 12);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Little Caesars", "pepperoni", 9.75);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Little Caesars", "sausage", 9.5);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Little Caesars", "cheese", 7);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Little Caesars", "mushroom", 9.25);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Dominos", "cheese", 9.75);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Dominos", "mushroom", 11);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Straw Hat", "pepperoni", 8);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Straw Hat", "cheese", 9.25);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Straw Hat", "sausage", 9.75);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("New York Pizza", "pepperoni", 8);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("New York Pizza", "cheese", 7);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("New York Pizza", "supreme", 8.5);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Chicago Pizza", "cheese", 7.75);
INSERT INTO Serves (pizzeria, pizza, price) VALUES ("Chicago Pizza", "supreme", 8.5);

-- Crear la tabla Frequents
CREATE TABLE Frequents (
    name VARCHAR(50),
    pizzeria VARCHAR(50),
    FOREIGN KEY (name) REFERENCES Person(name),
    FOREIGN KEY (pizzeria) REFERENCES Serves(pizzeria)
);

-- Insertar datos en la tabla Frequents
INSERT INTO Frequents (name, pizzeria) VALUES ("Amy", "Pizza Hut");
INSERT INTO Frequents (name, pizzeria) VALUES ("Ben", "Pizza Hut");
INSERT INTO Frequents (name, pizzeria) VALUES ("Ben", "Chicago Pizza");
INSERT INTO Frequents (name, pizzeria) VALUES ("Cal", "Straw Hat");
INSERT INTO Frequents (name, pizzeria) VALUES ("Cal", "New York Pizza");
INSERT INTO Frequents (name, pizzeria) VALUES ("Dan", "Straw Hat");
INSERT INTO Frequents (name, pizzeria) VALUES ("Dan", "New York Pizza");
INSERT INTO Frequents (name, pizzeria) VALUES ("Eli", "Straw Hat");
INSERT INTO Frequents (name, pizzeria) VALUES ("Eli", "Chicago Pizza");
INSERT INTO Frequents (name, pizzeria) VALUES ("Fay", "Dominos");
INSERT INTO Frequents (name, pizzeria) VALUES ("Fay", "Little Caesars");
INSERT INTO Frequents (name, pizzeria) VALUES ("Gus", "Chicago Pizza");
INSERT INTO Frequents (name, pizzeria) VALUES ("Gus", "Pizza Hut");
INSERT INTO Frequents (name, pizzeria) VALUES ("Hil", "Dominos");
INSERT INTO Frequents (name, pizzeria) VALUES ("Hil", "Straw Hat");
INSERT INTO Frequents (name, pizzeria) VALUES ("Hil", "Pizza Hut");
INSERT INTO Frequents (name, pizzeria) VALUES ("Ian", "New York Pizza");
INSERT INTO Frequents (name, pizzeria) VALUES ("Ian", "Straw Hat");
INSERT INTO Frequents (name, pizzeria) VALUES ("Ian", "Dominos");


-- Crear la tabla Eats
CREATE TABLE Eats (
    name VARCHAR(50),
    pizza VARCHAR(50),
    FOREIGN KEY (name) REFERENCES Person(name)
);

-- Insertar datos en la tabla Eats
INSERT INTO Eats (name, pizza) VALUES ("Amy", "pepperoni");
INSERT INTO Eats (name, pizza) VALUES ("Amy", "mushroom");
INSERT INTO Eats (name, pizza) VALUES ("Ben", "pepperoni");
INSERT INTO Eats (name, pizza) VALUES ("Ben", "cheese");
INSERT INTO Eats (name, pizza) VALUES ("Cal", "supreme");
INSERT INTO Eats (name, pizza) VALUES ("Dan", "pepperoni");
INSERT INTO Eats (name, pizza) VALUES ("Dan", "cheese");
INSERT INTO Eats (name, pizza) VALUES ("Dan", "sausage");
INSERT INTO Eats (name, pizza) VALUES ("Dan", "supreme");
INSERT INTO Eats (name, pizza) VALUES ("Dan", "mushroom");
INSERT INTO Eats (name, pizza) VALUES ("Eli", "supreme");
INSERT INTO Eats (name, pizza) VALUES ("Eli", "cheese");
INSERT INTO Eats (name, pizza) VALUES ("Fay", "mushroom");
INSERT INTO Eats (name, pizza) VALUES ("Gus", "mushroom");
INSERT INTO Eats (name, pizza) VALUES ("Gus", "supreme");
INSERT INTO Eats (name, pizza) VALUES ("Gus", "cheese");
INSERT INTO Eats (name, pizza) VALUES ("Hil", "supreme");
INSERT INTO Eats (name, pizza) VALUES ("Hil", "cheese");
INSERT INTO Eats (name, pizza) VALUES ("Ian", "supreme");
INSERT INTO Eats (name, pizza) VALUES ("Ian", "pepperoni");
```

## Conclusión

Estos comando sirven para crar las tablas correspondientes a la tarea.
