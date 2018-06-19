DROP TABLE rentals;
DROP TABLE characteristics;
DROP TABLE customers;
DROP TABLE tanks;

CREATE TABLE tanks (
  id serial4 PRIMARY KEY,
  name varchar(255),
  country_of_origin varchar(255),
  price INT2
);

CREATE TABLE customers (
  id serial4 PRIMARY KEY,
  name varchar(255)
);

CREATE TABLE characteristics (
  id serial4 PRIMARY KEY,
  class varchar(255)
);

CREATE TABLE rentals (
  id serial4 PRIMARY KEY,
  rental_status BOOLEAN DEFAULT TRUE,
  tank_id INT4 REFERENCES tanks(id),
  customer_id INT4 REFERENCES customers(id)
);
