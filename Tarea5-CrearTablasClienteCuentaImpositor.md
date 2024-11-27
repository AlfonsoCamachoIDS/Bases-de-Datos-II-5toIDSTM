# Tarea: Crear tablas y cargar datos en SQL

**Maestro**: Arturo De Casso
**Materia:** Bases de Datos II  
**Fecha de Entrega:** 3 oct 24
**Fecha de Elaboracion:** 27 Nov 24

---

## Instrucciones

Realice las sentencias SQL para crear la siguiente base de datos, cada tabla debe contar con las llaves primarias y foraneas, id_cliente es llave primaria en cliente. numero_cuenta es llave primaria en la tabla cuenta. id_cliente es llave foránea de cliente en la tabla impositor, numero_cuenta es llave foranea de cuenta en la tabla impositor.

Una vez creadas la tablas, cargue correctamente los datos en las tablas de acuerdo al contenido de la imagen.

![Imagen de como deben quedar las tablas](/imgs/tarea5-bd-cliente-cnt-impositor.png)

---

## Desarrollo

```SQL
-- Creacion de base de datos para trabajar en tarea 5 de base de datos uabcs.

create database tarea5BD;
use tarea5BD;

-- -----------------------------------------------------------------------------

-- Tabla cliente
create table cliente (
    id_cliente varchar(15) primary key,
    nombre_cliente varchar(50),
    calle_cliente varchar(100),
    ciudad_cliente varchar(50)
);

-- Tabla cuenta
create table cuenta (
    numero_cuenta varchar(10) primary key,
    saldo decimal(10, 2)
);

-- Tabla impositor
create table impositor (
    id_cliente varchar(15),
    numero_cuenta varchar(10),
    primary key (id_cliente, numero_cuenta),
    foreign key (id_cliente) references cliente(id_cliente),
    foreign key (numero_cuenta) references cuenta(numero_cuenta)
);

-- Datos para la tabla cliente
insert into cliente (id_cliente, nombre_cliente, calle_cliente, ciudad_cliente) values
('19.283.746', 'González', 'Arenal, 12', 'La Granja'),
('67.789.901', 'López', 'Mayor, 3', 'Peguerinos'),
('18.273.609', 'Abril', 'Preciados, 123', 'Valsáin'),
('32.112.312', 'Santos', 'Mayor, 100', 'Peguerinos'),
('33.666.999', 'Rupérez', 'Ramblas, 175', 'León'),
('01.928.374', 'Gómez', 'Carretas, 72', 'Cerceda');

-- Datos para la tabla cuenta
insert into cuenta (numero_cuenta, saldo) values
('C-101', 500),
('C-215', 700),
('C-102', 400),
('C-305', 350),
('C-201', 900),
('C-217', 750),
('C-222', 700);

-- Datos para la tabla impositor
insert into impositor (id_cliente, numero_cuenta) values
('19.283.746', 'C-101'),
('19.283.746', 'C-201'),
('01.928.374', 'C-215'),
('67.789.901', 'C-102'),
('18.273.609', 'C-305'),
('32.112.312', 'C-217'),
('33.666.999', 'C-222'),
('01.928.374', 'C-201');
```

---

## Conclusion

Creacion de tablas interrelacionadas entre si creada sin muchas complicaciones.

![Resultado tabla clientes](/imgs/tarea5/tabla-cliente.png)
![Resultado tabla cuenta](/imgs/tarea5/tabla-cuenta.png)
![Resultado tabla impositor](/imgs/tarea5/tabla-impositor.png)

 ---
