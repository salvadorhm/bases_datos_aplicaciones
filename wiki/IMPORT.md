# SQLite3: Importar datos desde un archivo CSV

Cuando se tienen un conjunto de registros almacenados en un archivo CSV, se puede importar a una base de datos SQLite3.

Los archivos **CSV** son útiles cuando se desea **intercambiar** información entre **bases de datos** y **aplicaciones**, por ejemplo se pueden tener los datos en una **hoja de cálculo y exportarlos a CSV** para **insertarlos en una base de datos**, o realizar el proceso inverso, es decir tener los datos en una **base de datos y exportarlos a CSV** para **abrirlos y manipularlos con una herramienta de hoja de cálculo**.

En esta entrada se verán 3 casos comúnes cuando se desea importar datos de un archivo CSV a una base de datos SQLite3.

---

## **Caso 1**

Se tiene una tabla existente sin registros, estos se van a agregar a partir de la información contenida en un archivo CSV sin cabeceras.

### 1.1 Tabla original

```sql
CREATE TABLE clientes (
    id_cliente integer PRIMARY KEY AUTOINCREMENT,
    nombre varchar(50),
    email varchar(50)
);
```

### 1.2 Nuevos datos **clientes.csv**

```sql
1,Cliente 1,cliente1@email.com
2,Cliente 2,cliente2@email.com
3,Cliente 3,cliente3@email.com
```

### 1.3 Cambiar **.mode** a csv para importar el archivo CSV

```sql
.mode csv
```

### 1.4 Importar en la tabla **clientes**

```sql
.import clientes.csv clientes
```

### 1.5 Cambiar el **.mode** a column y activar los **.headers** para facilitar la visualización de los datos

```sql
.headers on
.mode column
```

### 1.6 Verificar los datos insertados

```sql
SELECT * FROM clientes;
```

### 1.7 Resultado esperado

```sql
id_cliente  nombre      email
----------  ----------  ------------------
1           Cliente 1   cliente1@email.com
2           Cliente 2   cliente2@email.com
3           Cliente 3   cliente3@email.com
```
**FIN Caso 1**

---

## **Caso 2**

Se tiene una tabla existente que ya contiene registros, los cuales se desean conservar, agregando nuevos registros a partir de la información contenida en un archivo CSV sin caberceras.

### 2.1 Tabla original

```sql
CREATE TABLE clientes (
    id_cliente integer PRIMARY KEY AUTOINCREMENT,
    nombre varchar(50),
    email varchar(50)
);


INSERT INTO clientes(nombre,email) VALUES('Dejah','otro@email.com');
INSERT INTO clientes(nombre,email) VALUES('Jhon','jhon@email.com');
INSERT INTO clientes(nombre,email) VALUES('Carthoris','carthoris@email.com');
```

#### 2.2 Consultar los datos de la tabla **clientes**

```sql
SELECT * FROM clientes;
```

### 2.3 Resultado esperado

```sql
1|Dejah|otro@email.com
2|Jhon|jhon@email.com
3|Carthoris|carthoris@email.com
```

### 2.4 Nuevos datos **clientes.csv**

```sql
1,Cliente 1,cliente1@email.com
2,Cliente 2,cliente2@email.com
3,Cliente 3,cliente3@email.com
```

### 2.5 Crear una tabla **temporal**

**Nota:** En esta tabla temporal solo se crean los campos que contiene el archivo CSV, pero no se define una **clave primaria**.

```sql
CREATE TABLE temporal (
    id_cliente integer ,
    nombre varchar(50),
    email varchar(50)
);
```

### 2.6 Cambiar **.mode** a csv para importar el archivo CSV

```sql
.mode csv
```

### 2.7 Importar en la tabla **temporal**

```
.import clientes.csv temporal
```

### 2.8 Cambiar el **.mode** a column y activar los **.headers** para facilitar la visualización de los datos

```sql
.headers on
.mode column
```

### 2.9 Consultar la tabla **temporal**

```sql
SELECT * FROM temporal;
```

### 2.10 Resultado esperado

```sql
id_cliente  nombre      email
----------  ----------  ------------------
1           Cliente 1   cliente1@email.com
2           Cliente 2   cliente2@email.com
3           Cliente 3   cliente3@email.com
```

### 2.11 Insertar datos en **clientes** seleccionandolos de **temporal**

**Nota:** Se insertan los datos de **temporal** en **clientes**, pero no se eliminan los datos de **temporal**.

**Nota:** Es posible seleccionar que columna o columnas se quieren importar.


```sql
INSERT INTO clientes(nombre, email)
SELECT nombre, email
FROM temporal;
```

### 2.12 Verificar los datos insertados en **clientes**

```sql
SELECT * FROM clientes;
```

### 2.13 Resultado esperado

**Nota:** los datos de la tabla temporal se insertan en la tabla clientes, y se genera un nuevo id_cliente para cada registro.

```sql
id_cliente  nombre      email
----------  ----------  --------------
1           Dejah       otro@email.com
2           Jhon        jhon@email.com
3           Carthoris   carthoris@emai
4           Cliente 1   cliente1@email
5           Cliente 2   cliente2@email
6           Cliente 3   cliente3@email
```

### 2.14 Eliminar la tabla **temporal**

**Nota:** Se elimina la tabla **temporal** para que no ocupe espacio en la base de datos.

```sql
DROP table temporal;
```

**FIN Caso 2**

---

## **Caso 3**

Se tiene una tabla existente que ya contiene registros, los cuales se desean conservar, agregando nuevos registros a partir de la información contenida en un archivo CSV con cabeceras.

### 3.1 Tabla original

```sql
CREATE TABLE clientes (
    id_cliente integer PRIMARY KEY AUTOINCREMENT,
    nombre varchar(50),
    email varchar(50)
);


INSERT INTO clientes(nombre,email) VALUES('Dejah','otro@email.com');
INSERT INTO clientes(nombre,email) VALUES('Jhon','jhon@email.com');
INSERT INTO clientes(nombre,email) VALUES('Carthoris','carthoris@email.com');
```

### 3.2 Consultar los datos de la tabla **clientes**

```sql
SELECT * FROM clientes;
```

### 3.3 Resultado esperado

```sql
1|Dejah|otro@email.com
2|Jhon|jhon@email.com
3|Carthoris|carthoris@email.com
```

### 3.4 Nuevos datos **clientes.csv**

**Nota:** En este caso el archivo **CSV** contiene cabecera.

```sql
id_cliente,nombre,email
1,Cliente 1,cliente1@email.com
2,Cliente 2,cliente2@email.com
3,Cliente 3,cliente3@email.com
```

### 3.5 Cambiar **.mode** a csv para importar el archivo CSV

```sql
.mode csv
```

### 3.6 Importar **clientes.csv** sin haber creado una tabla temporal previamente

```sql
.import clientes.csv temporal
```

**Nota:** Como no existe la tabla temporal, SQLite3 la crea automáticamente con la siguiente sentencia:

**Nota:** El primer registro del archivo CSV es la cabecera.

```sql
CREATE TABLE temporal(
  "id_ciente" TEXT,
  "nombre" TEXT,
  "email" TEXT
);
```

### 3.7 Cambiar el **.mode** a column y activar los **.headers** para facilitar la visualización de los datos

```sql
.headers on
.mode column
```

### 3.8 Consultar la tabla **temporal**

```sql
SELECT * FROM temporal;
```

### 3.9 Resultado esperado

```sql
id_cliente  nombre      email
----------  ----------  ------------------
1           Cliente 1   cliente1@email.com
2           Cliente 2   cliente2@email.com
3           Cliente 3   cliente3@email.com
```

### 3.10 Insertar los registros a **clientes** desde la tabla **temporal**

**Nota:** Se insertan los datos de **temporal** en **clientes**, pero no se eliminan los datos de **temporal**.

**Nota:** Es posible seleccionar que columna o columnas se quieren importar.

```sql
INSERT INTO clientes(nombre, email)
SELECT nombre, email
FROM temporal;
```

### 3.11 Verificar los datos insertados en **clientes**

```sql
SELECT * from clientes;
```

### 3.12 Resultado esperado

**Nota:** los datos de la tabla temporal se insertan en la tabla clientes, y se genera un nuevo id_cliente para cada registro.

```sql
id_cliente  nombre      email
----------  ----------  --------------
1           Dejah       otro@email.com
2           Jhon        jhon@email.com
3           Carthoris   carthoris@emai
4           Cliente 1   cliente1@email
5           Cliente 2   cliente2@email
6           Cliente 3   cliente3@email
```

### 3.13 Eliminar la tabla **temporal**

**Nota:** Se elimina la tabla **temporal** para que no ocupe espacio en la base de datos.

```sql
DROP table temporal;
```

**FIN Caso 3**
