CREATE TRIGGER actualizar_inventario
   AFTER INSERT ON detalle_ventas
BEGIN
    UPDATE productos
    SET existencias = existencias - new.cantidad_producto
    where id_producto = new.id_producto;
END;

SELECT * FROM productos;

INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES (1,1,2,0,0);

SELECT * FROM productos;