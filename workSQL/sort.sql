--сортувати рядочки
-- сортувати групи

SELECT id, email, height, birthday
FROM users
ORDER BY height ASC, birthday DESC;

SELECT id, email, height
FROM users
ORDER BY height DESC, email ASC;


SELECT id, "firstName", EXTRACT(YEAR from age(birthday))  AS "age"
FROM users
ORDER BY  "age" ASC , "firstName" DESC ;


SELECT * FROM
(SELECT id, "firstName", EXTRACT(YEAR from age(birthday))  AS "age"
FROM users)
WHERE "age"<40
ORDER BY  "age" ASC , "firstName" DESC ;

SELECT * FROM
(SELECT COUNT(*) as "amount", EXTRACT(YEAR from age(birthday))  AS "age" 
FROM users
GROUP BY "age")

WHERE "amount" > 2
ORDER BY "amount" DESC;


SELECT COUNT(*) AS "count", "brand"
FROM phones
GROUP BY "brand"
HAVING COUNT(*) <5
ORDER BY "count" ASC;

SELECT "phoneId", sum("quantity") AS "summa"
FROM phones_to_orders
GROUP BY "phoneId"
ORDER BY "suma" DESC
LIMIT 5;

--1
SELECT "phoneId", sum("quantity") AS "summa"
FROM phones_to_orders
GROUP BY "phoneId"
HAVING sum("quantity") BETWEEN 130 AND 140;

--2
SELECT * FROM
(SELECT "phoneId", sum("quantity") AS "summa"
FROM phones_to_orders
GROUP BY "phoneId")
WHERE "summa" BETWEEN 130 AND 140;

SELECT COUNT(*) , EXTRACT(MONTH FROM birthday)  AS "mount" 
FROM users
GROUP BY "mount"
HAVING COUNT(*) > 3
ORDER BY "mount";

SELECT * FROM 
(SELECT "email"
FROM users
WHERE "email" ILIKE 'a%'
GROUP BY "email")
WHERE LENGTH("email");


SELECT COUNT(*), LENGTH("email") AS "length"
FROM users
WHERE "email" ILIKE 'a%' AND LENGTH("email") < 25
GROUP BY "length";

SELECT COUNT(*), LENGTH("email") AS "length"
FROM users
WHERE "email" ILIKE 'a%'
GROUP BY "length"
HAVING COUNT(*) > 1;
--агрегатна фунткція COUNT sum avg min max


SELECT height , count(*) as amount
FROM users
GROUP BY height
HAVING height < 1.35