
# Tarea Álgebra Relacional

---

## Arturo De Casso - 4 sept

> **Fecha de elaboracion:** 24 de noviembre de 2024

Utilizando la calculadora de álgebra relacional RelaX, escriba las siguientes sentencias en álgebra relacional:

Base de Datos: Pizza

### Tareas

- Obtener todos los registros de Serves
- Obtener todos los registros de Person
- Seleccione los registros de Serves con precio mayor a 10
- Seleccione las personas con gender 'female'
- Seleccione las personas con gender 'male' y mayores de 35
- Obtenga solo los nombres de las personas sin repetición
- Obtenga las personas que no tienen sitios frecuentes para comer
- Realice el producto cartesiano de Serves y Eats
- Realice la reunion natural de Serves y Eats, obteniendo las pizzas con precio mayor a 13

### IMDB-sample

- Realice la union de actores y directores, revise si tiene que ajustar las tablas

### UIBK - R, S, T

- Realice la union de S y T
- Realice la diferencia de S y T
- Realice la diferencia de T y S

### Fuentes

- #### RelaX

  - [Pagina Oficial](<https://dbis-uibk.github.io/relax/calc/local/uibk/local/0>)

- #### Pizza
  
  - [Base de Datos Pizza](<https://dbis-uibk.github.io/relax/calc/gist/7d1871f79a8bcb4788de/uibk_db_pizza/0>)

- #### IMDB-Sample
  
  - [Base de Datos Hollywood](<https://dbis-uibk.github.io/relax/calc/gist/41cf5ce652756d9331eec7562644e074/imdbsample/0>)

- #### Default UIBK - R, S, T
  
  - [Base de Datos Default](<https://dbis-uibk.github.io/relax/calc/local/uibk/local/0>)

---

## Ejercico Resuelto

### Base de Datos: Pizza

- Obtener todos los registros de Serves
_`Serves`_

- Obtener todos los registros de Person
_`Person`_
- Seleccione los registros de Serves con precio mayor a 10
_`σ price > 10 (Serves)`_

- Seleccione las personas con gender 'female'
_`σ gender = 'female' (Person)`_

- Seleccione las personas con gender 'male' y mayores de 35
_`σ gender = 'male' ∧ age > 35 (Person)`_

- Obtenga solo los nombres de las personas sin repetición
_`π name (Person)`_

- Obtenga las personas que no tienen sitios frecuentes para comer
_`Person - π name, age, gender (Person ⨝ Eats)`_
Explicacion:
  - `Person ⨝ Eats` Realiza una combinacion natural entre las dos relaciones `Person` y
  `Eats`. La combinacion natural une tuplas de ambas relaciones donde los valores de las columnas comunes (`Person.name = Eats.name`)son iguales.
  - `π name, age, gender (Person ⨝ Eats)` La operacionde  proyeccion (π) selecciona
  unicamente las columnas `name`, `age`, `gender` del resultado de la combinacion natural.
  - `Person - π name, age, gender (Person ⨝ Eats)` por ultimo, esta operacion de
  diferencia (-) sustrae del conjunto `Person` las tuplas obtenidas en el paso anterior. Es
  decir, elimina de `Person` todas las personas que están en la combinacion natural
  `Person ⨝ Eats` con las columnas especificadas.

- Realice el producto cartesiano de Serves y Eats
_`Serves ⨯ Eats`_

- Realice la reunion natural de Serves y Eats, obteniendo las pizzas con precio mayor a 13
`σ price > 13 (Serves ⨝ Eats)`
Explicacion
  - `Serves ⨝ Eats` realiza una combinacion natural.
  - Por ultimo, `σ price > 13` filtra los resultados de las tuplas donde el precio sea
  mayor a 13.

### Base de Datos IMDB-sample

- Realice la union de actores y directores, revise si tiene que ajustar las tablas
_`π id, first_name, last_name (actors) ∪ π id, first_name, last_name (directors)`_
Explicacion
  - La tablas `actors` y `directors` tienen esquemas incompatibles, ya que `actors` tiene
  un atributo adiciona(`gender`) que no esta presente en la tabla `directors`.
  Para realizar la union, me asegure de que ambas tengan el mismo numero de atributos y
  los nombres de esos atributos sean iguales.
  Atributos comunes: `id, first_name, last_name` y luego realice la union.

### Base de Datos UIBK - R, S, T

- Realice la union de S y T
_`S ∪ T`_
- Realice la diferencia de S y T
_`S - T`_
- Realice la diferencia de T y S
_`T - S`_
