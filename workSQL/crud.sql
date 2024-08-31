SELECT id,
    height
FROM users;

UPDATE users
SET height =(height + 0.02)
WHERE "isMale" IS TRUE 
    AND age(birthday) < make_interval(40)  
RETURNING *;

UPDATE users
SET "firstName"='Tom', "email"='Tom@gmail.com'
WHERE id=4
RETURNING *;


--UPDATE
-- task 1 
UPDATE users
SET height = (height + 0.01)
WHERE "isMale" IS FALSE
    AND "firstName" ILIKE 'a%'
RETURNING "id", "height", "isMale", "firstName";

-- task 2

UPDATE users
SET email = concat(lower("lastName"), '.', lower("firstName"),id, '@gmail.com')
WHERE "isMale" IS TRUE AND "lastName" SIMILAR TO '%(s|d|e)'
RETURNING id, "firstName", "lastName", "email";


--DELETE

