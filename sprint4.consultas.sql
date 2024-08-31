#------------------------------------ //SPRINT 4 DAY// ---------------------------------------#


-- 3.Imprimir todos los nombres y dirección de los usuarios con Credit_limit > 50.

use Daianaolivera1;
SELECT name,address,credit_limit
FROM Customers
WHERE credit_limit > 50;

-------------------------------------------------------------------------------------------
-- 4. Top 5 de los nombres y website de los usuarios con Cedit_limit entre 20 y 40.

use Daianaolivera1;
SELECT name,websites,credit_limit
FROM Customers
WHERE credit_limit BETWEEN 20 AND 40;

--------------------------------------------------------------------------------------------
-- 5. Imprimir las ordenes que hayan sido solicitadas en 2023.

use Daianaolivera1;
SELECT *
FROM Orders
WHERE YEAR (order_date) = 2023;
---------------------------------------------------------------------------------------------

-- 6. Top 5 de los productos, su Standard_coast y Description  , 
-- considera unicamente aquellos que tienen la description completa.

use Daianaolivera1;
SELECT p.product_name,p.product_id,p.standard_coast,description
FROM PRODUCTS p
WHERE description <> ''
ORDER BY p.product_id DESC
LIMIT 5;