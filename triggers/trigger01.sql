CREATE TRIGGER actualizar_precio_unitario
   AFTER INSERT ON detalle_ventas
BEGIN
    UPDATE detalle_ventas
    SET precio_unitario = (SELECT precio_unitario FROM productos where detalle_ventas.id_producto = productos.id_producto)
    where id_producto = new.id_producto;
END;

INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES (1,1,2,0,0);

SELECT * FROM detalle_ventas;