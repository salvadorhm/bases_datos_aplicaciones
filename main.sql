.headers on
.mode column
PRAGMA foreign_keys = ON;

.print "Clientes: "
.read tablas/tabla_clientes.sql
.print "\n"

.print "Productos: "
.read tablas/tabla_productos.sql
.print "\n"

.print "Ventas: "
.read tablas/tabla_ventas.sql
.print "\n"

.print "Detalle ventas: "
.read tablas/tabla_detalle_ventas.sql
.print "\n"

.print "Proveedores: "
.read tablas/tabla_proveedores.sql
.print "\n"

.print "Compras: "
.read tablas/tabla_compras.sql
.print "\n"

.print "Detalle de compras: "
.read tablas/tabla_detalle_compras.sql
.print "\n"

-- Consulta 0: Mostrar id_cliente, nombre, email, fecha, id_venta, id_producto, producto, cantidad_producto,precio_unitario,total_producto para cada detalle_venta
-- Campos: id_venta, total_venta

.print "0. Mostrar id_cliente, nombre, email, fecha, id_venta, id_producto, producto, cantidad_producto,precio_unitario,total_producto para cada detalle_venta"
.read ventas/consulta0.sql
.print "\n"

-- Consulta 1: Mostrar el total_venta por cada venta
-- Campos: id_venta, total_venta

.print "1. Mostrar el total_venta por cada venta"
.read ventas/consulta1.sql
.print "\n"

-- Consulta 2: Mostrar el nombre del cliente y total_venta por cada venta
-- Campos: nombre, id_venta, total_venta

.print "2. Mostrar el nombre del cliente y total_venta por cada venta"
.read ventas/consulta2.sql
.print "\n"


-- Consulta 3: Mostrar el nombre del cliente y el total que pagado
-- Campos: nombre, total_venta

.print "3. Mostrar el nombre del cliente y el total que pagado"
.read ventas/consulta3.sql
.print "\n"



-- Consulta 4: Mostrar la cantidad total vendida por cada producto
-- Campos: producto, cantidad_total

.print "4. Mostrar la cantidad total vendida por cada producto"
.read ventas/consulta4.sql
.print "\n"

-- Consulta 5: Mostrar el total vendido por dia
-- Campos: fecha, total_venta

.print "5. Mostrar el total vendido por dia"
.read ventas/consulta5.sql
.print "\n"

-- Consulta 6: Mostrar el dia que menos se ha vendido
-- Campos: dia, cantidad_total

.print "6. Mostrar el dia que menos se ha vendido"
.read ventas/consulta6.sql
.print "\n"



.print "7. Mostrar id_proveedor, proveedor, nombre_contacto, email_contacto, fecha, id_compra, id_producto, producto, cantidad_producto,precio_unitario,total_producto para cada detalle_compra"
.read compras/consulta7.sql
.print "\n"

.print "8. Mostrar el total_compra por cada compra"
.read compras/consulta8.sql
.print "\n"

.print "9.  Mostrar el proveedor, nombre_contacto, email_contacto y total_compra por cada compra"
.read compras/consulta9.sql
.print "\n"

.print "10 Mostrar el proveedor  y el total que se le ha comprado"
.read compras/consulta10.sql
.print "\n"


.print "11. Mostrar la cantidad total de productos comprados por cada producto"
.read compras/consulta11.sql
.print "\n"

.print "12. Mostrar el total comprado por día"
.read compras/consulta12.sql
.print "\n"

.print "13. Mostrar el dia que más se ha comprado"
.read compras/consulta13.sql
.print "\n"


.print "14. Modificar mediante sql la estructura de la tabla **productos** e insertar el campo existencias de tipo entero y con un valor default de 100."
.read triggers/trigger00.sql
.print "\n"

.print "15. Crear un trigger que después de insertar un producto en detalle_ventas, dejando precio_unitario y total_x_producto con un valor de 0, actualice el precio_unitario del producto insertado trayendolo directmente de la tabla productos.\n"
.read triggers/trigger01.sql
.print "\n"

.print "16. Crear un trigger que después de insertar un producto en detalle_ventas, actualice las existencias de productos\n"
.read triggers/trigger02.sql
.print "\n"

.print "17. Crear un trigger que después de insertar un producto en detalle_ventas, dejando precio_unitario y total_x_producto con un valor de 0, actualice el total_x_producto, con la operación precio_unitario * cantidad_producto.\n"
.read triggers/trigger03.sql
.print "\n"
