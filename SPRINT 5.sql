# R13.IMPRIMIR EL TITULO DE LOS EMPLEADOS QUE SU ID EMPIEZA CON(8)
# ESTE CAMPO LO SUSTITUTI PORQUE NO TENGO DATOS EN FECHA DE INGRESO, POR ESO TOME DATOS DE EL "ID".use Daianaolivera1;
-- TABLA 4 EMPLOYEES
use Daianaolivera1;
SELECT employee_id,job_title
FROM EMPLOYEES 
WHERE employee_id LIKE "%8%";

-- 13.Imprimir el titulo de empleados que fueron contratados entre 1/1/2022 y el 1/6/20222.
use Daianaolivera1;
SELECT job_title,employee_id
FROM EMPLOYEES
WHERE (hire_date) BETWEEN '2022-01-01' AND '2024-01-01';
# ESTA QUERI ES PARA CALCULAR FECHAS 

SELECT job_title,employee_id
FROM EMPLOYEES
WHERE YEAR (hire_date) = 2023;


# R14.TOP 3 POR LIST_PRICE DE LOS PRODUCTOS CUYO ID SE ENCUANTRA EN LA SIGUIENTE LISTA (9,5,4).
-- TABLA 10 PRODUCTS
use Daianaolivera1;
SELECT list_price,product_id
FROM PRODUCTS P
WHERE P.product_id IN (9,5,4)
ORDER BY list_price DESC
LIMIT 3;

# R15.TOP 5 POR LA CANTiDAD DE LOS PRODUCTOS QUE EMPIEZAN CON LA LETRA "M"
-- TABLA 10 PRODUCTS
use Daianaolivera1;
SELECT DISTINCT PRODUCTS.product_name,INVENTORIES.quantity
FROM PRODUCTS 
INNER JOIN INVENTORIES
ON PRODUCTS.product_id= INVENTORIES.product_id
WHERE product_name LIKE "M%"
ORDER BY quantity
LIMIT 5;

# R16. IMPRIMIR LA  REGION Y LOS NOMBRE DE LOS WHEREHOSES ÚNICOS.
-- TABLA 12 WAREHOUSE
use Daianaolivera1;
SELECT w.warehouse_id,w.warehouse_name,r.region_id,c.country_id,l.location_id,c.country_name,l.city
FROM WAREHOUSE w 
JOIN LOCATION l ON l.location_id = w.location_id	
JOIN COUNTRIES c ON c.country_id = l.country_id 
LEFT OUTER JOIN REGIONS r ON r.region_id = c.region_id
ORDER BY w.warehouse_id DESC ;

# R17.IMPRIMIR EL NOMBRE DE LOS PRODUCTOS Y SU LIST_PRICE PARA AQUELLOS QUE TENGAN UNA CANTIDAD MAYOR A 10,
# ORDENES DE FORMA ASCENDENTE.
-- TABLA 10 PRODUCTS
use Daianaolivera1;
SELECT DISTINCT p.product_name,p.list_price
FROM PRODUCTS p
JOIN INVENTORIES i
ON p.product_id = i.product_id AND i.quantity > 10
ORDER BY list_price ASC;


# R18.TOP 3 DE WHEREHOUSES_ID CUYOS PRODUCTOS TENGAN UN LIST_PRICE MENOR A 100
-- TABLA 10 WAREHOUSE
use Daianaolivera1;
SELECT WAREHOUSE.warehouse_id,WAREHOUSE.warehouse_name
FROM WAREHOUSE
JOIN PRODUCTS
ON WAREHOUSE.warehouse_id=PRODUCTS.product_id
WHERE list_price < 100
LIMIT 3;

# R19.IMPRIMIR EL ORDER_DATE Y PRODUCT_ID DE LAS ORDENES QUE TENGAN ORDER_DATE EN 2023.
-- TABLA 8 Orders
use Daianaolivera1;
SELECT *  
FROM Orders ord JOIN ORDER_ITEMS ort ON (ord.order_id = ort.orders_id) 
WHERE YEAR (ord.order_date) = 2023
ORDER BY ord.order_id, ort.product_id, ord.order_date DESC; 




