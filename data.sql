/* ============================================================================= 
	 Proyecto Final: Análisis de un Sistema para una tienda local en PostgreSQL.
	 Archivo: data.sql
	 2. DML - Poblacion de tablas
   =============================================================================   */


INSERT INTO usuarios (nombre, apellido, telefono, email)
VALUES ('Juan', 'Lopez', '5588558800', 'juan.l@email.com'),
	('Maria', 'Gonzalez', '5022334455', 'maria_gonzalez@email.com'),
	('Pedro', 'Torres', '1234567890', 'pedro4589@gmmail.com'),
	('Jhon', 'Sanchez', '0180038989', 'sanchez@correomail.com'),
	('Patricia', 'McCollins', '1425367709', 'paty.mcollins@email.com');

INSERT INTO productos (nombre, descripccion, departamento, precio)
VALUES ('biberones', 'pequeño vaso para que los bebes tomen leche', 'bebes', 800),
	('leche en polvo', 'producto lacteo fortificado en polvo', 'lacteos', 300),
	('vitamina C', 'complemento vitaminico C', 'farmacia', 500),
	('analgesico comprimidos', 'comprimidos de analgesico para aminorar malestar general', 'farmacia', 100),
	('carreola', '', 'bebes', 2500);

INSERT INTO pedidos (fecha, id_usuario, id_producto, cantidad)
VALUES ('2025-07-01', 1, 1, 2),
	('2025-07-01', 1, 5, 1),
	('2026-01-12', 5, 2, 1),
	('2026-05-30', 2, 4, 5),
	('2026-05-30', 2, 3, 2),
	('2026-05-30', 2, 2, 1),
	('2026-05-30', 3, 4, 1),
	('2026-05-30', 3, 5, 1),
	('2026-04-03', 1, 2, 2),
	('2025-12-12', 5, 1, 1),
	('2026-06-29', 2, 4, 2),
	('2026-06-29', 2, 1, 1),
	('2026-03-10', 1, 4, 2),
	('2025-04-15', 3, 4, 2),
	('2025-04-15', 3, 3, 3),
	('2026-08-30', 2, 1, 1),
	('2025-11-05', 1, 2, 5),
	('2026-03-14', 5, 5, 1),
	('2026-07-03', 1, 1, 2),
	('2026-07-03', 1, 2, 2);
