SELECT * FROM "order" WHERE employee_id =2 AND status = TRUE; --"Выборка по всем проданным машинам конкретным менеджером"

SELECT o.customer_id, count(*) AS car_count  FROM "order" o WHERE customer_id=1 AND status = TRUE 
GROUP BY o.customer_id; -- Сколько конкретный покупатель купил машин.

SELECT c.name_carbrand AS brand, c2.name_carmodel AS model FROM carbrand c JOIN carmodel c2 ON c.id=c2.brand_id; --простое соединение 2х таблиц

SELECT DISTINCT c.name_carbrand AS brand, count(c.name_carbrand) AS count_models FROM carbrand c JOIN carmodel c2 ON c.id=c2.brand_id
 GROUP BY c.name_carbrand; -- количество моделей каждого бренда

SELECT DISTINCT c.name_carbrand AS brand, count(c.name_carbrand) AS count_cars FROM carbrand c 
 JOIN carmodel c2 ON c.id=c2.brand_id JOIN car c3 ON c2.id=c3.model_id  
 GROUP BY c.name_carbrand; --количество машин каждого бренда

SELECT c.id AS "Номер клиента", c.first_name AS "Имя клиента", c.last_name AS "Фамилия клиента", o.id AS "Номер заказа", o.date_order AS "Дата заказа"  
FROM customer c JOIN "order" o  ON o.customer_id =c.id
WHERE o.status= true;
--когда, какой клиент и какой заказ оформил

SELECT c.id AS "Номер клиента", c.first_name AS "Имя клиента", c.last_name AS "Фамилия клиента", o.id AS "Номер заказа", e.id AS "Менеджер", o.date_order AS "Дата заказа"  
FROM customer c JOIN "order" o  ON o.customer_id =c.id
JOIN employee e ON e.id =o.employee_id 
WHERE o.status= true
--в дополнение к предыдущему запросу узнать, какой продавец обслуживал заказ

SELECT c.id AS "Номер клиента", CONCAT(c.first_name, c.last_name) AS "Клиент", o.id AS "Номер заказа", CONCAT(e.first_name, e.last_name) AS "Менеджер", o.date_order AS "Дата заказа"  
FROM customer c JOIN "order" o  ON o.customer_id =c.id
JOIN employee e ON e.id =o.employee_id 
WHERE o.status= true; -- или объединив имя и фамилии в один столбец

