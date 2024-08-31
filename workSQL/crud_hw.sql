--Створіть таблицю “pizza” (“id”, “name”, “price”, “diameter”). Валюту не враховуємо!
DROP TABLE IF EXISTS "pizza";
CREATE TABLE IF NOT EXISTS pizza (
    id serial PRIMARY KEY,
    "name" varchar(64) NOT NULL CHECK ("name" != ''),
    "price" DECIMAL(5, 2) NOT NULL CHECK ("price">0 ),
    "diameter" DECIMAL(4, 1) NOT NULL CHECK ("diameter" > 15 AND "diameter" < 45)
);
SELECT *
FROM pizza;

--INSERT

--Додати нову піцу Маргарита, діаметр 18, ціна 50,4грн.
INSERT INTO pizza (name, diameter, price)
VALUES (
    'Margarita',
    18,
    50.4
  );

--Додати нову піцу Карбонара, діаметр 28, ціна 81грн.
INSERT INTO pizza (name, diameter, price)
VALUES(
    'Carbonara',
    28,
    81 
  );

--Додайте дві нові піци одним запитом: Цезар, діаметр 38, ціна 149грн, Пепероні, діаметр 32, ціна 116грн
INSERT INTO pizza (name, diameter, price)
VALUES (
    'Caesar',
    38,
    149
  ),(
    'Pepperoni',
    32,
    116
  );


--UPDATE

--Поставте ціну Маргаріті 53грн.
UPDATE pizza
SET "price" = 53
WHERE "name" ILIKE 'Margarita';

--Піца з id=4 поставте діаметр 30, поверніть усі оновлені данні.
UPDATE pizza
SET "diameter" = 30
WHERE id = 4
RETURNING *;

--Усім піцам, чия ціна більша за 100грн зробіть її 130грн, поверніть усі оновлені данні.
UPDATE pizza
SET "price" = 130
WHERE "price" > 100
RETURNING *;

--Піц з id більше 2 і менше 5 включно поставте діаметр 22.
UPDATE pizza
SET "diameter" = 22
WHERE id > 2 AND id < 5;

--Змініть Цезар на 4 сири та поставте ціну 180
UPDATE pizza
SET "name" = '4 gray', "price" = 180
WHERE "name" ILIKE 'Caesar';

--SELECT

--Вибрати піцу з id=3.
SELECT*
FROM pizza
WHERE id = 3;

--Вибрати піцу із ціною менше 100грн.
SELECT*
FROM pizza
WHERE "price" < 100;

--Вибрати піцу з ціною не рівною 130грн.
SELECT*
FROM pizza
WHERE "price" != 130;

--Дізнайтесь ціну і діаметр Пепероні.
SELECT "price", "diameter"
FROM pizza
WHERE "name" ILIKE 'Pepperoni';

-- Вибрати піцу під назвою Маргарита.
SELECT *
FROM pizza
WHERE "name" ILIKE 'Margarita';

--Вибрати всі піци, крім тієї, яка називається Карбонара.
SELECT *
FROM pizza
WHERE "name" NOT ILIKE 'Carbonara';

-- Вибрати всі піци діаметром 22 та ціною менше 150грн.
SELECT *
FROM pizza
WHERE "diameter" = 22 AND "price" < 150;

-- Вибрати піцу з діаметром від 25 до 33 включно.
SELECT *
FROM pizza
WHERE "diameter" > 25 AND "diameter" <= 33;

-- Вибрати піци з діаметром від 25 до 33 або з ціною від 100 до 200 грн.
SELECT *
FROM pizza
WHERE "diameter" > 25 AND "diameter" <= 33 OR "price" > 100 AND "price" < 200; 

-- Вибрати всі піци діаметром 22 або 180грн.
SELECT *
FROM pizza
WHERE "diameter" = 22 OR "price" = 180; 

--DELETE

-- Видаліть піцу з id=3.
DELETE FROM pizza
WHERE id = 3;

-- Видаліть Пепероні, поверніть усі видалені данні.
DELETE FROM pizza
WHERE "name" ILIKE 'Pepperoni'
RETURNING*;

-- Видаліть всі піци, які мають діаметр 18, поверніть усі видалені данні.
DELETE FROM pizza
WHERE "diameter" = 18
RETURNING*;