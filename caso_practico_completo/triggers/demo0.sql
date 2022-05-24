.headers on
.mode column
PRAGMA foreign_keys = ON;

CREATE TABLE detalle_ventas(
    id_detalle_venta integer PRIMARY KEY AUTOINCREMENT,
    id_venta integer,
    id_producto integer,
    cantidad_producto integer,
    precio_unitario float,
    total_x_producto float
);


INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES (1,1,2,5,0);

SELECT * FROM detalle_ventas;

CREATE TRIGGER actualizar_invetario
   AFTER INSERT ON detalle_ventas
BEGIN
    UPDATE detalle_ventas
    SET total_x_producto = new.cantidad_producto * new.precio_unitario
    WHERE id_detalle_venta = new.id_detalle_venta;
END;

INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES (1,2,10,100,0);

SELECT * FROM detalle_ventas;