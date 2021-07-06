# Consultas SQL - SQLite3

## Este repositorio sirve de base para desarrollar practicas con SQL

## Tablas

### Clientes: 
```
id_cliente  nombre      email          
----------  ----------  ---------------
1           Dejah       dejah@email.com
2           Jonh        jonh@email.com 

```

### Productos: 
```
id_producto  producto    precio_unitario
-----------  ----------  ---------------
1            Lápiz       5.0            
2            Libreta     20.0 
```

### Ventas
```
id_venta    fecha       id_cliente
----------  ----------  ----------
1           2020/01/01  1         
2           2020/01/02  1         
3           2020/01/03  2    
```

### Detalle ventas
```
id_detalle_venta  id_venta    id_producto  cantidad_producto  precio_unitario  total_x_producto
----------------  ----------  -----------  -----------------  ---------------  ----------------
1                 1           1            2                  5.0              10.0            
2                 1           2            10                 20.0             200.0           
3                 2           2            1                  20.0             20.0            
4                 3           1            10                 5.0              50.0            
5                 3           2            10                 20.0             200.0  
```

### Proveedores
```
Proveedores: 
id_proveedor  proveedor   nombre_contacto  email_contacto
------------  ----------  ---------------  --------------
1             ACME        Bruce Wayne      bruce@acme.com
2             Cloud9      Diana Prince     diana@scribe.c
```

### Compras
```
Compras: 
id_compra   fecha       id_proveedor
----------  ----------  ------------
1           2020/01/01  1           
2           2020/02/02  2           
3           2020/03/03  2 
```

### Detalle de Compras
```
Detalle de compras: 
id_detalle_compra  id_compra   id_producto  cantidad_producto  precio_unitario  total_x_producto
-----------------  ----------  -----------  -----------------  ---------------  ----------------
1                  1           1            100                5.0              500.0           
2                  1           2            150                20.0             3000.0          
3                  2           1            200                5.0              1000.0          
4                  2           2            250                20.0             5000.0          
5                  3           1            300                5.0              600.0     
```

### Lista de consultas a realizar

1. **Consulta 0:** Mostrar id_cliente, nombre, email, fecha, id_venta, id_producto, producto, cantidad_producto,precio_unitario,total_producto para cada detalle_venta
```
id_cliente  nombre      email            fecha       id_detalle_venta  id_venta    id_producto  producto    cantidad_producto  precio_unitario  total_x_producto
----------  ----------  ---------------  ----------  ----------------  ----------  -----------  ----------  -----------------  ---------------  ----------------
1           Dejah       dejah@email.com  2020/01/01  1                 1           1            Lápiz       2                  5.0              10.0            
1           Dejah       dejah@email.com  2020/01/01  2                 1           2            Libreta     10                 20.0             200.0           
1           Dejah       dejah@email.com  2020/01/02  3                 2           2            Libreta     1                  20.0             20.0            
2           Jonh        jonh@email.com   2020/01/03  4                 3           1            Lápiz       10                 5.0              50.0            
2           Jonh        jonh@email.com   2020/01/03  5                 3           2            Libreta     10                 20.0             200.0    
```

2. **Consulta 1:** Mostrar el total_venta por cada venta
```
id_venta    total_venta
----------  -----------
1           210.0      
2           20.0       
3           250.0  
```

3. **Consulta 2:** Mostrar el nombre del cliente y total_venta por cada venta
```
nombre      id_venta    total_venta
----------  ----------  -----------
Dejah       1           210.0      
Dejah       2           20.0       
Jonh        3           250.0   
```

4. **Consulta 3:** Mostrar el nombre del cliente y el total que pagado
```
nombre      total_venta
----------  -----------
Dejah       230.0      
Jonh        250.0  
```

5. **Consulta 4:** Mostrar la cantidad total de productos vendida por cada producto
```
producto    cantidad_producto
----------  -----------------
Libreta     21               
Lápiz       12   
```

6. **Consulta 5:** Mostrar el total vendido por dia
```
fecha       total_venta
----------  -----------
2020/01/01  210.0      
2020/01/02  20.0       
2020/01/03  250.0  
```

7. **Consulta 6:** Mostrar el dia que menos se ha vendido
```
fecha       total_venta
----------  -----------
2020/01/02  20.0  
```
## ---------------------------------------------------------------
## Consultas Compras
## ---------------------------------------------------------------


8. **Consulta 7:** Mostrar id_proveedor, proveedor, nombre_contacto, email_contacto, fecha, id_compra, id_producto, producto, cantidad_producto,precio_unitario,total_producto para cada **detalle_compra**

```
id_proveedor  proveedor   nombre_contacto  email_contacto  fecha       id_compra   id_producto  producto       cantidad_producto  precio_unitario  total_x_producto
------------  ----------  ---------------  --------------  ----------  ----------  -----------  -------------  -----------------  ---------------  ----------------
1             ACME        Bruce Wayne      bruce@acme.com  2020/01/01  1           1            Lápiz acme 2H  100                5.0              500.0           
1             ACME        Bruce Wayne      bruce@acme.com  2020/01/01  1           2            Libreta scrib  150                20.0             3000.0          
2             Cloud9      Diana Prince     diana@scribe.c  2020/02/02  2           1            Lápiz acme 2H  200                5.0              1000.0          
2             Cloud9      Diana Prince     diana@scribe.c  2020/02/02  2           2            Libreta scrib  250                20.0             5000.0          
2             Cloud9      Diana Prince     diana@scribe.c  2020/03/03  3           1            Lápiz acme 2H  300                5.0              600.0   
```

9. **Consulta 8:** Mostrar el total_compra por cada **compra**
```
id_compra   total_compra
----------  ------------
1           3500.0      
2           6000.0      
3           600.0  
```

10. **Consulta 9:** Mostrar el proveedor, nombre_contacto, email_contacto y total_compra por cada compra
```
proveedor   nombre_contacto  email_contacto  id_compra   total_compra
----------  ---------------  --------------  ----------  ------------
ACME        Bruce Wayne      bruce@acme.com  1           3500.0      
Cloud9      Diana Prince     diana@scribe.c  2           6000.0      
Cloud9      Diana Prince     diana@scribe.c  3           600.0  
```

11. **Consulta 10:** Mostrar el proveedor  y el total que se le ha comprado
```
proveedor   total_compra
----------  ------------
ACME        3500.0      
Cloud9      6600.0  
```

12. **Consulta 11:** Mostrar la cantidad total de productos comprados por cada producto
```
producto                    cantidad_producto
--------------------------  -----------------
Libreta scribe profesional  400              
Lápiz acme 2H               600   
```

13. **Consulta 12:** Mostrar el total comprado por día
```
fecha       total_compra
----------  ------------
2020/01/01  3500.0      
2020/02/02  6000.0      
2020/03/03  600.0 
```

14. **Consulta 13:** Mostrar el dia que más se ha comprado
```
fecha       total_compra
----------  ------------
2020/02/02  6000.0    
```

## Triggers

15. **Consulta 14:** Modificar mediante sql la estructura de la tabla **productos** e insertar el campo existencias de tipo entero y con un valor default de 100.

```
id_producto  producto       precio_unitario
-----------  -------------  ---------------
1            Lápiz acme 2H  5.0
2            Libreta scrib  20.0
id_producto  producto       precio_unitario  existencias
-----------  -------------  ---------------  -----------
1            Lápiz acme 2H  5.0              100
2            Libreta scrib  20.0             100
```

16. **Consulta 15:** Crear un trigger que después de insertar un producto en detalle_ventas, dejando preci_unitario y total_x_producto con un valor de 0, actualice el precio_unitario del producto insertado trayendolo directmente de la tabla productos.

Ejemplo consulta SQL:
```
INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES (1,1,2,0,0);
```

Resultado de la consulta:
```
id_detalle_venta  id_venta    id_producto  cantidad_producto  precio_unitario  total_x_producto
----------------  ----------  -----------  -----------------  ---------------  ----------------
1                 1           1            2                  5.0              10.0
2                 1           2            10                 20.0             200.0
3                 2           2            1                  20.0             20.0
4                 3           1            10                 5.0              50.0
5                 3           2            10                 20.0             200.0
6                 1           1            2                  5.0              0.0
```

17. **Consulta 16** Crear un trigger que después de insertar un producto en detalle_ventas, actualice las existencias de productos:

Existencias de productos:
```
id_producto  producto       precio_unitario  existencias
-----------  -------------  ---------------  -----------
1            Lápiz acme 2H  5.0              100
2            Libreta scrib  20.0             100
```

Nuevo detalle_venta
```
INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES (1,1,2,0,0);
```

Existencias actualizadas
```
id_producto  producto       precio_unitario  existencias
-----------  -------------  ---------------  -----------
1            Lápiz acme 2H  5.0              98
2            Libreta scrib  20.0             100
```

17. **Consulta 16** Crear un trigger que después de actualizar el detalle_ventas, actualice las total_x_prodcutos con la operación total_x_producto = cantidad_producto * precio_unitario:

Detalle ventas antes del TRIGGER
```
id_detalle_venta  id_venta    id_producto  cantidad_producto  precio_unitario  total_x_producto
----------------  ----------  -----------  -----------------  ---------------  ----------------
1                 1           1            2                  5.0              10.0
2                 1           2            10                 20.0             200.0
3                 2           2            1                  20.0             20.0
4                 3           1            10                 5.0              50.0
5                 3           2            10                 20.0             200.0
6                 1           1            2                  5.0              0.0
7                 1           1            2                  5.0              0.0
```

Insertar nuevo detalle_ventas
```
INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES (1,1,10,0,0);
```
Tabla detalle_ventas actualizada con el trigger.
```
id_detalle_venta  id_venta    id_producto  cantidad_producto  precio_unitario  total_x_producto
----------------  ----------  -----------  -----------------  ---------------  ----------------
1                 1           1            2                  5.0              10.0
2                 1           2            10                 20.0             200.0
3                 2           2            1                  20.0             20.0
4                 3           1            10                 5.0              50.0
5                 3           2            10                 20.0             200.0
6                 1           1            2                  5.0              10.0
7                 1           1            2                  5.0              10.0
8                 1           1            10                 5.0              50.0
```

