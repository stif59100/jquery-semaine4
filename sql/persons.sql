USE carnet_adresse;
DROP TABLE if exists persons;
CREATE TABLE persons(
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  first_name VARCHAR(30),
  birth_date DATE,
  PRIMARY KEY (id)
);
DROP TABLE if exists addresses;
CREATE TABLE addresses(
  id INT UNSIGNED AUTO_INCREMENT,
  street VARCHAR(30) NOT NULL,
  zip_code CHAR(5) NOT NULL,
  city VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
);
INSERT INTO
  persons (first_name, name, birth_date)
VALUES
  ('Pierre', 'de Ronsard', '1975-10-05'),
  ('Joaquim', 'du Bellay', '1995-10-05'),
  ('Rémy', 'Belleau', '1982-10-05');
INSERT INTO
  addresses (street, zip_code, city)
VALUES
  ('5 rue Orfila', '75020', 'Paris'),
  ('3 grande rue', '25440', 'Quingey');