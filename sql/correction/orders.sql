DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders(
    id INT UNSIGNED AUTO_INCREMENT,
    amount DECIMAL(5,2) NOT NULL,
    client_id INT UNSIGNED NOT NULL,
    order_date DATE NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT order_to_client
    FOREIGN KEY (client_id)
    REFERENCES persons(id)
);

INSERT INTO orders 
(order_date, amount, client_id)
VALUES
('2021-01-10', 100, 1),
('2021-01-10', 190, 3),
('2020-01-10', 150, 2),
('2021-01-10', 170, 2);

-- Liste des commandes
SELECT o.order_date, o.amount,
c.first_name as prenom_client,
c.name as client,
a.zip_code,
a.city
FROM orders as o
JOIN persons as c 
ON o.client_id = c.id
LEFT JOIN addresses as a
ON c.address_id = a.id;


SELECT 
orders.order_date, orders.amount,
persons.first_name as prenom_client,
persons.name as client,
addresses.zip_code,
addresses.city
FROM orders
JOIN persons 
ON orders.client_id = persons.id
LEFT JOIN addresses
ON persons.address_id = addresses.id;


ALTER TABLE persons
ADD CONSTRAINT
personnes_to_adresses
FOREIGN KEY (address_id)
REFERENCES addresses(id);

INSERT INTO persons (name, address_id)
VALUES ('Coluche', 18);

DELETE FROM addresses WHERE id = 1;