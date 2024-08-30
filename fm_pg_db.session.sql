INSERT INTO users (
    "firstName",
    "lastName",
    email,
    "isMale",
    birthday,
    height,
    weight
  )
VALUES (
    'Drad',
    'Pitt',
    'bradss@gmail.com',
    true,
    '200-01-05',
    1.8,
    92.3
  ),(
    'Fred',
    'Dasert',
    'Dasert@gmail.com',
    true,
    '200-08-09',
    1.8,
    72.3
  );

  SELECT id FROM users
  INTERSECT
  SELECT "userId" FROM orders

  --id користувачів які не робили замовлення 
  SELECT id FROM users
  EXCEPT
  SELECT "userId" FROM orders

