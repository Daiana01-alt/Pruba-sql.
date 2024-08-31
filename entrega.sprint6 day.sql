-- 20.Calcular la antiguedad de cada empleado, tomando como fecha inicial la mínima hire_date de la tabla ELOYEES.
#Como resultado final, se espera una tabla como employee_id, first and last name, hire_date y antiguedad
# (calculada en dias; se puede ulitilizar la función DATEDIFF).

use Daianaolivera1;
SELECT employee_id, first_name, last_name, hire_date, 
    DATEDIFF(hire_date, (SELECT MIN(hire_date) FROM EMPLOYEES)) AS antiguedad
FROM 
    EMPLOYEES;
    
-- Resultado basado de hoy, al hire_date de contratación.
use Daianaolivera1;
SELECT 
  employee_id,
  first_name,
  last_name,
  hire_date ,
  DATEDIFF(NOW(), e.hire_date) AS antiguedad 
FROM EMPLOYEES e
ORDER BY hire_date DESC;
    
-- 21.Determinar todas las warehouses y la cantidad de productos 
#almacenados sea mayor al promedio de los productos almacenados por warehouses.

use Daianaolivera1;
WITH Warehouse_Product_Count AS (
    SELECT warehouse_id, COUNT(product_id) AS product_count
    FROM INVENTORIES
    GROUP BY warehouse_id
), -- RESULTADO = product_count

Average_Product_Count AS (
    SELECT AVG(product_count) AS avg_product_count
    FROM Warehouse_Product_Count
) -- resultado = avg_product_count

SELECT w.warehouse_id, w.warehouse_name, wpc.product_count
FROM WAREHOUSE w
JOIN Warehouse_Product_Count wpc ON w.warehouse_id = wpc.warehouse_id
-- unimos nuestra tabla con la tabla fictisia wharehouse_product por w.id
-- como resultado tenemos todas nuestras columnas de la tabla warehouse y product_count que vine de la nueva tabla fictisia.
WHERE  wpc.product_count > (SELECT avg_product_count from Average_Product_Count); 
-- cumplimos la condición , buscando nuestra columna fictisia comparandola con avg_product_count o con la tabla de promedio.  

WITH AvgProductCount AS (
    SELECT AVG(product_count) AS avg_product_count
    FROM (
        SELECT COUNT(i.product_id) AS product_count
        FROM INVENTORIES i
        GROUP BY i.warehouse_id
    ) AS subquery
),
WarehouseProductCount AS (
    SELECT 
        w.warehouse_id, 
        w.warehouse_name, 
        COUNT(i.product_id) AS product_count
    FROM WAREHOUSE w
    JOIN INVENTORIES i ON w.warehouse_id = i.warehouse_id
    GROUP BY w.warehouse_id)
    -- Consulta principal utilizando las CTES
SELECT 
    w.warehouse_id, 
    w.warehouse_name, 
    w.product_count
FROM WarehouseProductCount w, AvgProductCount a
WHERE w.product_count > a.avg_product_count;
-- vesrsión mas corta 

select*
FROM INVENTORIES;

select*
FROM WAREHOUSE;

-- 22.Top 3 de los productos que contengan la letra "E" en su nombre y su list_price sea
# menor al promedio del resto.
use Daianaolivera1;      
WITH Avg_Price_Without_E AS (
    SELECT AVG(list_price) AS avg_price
    FROM PRODUCTS
    WHERE product_name NOT LIKE '%E%' AND product_name NOT LIKE '%e%'
),
Products_With_E AS (
    SELECT product_id, product_name, list_price
    FROM PRODUCTS
    WHERE product_name LIKE '%E%' OR product_name LIKE '%e%'
)
SELECT product_id, product_name, list_price
FROM Products_With_E
WHERE list_price < (SELECT avg_price FROM Avg_Price_Without_E)
ORDER BY list_price ASC
LIMIT 3;
-- 1* Realizamos una consulta temporal  utilizando el "whit" agregando el as  "Avg_Price_Without_E", del cual calculamos el promedio de list price de la tabla "Products".
-- 2* Realizamos una tabla tempral itilizando el as "Products_With_E" de la tabla "Products" , para obtener los productos con letra "E". terminas uniendo las dos tablas.
-- 3* Terminas uniendo las dos tablas utilizando el as  "Products_With_E" donde calculamos desde "list_price" el promedio  de la tabla "Avg_Price_Without_E",
--  para obtener el resultado del promedio menor al resto de los productos, resultado final  avg list_price 36.52. 

-- 23.Retornar la cantidad de warehouses por locación.
use Daianaolivera1;
SELECT location_id, COUNT(warehouse_id) AS warehouse_count
FROM WAREHOUSE w
GROUP BY location_id;

SELECT*
FROM WAREHOUSE;

-- 24.Imprimir la cantidad de productos agrupados por nombre de los mismos.
use Daianaolivera1;
SELECT product_name, COUNT(product_id) AS product_count
FROM PRODUCTS p
GROUP BY product_name;

SELECT*
FROM PRODUCTS;


-- 25.Top 5 de los nombres de los empleados con mayor cantidad de ventas.

use Daianaolivera1;
SELECT e.employee_id, e.first_name, e.last_name, COUNT(o.order_id) AS Ventas_count
FROM EMPLOYEES e
JOIN Orders o ON e.employee_id = o.salesman_id
GROUP BY e.employee_id, e.first_name
ORDER BY Ventas_count DESC
LIMIT 5;
-- Los empleados con mayor cantidad de ventas es Gricelda, Milo, Carlotta.

-- 26. Retornar los nombres de los warehouses que poseen almacenados mas de 50 productos.

use Daianaolivera1;
SELECT w.warehouse_name,w.warehouse_id
FROM WAREHOUSE w
JOIN INVENTORIES i ON w.warehouse_id = i.warehouse_id
WHERE i.quantity > 50
GROUP BY w.warehouse_name;

select *
from INVENTORIES;

-- 27.Top 5 de empleados con mas de 10 órdenes entregadas.
use Daianaolivera1;
SELECT e.employee_id, e.first_name, COUNT(o.order_id) AS delivered_orders
FROM EMPLOYEES e
JOIN Orders o ON e.employee_id = o.salesman_id
WHERE o.status = "delivered"
GROUP BY e.employee_id, e.first_name
ORDER BY delivered_orders DESC
LIMIT 5;

select*
from Orders;

-- 28. Top 3 del nombre de empleados que hayan realiazado ordenes con mas de 5  productos totales.
use Daianaolivera1;
SELECT employee_id ,e.first_name,o.order_id, COUNT(order_id) AS total_orders ,ot.quantity as product_ammount
FROM EMPLOYEES e
JOIN Orders o ON e.employee_id = o.salesman_id
JOIN ORDER_ITEMS ot ON o.order_id = ot.orders_id
WHERE ot.quantity > 5
GROUP BY e.employee_id
LIMIT 3;


