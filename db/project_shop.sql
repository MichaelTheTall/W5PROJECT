DROP TABLE items;
DROP TABLE manufacturers;

CREATE TABLE manufacturers
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  info TEXT
);

CREATE TABLE items
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  man_id INT8 REFERENCES manufacturers(id),
  info TEXT,
  stock INT8,
  cost INT8,
  sale INT8
);
