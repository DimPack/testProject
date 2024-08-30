-- айді користувачів, у яких більше 3 замовлень
-- айді замовлень з телефоном 22 i пошту користувачів
-- 5 телефонів, які купували з найбільшою кількістю

SELECT o."userId", COUNT(o.id), u.email
FROM orders AS o
    JOIN users AS u ON o."userId" = u.id 
GROUP BY o."userId", u.email
HAVING COUNT(o.id) > 3;

SELECT distinct o."userId", u.email, sum(pto.quantity)
FROM users u 
    JOIN orders o ON u.id = o."userId"
    JOIN phones_to_orders pto ON o.id = pto."orderId"
WHERE pto."phoneId" = 22
GROUP BY o."userId", u.email
HAVING sum(pto.quantity) > 5
ORDER BY o."userId";

SELECT p.model, sum(p.quantity) as summa
FROM phones p
    JOIN phones_to_orders pto ON p.id=pto."phoneId"
GROUP BY p.model
ORDER BY summa DESC
LIMIT 5;

-- дістати усі моделі телефонів конкретного замовлення 56


SELECT p."model"
FROM phones_to_orders pto
    JOIN phones p ON pto."phoneId"=p."id"
WHERE pto."orderId"=41

-- дістати пошту користувача і кількість моделей які він купляв

SELECT u."email", pto."phoneId"
FROM users u
    JOIN orders o ON u."id"=o."userId"
    JOIN phones_to_orders pto ON o."id"=pto."orderId"
    WHERE u.id = 25
GROUP BY u."email";

SELECT pto."orderId", sum(pto."quantity" * p."price") AS summa
FROM phones_to_orders pto
    JOIN phones p ON pto."phoneId"=p."id"
GROUP BY pto."orderId" 
ORDER BY summa DESC;