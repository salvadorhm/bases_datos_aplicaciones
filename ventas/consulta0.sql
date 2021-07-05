select clientes.id_cliente, clientes.nombre, clientes.email, ventas.fecha, ventas.id_venta, productos.id_producto, productos.producto,detalle_ventas.id_detalle_venta, detalle_ventas.cantidad_producto,detalle_ventas.precio_unitario,detalle_ventas.total_x_producto 

from clientes,ventas,detalle_ventas, productos

WHERE clientes.id_cliente = ventas.id_cliente AND
ventas.id_venta = detalle_ventas.id_venta AND
detalle_ventas.id_producto = productos.id_producto;