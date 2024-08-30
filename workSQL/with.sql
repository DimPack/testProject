-- дістати замовлення вище середньої суми

SELECT pto."orderId", sum(pto."quantity" * p."price") as cost
FROM phones_to_orders pto
    JOIN phones p ON pto."phoneId"=p.id
GROUP BY pto."orderId";

-- середня  сума
SELECT avg(orders_cost.cost)
FROM(
    SELECT pto."orderId", sum(pto."quantity" * p."price") as cost
FROM phones_to_orders pto
    JOIN phones p ON pto."phoneId"=p.id
GROUP BY pto."orderId"
) as orders_cost;

-- замовлення вище сереньої суми

SELECT *
FROM(
    SELECT pto."orderId", sum(pto."quantity" * p."price") as cost
FROM phones_to_orders pto
    JOIN phones p ON pto."phoneId"=p.id
GROUP BY pto."orderId"
) as orders_cost
WHERE orders_cost.cost > (
    SELECT avg(orders_cost.cost)
FROM(
    SELECT pto."orderId", sum(pto."quantity" * p."price") as cost
FROM phones_to_orders pto
    JOIN phones p ON pto."phoneId"=p.id
GROUP BY pto."orderId"
) as orders_cost

)
ORDER BY orders_cost.cost;

--оптимізація з with

WITH orders_cost AS (    
    SELECT pto."orderId", sum(pto."quantity" * p."price") as cost
FROM phones_to_orders pto
    JOIN phones p ON pto."phoneId"=p.id
GROUP BY pto."orderId"
)

SELECT oc.*
FROM orders_cost oc
WHERE oc.cost > (
    SELECT avg(oc.cost)
FROM orders_cost as oc )
ORDER BY oc.cost;

-- дістати пошту користувачів, у яких кількість замовлень більше середнього значення
-- пошта і кількість замовлень
-- середня кількість
-- збираємо до купи запит
-- оптимізуємо з with

--1
SELECT u.email, COUNT(o.id)
FROM users u
    JOIN orders o ON u.id=o."userId"
GROUP BY u.email;

--2
SELECT avg(uc.count)
FROM (SELECT u.email, COUNT(o.id) as count
FROM users u
    JOIN orders o ON u.id=o."userId"
GROUP BY u.email) as uc

--3

SELECT uc.*
FROM (SELECT u.email, COUNT(o.id) as count
FROM users u
    JOIN orders o ON u.id=o."userId"
GROUP BY u.email) as uc
WHERE uc.count > (SELECT avg(uc.count)
FROM (SELECT u.email, COUNT(o.id) as count
FROM users u
    JOIN orders o ON u.id=o."userId"
GROUP BY u.email) as uc);

--4

WITH uc AS (
SELECT u.email, COUNT(o.id) as count
FROM users u
    JOIN orders o ON u.id=o."userId"
GROUP BY u.email )

SELECT uc.*
FROM uc
WHERE uc.count > (SELECT avg(uc.count) FROM uc);
