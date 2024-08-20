use Daianaolivera1;
-- 1 TABLA CUSTOMERS 
SELECT * 
FROM Customers;

INSERT INTO Customers (customers_id, name,    address,    websites,    credit_limit)
VALUES (1, 'Gricelda Luebbers', '133 El Rio Blvd', 'www.check_wifi.com', 1),
    (2, 'Dean Bollich', '960 Lemoore Station Place', 'www.ventas_uyu.com', 41),
    (3, 'Milo Manoni', '902 Cedar Park Place', 'www.com_fam.com', 80),
    (4, 'Laurice Karl', '252 Baye Street', 'www.doble_check.com', 67),
    (5, 'August Rupel', '622 Pointe a la Hache Ave', 'www.vista.com', 6),
    (6, 'Salome Guisti', '611 Lorenzano Ave', 'www.mundo_datos.com', 34),
    (7, 'Lovie Ritacco', '113 Timber Pines Blvd', 'www.para_verificar.com', 25),
    (8, 'Chaya Greczkowski', '266 Yardville Street', 'www.revisando_todo.com', 61),
    (9, 'Twila Coolbeth', '691 Homeland Ave', 'www.compras_mayor.com', 38),
    (10, 'Carlotta Achenbach', '936 Ashley Heights Place', 'www.compras_menor.com', 38);

-- 2 TABLA EMPLOYEE
SELECT * 
FROM EMPLOYEES;

-- Agrego yo al final los campos hire_date y phone no estaban en el juego de datos provisto
INSERT INTO EMPLOYEES (employee_id,     first_name,    last_name,    email,    manager_id,    job_title, hire_date, phone)
VALUES (1, 'Gricelda', 'Luebbers', 'gricelda.luebbers@aaab.com', 1, 'seller', now(), '12345678'),
(2, 'Dean', 'Bollich', 'dean.bollich@aaac.com', 1, 'seller', now(), '11334455'),
(3, 'Milo', 'Manoni', 'milo.manoni@aaad.com', 1, 'seller', '2020-04-11', '87654321'),
(4, 'Laurice', 'Karl', 'laurice.karl@aaae.com', 2, 'seller', now(), '12344321'),
(5, 'August', 'Rupel', 'august.rupel@aaaf.com', 2, 'seller', '2024-04-25', '44443333'),
(6, 'Salome', 'Guisti', 'salome.guisti@aaag.com', 2, 'seller', now(), '12121212'),
(7, 'Lovie', 'Ritacco', 'lovie.ritacco@aaah.com', 2, 'seller', '2023-12-30', '99998888'),
(8, 'Chaya', 'Greczkowski', 'chaya.greczkowski@aaai.com', 2, 'seller', now(), '56748329'),
(9, 'Twila', 'Coolbeth', 'twila.coolbeth@aaaj.com', 3, 'seller', now(), '22233344'),
(10, 'Carlotta', 'Achenbach', 'carlotta.achenbach@aaak.com', 3, 'seller', now(), '11225544');

-- 3 TABLA CONTACTS
SELECT * 
FROM CONTACTS;

INSERT INTO CONTACTS (contact_id, first_name, last_name, email, phone, custormers_id)
VALUES (1, 'Gricelda', 'Luebbers', 'gricelda.luebbers@aaab.com', '01154539869', 3),
(2, 'Dean', 'Bollich', 'dean.bollich@aaac.com', '01154539870', 9),
(3, 'Milo', 'Manoni', 'milo.manoni@aaad.com', '2914753405', 9),
(4, 'Laurice', 'Karl', 'laurice.karl@aaae.com', '2914753410', 4),
(5, 'August', 'Rupel', 'august.rupel@aaaf.com', '2804565859', 8),
(6, 'Salome', 'Guisti', 'salome.guisti@aaag.com', '2804565860', 7),
(7, 'Lovie', 'Ritacco', 'lovie.ritacco@aaah.com', '1174859636', 4),
(8, 'Chaya', 'Greczkowski', 'chaya.greczkowski@aaai.com', '1174859660', 5),
(9, 'Twila', 'Coolbeth', 'twila.coolbeth@aaaj.com', '1174859670', 10),
(10, 'Carlotta', 'Achenbach', 'carlotta.achenbach@aa...', '1174859680', 8);

-- 4 TABLA Orders
SELECT * 
FROM Orders;

INSERT INTO Orders (order_id,   custormers_id,    status,    salesman_id,    order_date)
VALUES (1, 5, 'delivered', 1, '2022-05-01'),
(2, 9, 'delivered', 9, '2022-01-01'),
(3, 1, 'delivered', 10, '2022-02-01'),
(4, 6, 'delayed', 2, '2022-03-01'),
(5, 6, 'delayed', 1, '2022-04-01'),
(6, 9, 'delayed', 7, '2023-01-01'),
(7, 1, 'in_process', 3, '2022-10-01'),
(8, 3, 'in_process', 10, '2022-12-01'),
(9, 3, 'in_process', 4, '2022-09-01'),
(10, 9, 'delivered', 3, '2022-08-01');

INSERT INTO Orders (order_id,   custormers_id,    status,    salesman_id,    order_date)
VALUES (11, 1, 'delivered', 1, '2022-05-01');


-- 5 TABLA REGIONS
SELECT * 
FROM REGIONS ;

INSERT INTO REGIONS  (region_id, region_name)
VALUES (1, 'Wifi Analysis'),
(2, 'Identity Management Modernization'),
(3, 'JIT Distributed Manufacturing'),
(4, 'Open Source Review'),
(5, 'Mach Practices'),
(6, 'Release Cycle Change'),
(7, 'Git Migration'),
(8, 'Actionable Analytics'),
(9, 'Blockchain System Rollout'),
(10, 'Manufacturing Plan');

-- 6 TABLA COUNTRIES
SELECT *
FROM COUNTRIES;

INSERT INTO COUNTRIES(country_id, country_name, region_id)
VALUES  (1, 'USA', 5),
  (2, 'USA', 3),
  (3, 'USA', 1),
  (4, 'Canada', 7),
  (5, 'Canada', 4),
  (6, 'Canada', 1),
  (7, 'Mexico', 6),
  (8, 'Mexico', 10),
  (9, 'Mexico', 9),
  (10, 'USA', 6);

-- 7 TABLA LOCATION
SELECT * 
FROM LOCATION;

INSERT INTO LOCATION(location_id,    address,    postal_code,    city,    state,    country_id)
VALUES (1, '987 Doraville Place', 7, 'Tanquecitos', 'Lorem sit amet, imperdiet ex. Etiam cursus.', 5),
(2, '349 Fort Yukon Street', 41, 'Sugarloaf', 'Maine', 10),
(3, '224 Caruthersville Street', 16, 'Dale City', 'Maryland', 10),
(4, '630 Trenay Ave', 9, 'Grosvenor', 'Maryland', 8),
(5, '618 Dale Ave', 80, 'Riverside', 'Riverside ', 1),
(6, '109 Arkdale Blvd', 66, 'Ridgeley', 'West Virginia', 1),
(7, '461 Pluneret Street', 7, 'Ashley Heights', 'North Carolina', 7),
(8, '468 Ridgeley Street', 11, 'Monfort Heights', 'Ohio', 1),
(9, '705 Jiutepec Ave', 77, 'Point Marion', 'Pennsylvania', 9),
(10, '922 Navamorales Place', 67, 'Eldon', 'Iowa', 9);

-- 8 TABLA 
select * from WAREHOUSE;

INSERT INTO WAREHOUSE (warehouse_id,    warehouse_name,    location_id)
VALUES (1, 'Wifi Analysis', 3),
    (2, 'Identity Management Modernization', 1),
    (3, 'JIT Distributed Manufacturing', 3),
    (4, 'Open Source Review', 10),
    (5, 'Mach Practices', 4),
    (6, 'Release Cycle Change', 5),
    (7, 'Git Migration', 3),
    (8, 'Actionable Analytics', 5),
    (9, 'Blockchain System Rollout', 6),
    (10, 'Manufacturing Plan', 2);

-- 9 TABLA PRODUCT_CATEGORIES
select * from PRODUCT_CATEGORIES;

INSERT INTO PRODUCT_CATEGORIES (category_id,    category_name)
VALUES (1, 'Wifi Analysis'),
    (2, 'Identity Management Modernization'),
    (3, 'JIT Distributed Manufacturing'),
    (4, 'Open Source Review'),
    (5, 'Mach Practices'),
    (6, 'Release Cycle Change'),
    (7, 'Git Migration'),
    (8, 'Actionable Analytics'),
    (9, 'Blockchain System Rollout'),
    (10, 'Manufacturing Plan');

-- 10 TABLA PRODUCTS
SELECT * 
FROM PRODUCTS;

INSERT INTO PRODUCTS (product_id,    product_name,    description_id,    standard_coast,    list_price,    category_id)
VALUES (1, 'Wifi Analysis', 'Posuere cubilia Curae', 90, 9.50, 5),
    (2, 'Identity Management Modernization', 'Cursus porttitor tincidunt.', 53, 63.50, 2),
    (3, 'JIT Distributed Manufacturing', 'Massa pharetra, id mattis risus rhoncus..', 59, 78.00, 5),
    (4, 'Open Source Review', 'Placerat pellentesque. ', 65, 99.25, 10),
    (5, 'Mach Practices', 'Semper diam suscipit elementum sodales.', 2, 84.75, 4),
    (6, 'Release Cycle Change', 'Sit amet massa eu lorem commodo ullamcorper.', 37, 36.52, 3),
    (7, 'Git Migration', 'Nam semper diam suscipit elementum sodales.', 92, 47.25, 7),
    (8, 'Actionable Analytics', 'Tristique ac volutpat risus.', 6, 69.30, 6),
    (9, 'Blockchain System Rollout', 'Semper diam suscipit elementum sodales.', 54, 59.75, 7),
    (10, 'Manufacturing Plan', 'Tincidunt. ', 42, 83.56, 3);

-- 11 TABLA INVENTORIES
SELECT *
FROM INVENTORIES;

INSERT INTO INVENTORIES (inventories_id,   product_id,    warehouse_id,    quantity)
VALUES (1, 4, 4, 20),
    (2, 9, 6, 11),
    (3, 9, 6, 16),
    (4, 10, 3, 74),
    (5, 2, 5, 44),
    (6, 4, 6, 92),
    (7, 8, 5, 66),
    (8, 8, 6, 61),
    (9, 9, 2, 18),
    (10, 5, 9, 30);