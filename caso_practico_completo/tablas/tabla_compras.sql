CREATE TABLE compras(
    id_compra integer PRIMARY KEY AUTOINCREMENT,
    fecha date,
    id_proveedor integer REFERENCES proveedores(id_proveedor)
);

INSERT INTO compras(fecha,id_proveedor)
VALUES
('2020/01/01',1),
('2020/02/02',2),
('2020/03/03',2);

SELECT * FROM compras;