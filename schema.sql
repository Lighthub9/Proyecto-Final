/* ============================================================================= 
	 Proyecto Final: Análisis de un Sistema para una tienda local en PostgreSQL.
	 Archivo: schema.sql
	 1. DDL - Creacion de base de datos
   =============================================================================   */

-- Creacion de tablas
CREATE TABLE usuarios (
	id_usuario SERIAL PRIMARY KEY,
	nombre VARCHAR(20),
	apellido VARCHAR(25) NOT NULL,
	telefono VARCHAR(10),
	email VARCHAR(50) NOT NULL
);

CREATE TABLE productos(
	id_producto SERIAL PRIMARY KEY,
	nombre VARCHAR(25) NOT NULL,
	descripccion TEXT,
	departamento VARCHAR(20) NOT NULL,
	precio DECIMAL(11,2) CHECK(precio > 0) NOT NULL
);

CREATE TABLE pedidos(
	id_pedido SERIAL PRIMARY KEY,
	fecha DATE NOT NULL,
	id_usuario INT REFERENCES usuarios(id_usuario),
	id_producto INT REFERENCES productos(id_producto),
	cantidad INT CHECK (cantidad > 0) NOT NULL
);
