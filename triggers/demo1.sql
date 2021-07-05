CREATE TABLE compradores (
    id integer PRIMARY KEY,
    nombre text NOT NULL,
    primer_apellido text NOT NULL,
    email text NOT NULL
);

CREATE TRIGGER validar_email_compradores
   BEFORE INSERT ON compradores
BEGIN
   SELECT
      CASE
         WHEN NEW.email NOT LIKE '%_@__%.__%' THEN
            RAISE (ABORT,'Email con formato no valido')
         END;
END;

INSERT INTO compradores (nombre,primer_apellido,email)
VALUES('Dejah','Thoris','dejah');


INSERT INTO compradores (nombre,primer_apellido,email)
VALUES('Dejah','Thoris','dejah@correo.com');

SELECT * FROM compradores;
