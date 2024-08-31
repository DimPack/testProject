SELECT max("weight")
From users;
SELECT *
FROM users
WHERE weight = (
        SELECT max("weight")
        FROM users
    );

SELECT *
FROM users
WHERE height = (
        SELECT min("height")
        FROM users
    );

SELECT sum("weight"),
    "isMale"
From users
WHERE "firstName" ILIKE 'a%'
GROUP BY "isMale";
SELECT COUNT(*),
    "isMale"
FROM users
GROUP BY "isMale";

--кількість народжених 1979 році
SELECT COUNT(*),
    EXTRACT(
        YEAR
        from birthday
    ) AS yearbd
FROM users
WHERE EXTRACT(
        year
        from birthday
    ) = 1979
GROUP BY yearbd;

--кількість народжених кожного місяця
SELECT COUNT(*),
    EXTRACT(
        month
        from birthday
    ) AS "monthBday",
    "isMale"
FROM users
GROUP BY "monthBday",
    "isMale";

--кількість ч/ж у яких зріст більше 1.8
SELECT COUNT(*),
    "isMale"
FROM users
WHERE height > 1.8
GROUP BY "isMale";

--кількість штук проданих телефонів 
SELECT sum(quantity), "phoneId"
FROM phones_to_orders
GROUP BY "phoneId";

--кількість штук телефонів в одному замовлені 
SELECT sum(quantity), "orderId"
FROM phones_to_orders
GROUP BY "orderId";

-- ceредня ціна по телефону
SELECT avg(price)
FROM phones;

-- ceредня ціна по Бренду телефону
SELECT avg(price) , "brand"
FROM phones
GROUP BY "brand";

-- кількість 
SELECT COUNT(*) , "brand"
FROM phones
GROUP BY "brand";


--кількість замовлень кожного користувача які робили замовлення 
SELECT count(*), "userId"
FROM orders
GROUP BY "userId";

--кількість назв брендів які почиаються на S
SELECT count(*), brand
FROM phones
WHERE brand ILIKE 's%'
GROUP BY brand;   