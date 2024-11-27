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
-- Creacion de Base de Datos Prueba2
--
create database test2;

-- Seleccion Base de Datos como Area de Trabajo Prueba2
--
use test2;

-- Creacion de Tabla Person e Inserccion de Datos en ella (forma 1).
--
create table person (
    name varchar(60) primary key,
    age int check(age >= 0),
    gender varchar(10)
);
insert into person (name, age, gender) values ("Amy", 16, "female");
insert into person (name, age, gender) values ("Ben", 21, "male");
insert into person (name, age, gender) values ("Cal", 33, "male ");
insert into person (name, age, gender) values ("Dan", 13, "male");
insert into person (name, age, gender) values ("Eli", 45, "male");
insert into person (name, age, gender) values ("Fay", 21, "female");
insert into person (name, age, gender) values ("Gus", 24, "male");
insert into person (name, age, gender) values ("Hil", 30, "female");
insert into person (name, age, gender) values ("Ian", 18, "male");

-- Creacion de Tabla Serves e Inserccion de Datos en ella (forma 2, preferida).
--
create table serves (
    pizzeria varchar(60),
    pizza varchar(60),
    price decimal(5, 2) check (price >= 0),
    primary key (pizzeria, pizza)
);
insert into serves (pizzeria, pizza, price) values
    ('Pizza Hut', 'pepperoni', 12),
    ('Pizza Hut', 'sausage', 12),
    ('Pizza Hut', 'cheese', 9),
    ('Pizza Hut', 'supreme', 12),
    ('Little Caesars', 'pepperoni', 9.75),
    ('Little Caesars', 'sausage', 9.5),
    ('Little Caesars', 'cheese', 7),
    ('Little Caesars', 'mushroom', 9.25),
    ('Dominos', 'cheese', 9.75),
    ('Dominos', 'mushroom', 11),
    ('Straw Hat', 'pepperoni', 8),
    ('Straw Hat', 'cheese', 9.25),
    ('Straw Hat', 'sausage', 9.75),
    ('New York Pizza', 'pepperoni', 8),
    ('New York Pizza', 'cheese', 7),
    ('New York Pizza', 'supreme', 8.5),
    ('Chicago Pizza', 'cheese', 7.75),
    ('Chicago Pizza', 'supreme', 8.5);

-- Creacion de Tabla Eats e inserccion de Datos en ella.
--
create table eats (
    name varchar(60),
    pizza varchar(60),
    foreign key (name) references person(name)
);
insert into eats (name, pizza) values
    ('Amy', 'pepperoni'),
    ('Amy', 'mushroom'),
    ('Ben', 'pepperoni'),
    ('Ben', 'cheese'),
    ('Cal', 'supreme'),
    ('Dan', 'pepperoni'),
    ('Dan', 'cheese'),
    ('Dan', 'sausage'),
    ('Dan', 'supreme'),
    ('Dan', 'mushroom'),
    ('Eli', 'supreme'),
    ('Eli', 'cheese'),
    ('Fay', 'mushroom'),
    ('Gus', 'mushroom'),
    ('Gus', 'supreme'),
    ('Gus', 'cheese'),
    ('Hil', 'supreme'),
    ('Hil', 'cheese'),
    ('Ian', 'supreme'),
    ('Ian', 'pepperoni');

-- Creacion de Tabla Frequents e inserccion de Datos en ella.
--
create table frequents (
    name varchar(60),
    pizzeria varchar(60),
    foreign key (name) references person(name)
);
insert into frequents (name, pizzeria) values
    ('Amy', 'Pizza Hut'),
    ('Ben', 'Pizza Hut'),
    ('Ben', 'Chicago Pizza'),
    ('Cal', 'Straw Hat'),
    ('Cal', 'New York Pizza'),
    ('Dan', 'Straw Hat'),
    ('Dan', 'New York Pizza'),
    ('Eli', 'Straw Hat'),
    ('Eli', 'Chicago Pizza'),
    ('Fay', 'Dominos'),
    ('Fay', 'Little Caesars'),
    ('Gus', 'Chicago Pizza'),
    ('Gus', 'Pizza Hut'),
    ('Hil', 'Dominos'),
    ('Hil', 'Straw Hat'),
    ('Hil', 'Pizza Hut'),
    ('Ian', 'New York Pizza'),
    ('Ian', 'Straw Hat'),
    ('Ian', 'Dominos');

-- Motrar Tablas disponibles
--
show tables;

-- Mostrar Datos de las Tablas
--
select * from person;
select * from serves;
select * from eats;
select * from frequents;
```

## Conclusión

Durante la practica me encontre en situaciones donde yo mismo estaba buscando crear una base de datos mas dinamica y robusta, que si bien, llegaba a cumplir
con lo solicitado, realmente no era necesario tanto para la tarea, fue cuando decidi hacerlo simple, que logre el resultado de manera mas rapida y sencillas.
