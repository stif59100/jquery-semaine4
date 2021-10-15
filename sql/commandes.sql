-- Créer une table order :
-- id-order_date- amount- client_id
-- orders: ajouter une personne en tant que client d'une commande
-- requête : date commande, montant nom client, code postal, ville
DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders(
  id INT UNSIGNED AUTO_INCREMENT,
  amount DECIMAL(5, 2) NOT NULL,
  client_id INT UNSIGNED NOT NULL,
  order_date DATE NOT NULL,
  PRIMARY KEY (id)
  CONSTRAINT order_to_client
  FOREIGN KEY(client_id)
  REFERENCES persons(id)
);
INSERT INTO
  orders (order_date, amount, client_id)
VALUES('2021-01-10', 100, 1),('2021-01-10', 190, 3),('2020-01-10', 150, 2),('2021-01-10', 170, 2);
-- liste des commandes
select
  orders.order_date,
  orders.amount,
  persons.first_name as prenom_client,
  addresses.zip_code,
  addresses.city
from
  orders as orders
  JOIN persons
  ON orders.client_id = persons.id
  LEFT JOIN addresses 
  ON persons.address_id = addresses.id;

ALTER TABLE persons  
ADD CONSTRAINT 
personnes_to_adresses 
FOREIGN KEY (address_id) 
REFERENCES addresses(id);

INSERT INTO  persons ( name, address_id ) VALUES('Coluche', 18);

DELETE FROM addresses WHEREid=1;