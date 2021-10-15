-- ajout d'une colonne address-id à la table persons
alter Table
  persons
ADD
  COLUMN address_id int unsigned;
-- ajout d'une personne avec une addresses
INSERT INTO
  persons (first_name, name, birth_date, address_id)
VALUES
  ('Paul', 'Eluard', '1935-10-05', 1);
-- liste des personnes
SELECT
  *
FROM
  persons;
-- liste des peronnes avec ville
SELECT
  persons.id,
  name,
  city
FROM
  persons,
  addresses
WHERE
  address_id = addresses.id;
SELECT
  persons.id,
  name,
  city
FROM
  persons
  JOIN addresses on address_id = addresses.id;
--même chose avec un alias sur les tables
SELECT
  p.id,
  name,
  city
from
  persons as p
  JOIN addresses as a on address_id = a.id;
-- liste des personnes dont celles qui n'ont pas d'adresse
select
  p.id,
  name,
  city
FROM
  persons as p
  left JOIN addresses as a on address_id = a.id;
-- ajout d'une colonne boss_id à la table persons
ALTER TABLE
  persons
ADD
  COLUMN boss_id int UNSIGNED;
--update pour ajouter des boss_id
UPDATE
  persons
SET
  boss_id = 2
where
  id = 1;
UPDATE
  persons
SET
  boss_id = 1
where
  id = 2;
UPDATE
  persons
SET
  boss_id = 3
where
  id = 4;
--liste des personnes avec leur boss
SELECT
  emp.id,
  emp.name,
  boss.name as boss
FROM
  persons as emp
  JOIN persons as boss ON emp.boss_id = boss.id;

