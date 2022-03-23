SELECT ventas.fecha, sum(detalle_ventas.total_x_producto) as total_venta
FROM ventas, detalle_ventas
WHERE ventas.id_venta = detalle_ventas.id_venta
GROUP BY ventas.id_venta;