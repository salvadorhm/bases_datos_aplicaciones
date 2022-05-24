CREATE TABLE proveedores (
    id_proveedor integer PRIMARY KEY AUTOINCREMENT,
    proveedor varchar(50),
    nombre_contacto varchar(100),
    email_contacto varchar(50)
);

INSERT INTO proveedores(proveedor,nombre_contacto,email_contacto)
VALUES
('ACME','Bruce Wayne','bruce@acme.com'),
('Cloud9','Diana Prince','diana@scribe.com');

SELECT * FROM proveedores;