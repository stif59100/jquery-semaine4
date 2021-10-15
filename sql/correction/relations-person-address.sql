-- ajout d'une colonne address_id 
-- à la table persons
ALTER TABLE persons ADD COLUMN address_id INT UNSIGNED;

-- Ajout d'une personne avec adresse
INSERT INTO persons 
(first_name, name, birth_date, address_id)
VALUES
('Paul', 'Eluard', '1935-10-05', 1);

-- liste des personnes
SELECT * FROM persons;

-- liste des personnes avec la ville
SELECT persons.id, name, city
FROM persons, addresses
WHERE address_id = addresses.id;

-- même chose avec une autre syntaxe
SELECT persons.id, name, city
FROM 
persons 
JOIN addresses
ON address_id = addresses.id;

-- même chose avec un alias sur les tables
SELECT p.id, name, city
FROM 
persons as p 
JOIN addresses as a
ON address_id = a.id;

-- Liste des personnes dont celles qui n'ont pas d'adresse
SELECT p.id, name, city, address_id
FROM 
persons as p LEFT JOIN addresses as a
ON address_id = a.id;

SELECT p.id, name, city, address_id
FROM 
addresses as a RIGHT JOIN persons as p 
ON address_id = a.id;

-- ajout d'un colonne boss_id INT UNSIGNED
ALTER TABLE persons ADD COLUMN boss_id INT UNSIGNED;

-- update pour ajouter des boss_id
UPDATE persons SET boss_id=2 WHERE id=1;
UPDATE persons SET boss_id=1 WHERE id=2;
UPDATE persons SET boss_id=3 WHERE id=4;

-- liste simple des personnes
SELECT id, name, boss_id FROM persons;

-- Liste des personnes et de leur boss
SELECT emp.id, emp.name, boss.name as boss
FROM persons as emp
JOIN persons as boss
ON emp.boss_id = boss.id;

-- Créer une table orders :
-- id - order_date - amount - client_id
-- Orders : ajouter une personne en tant que client d'une commande
-- Requête : date commande, montant, nom client, code_postal, ville