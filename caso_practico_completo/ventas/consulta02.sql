select detalle_ventas.id_venta, sum(total_x_producto) as total_venta

FROM detalle_ventas

GROUP BY id_venta;

