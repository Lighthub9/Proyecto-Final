/* ============================================================================= 
	 Proyecto Final: Análisis de un Sistema para una tienda local en PostgreSQL.
	 Archivo: queries.sql
	 3. Scripts DQL
   =============================================================================   */

-- ¿Cuántos son los artículos de bebes que se venden y quien los ha comprado?
-- Consulta 1. Consulta con INNER JOIN de 3 tablas para saber los clientes, los articulos y la cantidad de articulos para bebes que han comprado los clientes, para realizar alguna campaña especial enfocada en dichos productos.
SELECT 
	CONCAT(us.nombre, ' ', us.apellido) AS cliente,
	pr.nombre AS articulo,
	SUM(pe.cantidad) AS cantidad,
	pr.departamento
FROM productos AS pr
INNER JOIN pedidos AS pe
ON pr.id_producto = pe.id_producto
INNER JOIN usuarios AS us
ON pe.id_usuario = us.id_usuario
WHERE pr.departamento IN ('bebes', 'lacteos')
GROUP BY pr.departamento, pr.nombre, us.nombre, us.apellido
ORDER BY cliente, articulo, cantidad DESC;


-- ¿Cuánto dinero ha gastado cada cliente?
-- Consulta 2. LEFT JOIN para encontrar registros sin asociaciones de las compras hechas por los clientes y el total de los que si compraron.
SELECT 
	CONCAT(u.nombre, ' ', u.apellido) AS cliente,
	SUM(pr.precio * pe.cantidad) AS total
FROM usuarios u
LEFT JOIN pedidos pe
ON u.id_usuario = pe.id_usuario
LEFT JOIN productos pr
ON pe.id_producto = pr.id_producto
GROUP BY u.nombre, u.apellido
ORDER BY cliente;


-- ¿Cuántos pedidos por dia que se han hecho en el año 2026?
-- Consulta 3. Consulta con función de agregación COUNT para saber el numero de pedidos por dia que se hicieron en el año 2026.
SELECT 
	fecha,
	COUNT(id_pedido) AS num_de_pedidos
FROM pedidos
GROUP BY fecha
HAVING fecha BETWEEN '2026-01-01' AND '2026-12-31'
ORDER BY fecha ASC;


-- ¿Cuál es el rango de los artículos comparado contra el precio promedio?
-- Consulta 4. Consulta que muestra el precio promedio de los articulos procesado en una CTE, para compararlo contra el precio y saber si esta por encima o debajo del promedio.
WITH promedio AS (
    SELECT AVG(precio) AS precio_promedio
    FROM productos
)
SELECT 
    p.nombre AS articulo,
    p.precio,
    ROUND(pr.precio_promedio, 2) AS precio_promedio,
	CASE
		WHEN p.precio < pr.precio_promedio THEN 'abajo del promedio'
		WHEN p.precio = pr.precio_promedio THEN 'promedio'
		ELSE 'arriba del promedio'
	END AS estatus
FROM productos p
CROSS JOIN promedio pr
ORDER BY articulo;


-- ¿Cuáles son los tres productos mas vendidos?
-- Consulta 5. Consulta que utiliza ORDER BY y LIMIT para obtener el reporte de las ventas totales de los productos "Top 3".
SELECT 
	pr.nombre AS producto,
	SUM(pr.precio * pe.cantidad) AS total
FROM pedidos pe
INNER JOIN productos pr
ON pe.id_producto = pr.id_producto
GROUP BY pr.nombre
ORDER BY total DESC
LIMIT 3;
