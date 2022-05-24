# SQLite CONSTRAINTS (Restricciones)

## 1. Constraints (restricciones) en SQLite

Constraints (restricciones) en SQL son una forma de restringir los valores de una columna de una tabla, permitiendo que los valores de la columna no sean repetidos, o que no sean nulos, o que esten en un rango de valores, o que sean de una lista de valores, o que tengan una expresion regular, o una convinacion de restricciones.

**Nota:** Una tabla puede tener una o varias restricciones, y a continuación se describen algunos de los tipos de restricciones que soporta SQLite:

## 2. NOT NULL (no nulo)

Esta restriccion obliga a que la columna no sea nula, es decir debe tener un valor forzosamente.

### 2.2 Ejemplo:

```sql
CREATE TABLE tabla (
    columna1 INTEGER NOT NULL
);
```

### 2.3 Isertar un valor nulo en la columna

```sql
INSERT INTO tabla (columna1) VALUES (NULL);
```

### 2.4 Resultado

```sql
SQL Error [19]: [SQLITE_CONSTRAINT_NOTNULL]  A NOT NULL constraint failed (NOT NULL constraint failed: tabla.columna1)
```

## 3. PRIMARY KEY (clave primaria)

Esta restriccion obliga a que una o varias columnas sean una clave primaria, un conjunto de columnas que no pueden ser nulas y que no pueden ser repetidas, y que sirven para identificar una fila de la tabla de forma unica.

### 3.1 Ejemplo:

```sql
CREATE TABLE tabla (
    columna1 INTEGER PRIMARY KEY,
    columna2 INTEGER NOT NULL
);
```

Una llave primaria puede contener una o varias columnas.

```sql
CREATE TABLE tabla (
    columna1 INTEGER,
    columna2 INTEGER,
    PRIMARY KEY (columna1, columna2)
);
```

### 3.2 Insertar un valor en la tabla

```sql
INSERT INTO tabla (columna1, columna2) VALUES (1, 2);
INSERT INTO tabla (columna1, columna2) VALUES (1, 2);
```

### 3.3 Resultado

```sql
SQL Error [19]: [SQLITE_CONSTRAINT_PRIMARYKEY]  A PRIMARY KEY constraint failed (UNIQUE constraint failed: tabla.columna1)
```

En el caso de que la llave primaria contenga dos columnas:


```sql
SQL Error [19]: [SQLITE_CONSTRAINT_PRIMARYKEY]  A PRIMARY KEY constraint failed (UNIQUE constraint failed: tabla.columna1, tabla.columna2)
```

## 4. UNIQUE (único)

Si una columna tiene la restriccion UNIQUE, entonces no puede tener valores repetidos.

### 4.1 Ejemplo:

```sql
CREATE TABLE tabla (
    columna1 INTEGER UNIQUE
);
```

### 4.2 Insertar un valor en la tabla

```sql
INSERT INTO tabla (columna1) VALUES (1);
INSERT INTO tabla (columna1) VALUES (1);
```

### 4.3 Resultado

```sql
SQL Error [19]: [SQLITE_CONSTRAINT_UNIQUE]  A UNIQUE constraint failed (UNIQUE constraint failed: tabla.columna1)
```

## 5. DEFAULT (por defecto)

Esta restricción permite establecer un valor por defecto para una columna, si no se inserta ningun valor en la columna durante la insercion de una fila el valor predeterminado sera el valor establecido.

### 5.1 Ejemplo:

```sql
CREATE TABLE tabla (
    columna1 integer DEFAULT 1,
    columna2 integer
);
```

### 5.2 Insertar un valor en la tabla

```sql
INSERT INTO tabla (columna2) VALUES (10);
SELECT * FROM tabla;
```

### 5.3 Resultado

```sql
columna1 | columna2
1|10
```


## 6. INDEX (indice)

La restriccion INDEX permite crear un indice para una o varias columnas de una tabla, esto permite una busqueda más rapida de valores en la tabla, adema de una mejor rendimiento, ya que no se tienen que recorrer todas las filas de la tabla para buscar un valor.

Una restriccion INDEX puede ser de dos tipos:

1. UNIQUE INDEX (indice único) Permite crear un indice único para una o varias columnas de una tabla, mientras mejora el rendimiento de la tabla.

2. INDEX (indice) Permite crear un indice para una o varias columnas de una tabla, esto permite una busqueda más rapida de valores en la tabla, además de un mejor rendimiento, ya que no se tienen que recorrer todas las filas de la tabla para buscar un valor.


### 6.1 Ejemplo 1: **INDEX**

```sql
CREATE TABLE tabla (
    columna1 integer,
    columna2 integer
);

CREATE INDEX tabla_index ON tabla (columna1, columna2);
```

### 6.2 Insertar un valor en la tabla

```sql
INSERT INTO tabla (columna1, columna2) VALUES (1, 2);
INSERT INTO tabla (columna1, columna2) VALUES (1, 2);
```

### 6.3 Resultado

```sql
columna1 | columna2
1|2
1|2
```

### 6.4 Ejemplo 2 : **INDEX UNIQUE**

```sql
CREATE TABLE tabla (
    columna1 integer,
    columna2 integer
);

CREATE UNIQUE INDEX tabla_index ON tabla (columna1, columna2);
```

### 6.5 Insertar un valor en la tabla

```sql
INSERT INTO tabla (columna1, columna2) VALUES (1, 2);
INSERT INTO tabla (columna1, columna2) VALUES (1, 2);
```

### 6.6 Resultado

```sql
Error while executing SQL query on database 'prueba': UNIQUE constraint failed: tabla.columna1, tabla.columna2
```
