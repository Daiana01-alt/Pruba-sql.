#--------------------------------------- //SPRINT 7 DAY//---------------------------------------------------------------------#

-- 28. Crear una vista de la localidad y región en la que se encuentran los warehouses y la cantidad de productos almacenados.

use Daianaolivera1;
CREATE VIEW count_products AS
SELECT
   l.location_id,r.region_name,w.warehouse_name,SUM(i.quantity)
FROM WAREHOUSE w
JOIN INVENTORIES i
JOIN REGIONS r 
JOIN LOCATION l
JOIN COUNTRIES c
ON w.warehouse_id = l.location_id and i.warehouse_id = w.warehouse_id and r.region_id = l.country_id and r.region_id = c.region_id
GROUP BY l.location_id,r.region_name,warehouse_name;

SELECT *FROM count_products;

------------------------------------------------------------------------------------------------------------------------------------
-- 29.Crear una vista de la cantidad de órdenes entregadas asociadas a cada manager.alter

use Daianaolivera1;
CREATE VIEW Count_orders_delivered AS
SELECT e.manager_id,
   count(o.order_id) as Count_orders_delivered
   FROM EMPLOYEES e
JOIN Orders o
ON e.employee_id = o.salesman_id
WHERE o.STATUS = 'delivered'
GROUP BY e.manager_id;

SELECT * FROM Count_orders_delivered;

----------------------------------------------------------------------------------------------------------------------------------------------
-- 30.Crear una vista de los productos con cantidad entre 100 y 1000 , incluyendo su list_price y la localidad del wharehouse donde se encuantra.

use Daianaolivera1;
CREATE VIEW Count_products_100_1000 AS
SELECT
   p.product_id,w.warehouse_id,p.list_price,l.location_id, i.quantity
FROM PRODUCTS p
JOIN WAREHOUSE w
JOIN INVENTORIES i
JOIN LOCATION l
ON p.product_id = i.product_id and w.warehouse_id = i.warehouse_id and i.warehouse_id = w.location_id and l.location_id = w.location_id
WHERE i.quantity > 1 
and i.quantity < 1000;

SELECT * FROM Count_products_100_1000;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- 31.Eliminar las vistas creadas en los tres incisos anteriores.

use Daianaolivera1;
DROP VIEW count_products;
DROP VIEW Count_orders;
DROP VIEW Count_products_100_1000;

------------------------------------------------------------------------------------------------------------------------------------------------------
-- 32.Calcular número de fila, rank y dense rank de los productos de a cuerdo a list_price
-- según cada categoría.
use Daianaolivera1;
SELECT * 
FROM PRODUCTS;

use Daianaolivera1;
SELECT product_id,list_price,category_id,
ROW_NUMBER()OVER (PARTITION BY product_id
				ORDER BY list_price DESC) AS row_precio_de_product,
                
RANK() OVER(PARTITION BY product_id
            ORDER BY list_price DESC) AS lp_desense_rank,
            
DENSE_RANK() OVER(PARTITION BY product_id
             ORDER BY list_price DESC) AS lp_dense_rank               
FROM PRODUCTS;


-------------------------------------------------------------------------------------------------------------------------------------------------------
-- 33.Determinar número de fila, rank y dense rank de los productos de a cuerdo a su cantidad según su order:id.

use Daianaolivera1;
SELECT quantity,orders_id,product_id,
ROW_NUMBER()OVER (PARTITION BY orders_id
				ORDER BY quantity DESC) AS cant_de_product,
                
RANK() OVER(PARTITION BY orders_id
            ORDER BY quantity DESC) AS ctp_desense_rank,
            
DENSE_RANK() OVER(PARTITION BY orders_id
             ORDER BY quantity DESC) AS orden_dense_rank            
FROM ORDER_ITEMS;

-------------------------------------------------------------------------------------------------------------------------------------------------
-- 34.Calcular número de fila, rank y dense rank de las regiones de a cuerdo a la cantidad de warehouses que poseen según su localidad.

use Daianaolivera1;
SELECT 
r.region_id,
r.region_name,
l.location_id,
count(w.warehouse_id) as Count_warehouses,
ROW_NUMBER()OVER (PARTITION BY r.region_id
				ORDER BY count(w.warehouse_id) DESC) AS cant_de_warehoses,
                
RANK() OVER(PARTITION BY region_id
            ORDER BY count(w.warehouse_id) DESC) AS loca_desense_rank,
            
DENSE_RANK() OVER(PARTITION BY region_id
             ORDER BY count(w.warehouse_id)DESC) AS orden_dense_rank 
		
FROM WAREHOUSE w
JOIN LOCATION l on w.location_id = l.location_id
JOIN COUNTRIES c on l.country_id = c.country_id
JOIN REGIONS r on r.region_id = c.region_id
GROUP BY r.region_id,r.region_name,l.location_id
ORDER BY r.region_id,l.location_id;

-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 35.Determinar la cantidad de producto por orden y el mes con mayor cantidad de productos (tomar mes de order_date) para el año 2022.
use Daianaolivera1;
SELECT oi.orders_id,SUM(oi.quantity) AS count_products, month(o.order_date)as MES,
MAX(SUM(oi.quantity)) over (partition by month(o.order_date)) as max_quantity
FROM ORDER_ITEMS oi
JOIN Orders o
ON oi.orders_id = o.order_id
WHERE YEAR (o.order_date)  = 2022
GROUP BY oi.orders_id
ORDER BY 4 DESC;

-- primera opición 

WITH T1 AS(
	SELECT oi.orders_id, sum(oi.quantity) AS cant_total, o.order_date, month(o.order_date) AS Mes
	FROM ORDER_ITEMS oi
	JOIN Orders o
	ON oi.orders_id = o.order_id AND YEAR(order_date) = 2022
	GROUP BY orders_id
)

	SELECT T1.orders_id, T1.cant_total, T1.order_date, 
   		(
  		SELECT Mes FROM T1 GROUP BY Mes ORDER BY SUM(T1.cant_total) DESC LIMIT 1) AS Mes_Mas_Productos
	FROM T1;

----------------------------------------------------------------------------------------------------------------------------------------------------
-- 36.Para cada categoría, determinar la locación en la que se encuentran la mayor cantidad de productos.
use Daianaolivera1;
SELECT p.category_id,l.location_id,w.warehouse_id, MAX(i.quantity) AS total_product
FROM WAREHOUSE w
JOIN LOCATION l
JOIN PRODUCTS p
JOIN INVENTORIES i
ON p.product_id  = i.product_id and w.location_id = l.location_id and w.warehouse_id = i.warehouse_id
GROUP BY p.category_id
ORDER BY MAX(i.quantity)ASC;

--- PRIMERA OPCIÓN 

SELECT T.category_id, T.location_id, T.Cant_Prod
FROM (
	SELECT p.category_id, w.location_id, SUM(i.quantity) AS Cant_Prod,
		MAX(SUM(i.quantity)) OVER (PARTITION BY p.category_id) AS MAX_CANT
	FROM PRODUCTS p, INVENTORIES i, WAREHOUSE w, LOCATION l
	WHERE p.product_id = i.product_id AND i.warehouse_id = w.warehouse_id AND w.location_id = l.location_id
	GROUP BY p.category_id, w.location_id) as T
WHERE Cant_Prod = MAX_CANT;

select *
from LOCATION;

select *
from PRODUCTS;