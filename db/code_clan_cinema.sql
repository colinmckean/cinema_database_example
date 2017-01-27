DROP TABLE customers CASCADE;
DROP TABLE films CASCADE;
DROP TABLE tickets CASCADE;

CREATE TABLE customers(
  id SERIAL4 primary key,
  customer_name VARCHAR(255),
  funds MONEY
  );

CREATE TABLE films(
  id SERIAL4 primary key,
  title VARCHAR(255),
  price MONEY
  );

CREATE TABLE tickets(
  id SERIAL4 primary key,
  customer_id INT4 references customers(id),
  film_id INT4 references films(id)
  );
