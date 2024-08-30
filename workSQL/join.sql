-- INNER JOIN

-- отримати замовлення користувача з id = 33
SELECT u.id, email, orders.id
FROM users AS u
    JOIN orders AS o ON u.id = orders."userId"
WHERE u.id=33;