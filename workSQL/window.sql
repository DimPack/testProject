-- пошта і кількість замовлень

SELECT users.id, users.email, count(orders.id) OVER (PARTITION BY orders."userId")
FROM users
    JOIN orders ON users.id=orders."userId";

--телефон і загальну суму по замовленю
SELECT p.id, p.model, p.price, pto."orderId",  sum(p.price*pto.quantity) OVER (PARTITION BY p.price)
FROM phones p
    JOIN phones_to_orders pto ON p.id=pto."phoneId"