SELECT * FROM livres_simples;

-- Les livres d'informatique
SELECT * FROM livres_simples 
WHERE genre = 'informatique';

-- Les livres dont le prix est inférieur à 10 euros
SELECT * FROM livres_simples WHERE prix <= 10;

-- Les livres dont le prix est compris entre 15 et 25 euros
SELECT * FROM livres_simples WHERE prix BETWEEN 15 and 25;

-- Les livres publiés le 09/03/1995 et les 07/07/1993
SELECT * FROM livres_simples WHERE date_publication IN ('1995-03-09', '1993-07-07');

-- Les livres édités par Morgan Kauffmann en langue anglaise
SELECT * FROM livres_simples WHERE langue = 'anglais' AND editeur LIKE '% Kauffmann';

 
--  Rechercher les livres d'informatique écrits en français 
SELECT * FROM livres_simples WHERE langue = 'français' and genre = 'informatique';

-- Rechercher les livres écrits en italien ou en castillan
SELECT * FROM livres_simples WHERE langue = 'italien' OR langue = 'castillan';

SELECT * FROM livres_simples WHERE langue 
IN( 'italien','castillan');

-- Rechercher tous les livres qui ne sont pas en anglais et dont le prix est inférieur à 12
SELECT * FROM livres_simples WHERE prix < 12 AND
langue != 'anglais'; 

SELECT * FROM livres_simples WHERE prix < 12 AND NOT
langue = 'anglais';

-- Rechercher tous les livres qui ne sont pas en anglais ni en français et dont le prix est inférieur à 12

SELECT * FROM livres_simples WHERE 
prix < 12 AND
(langue != 'anglais' AND langue != 'français');

SELECT * FROM livres_simples WHERE prix < 12 AND
langue NOT IN ('anglais', 'français');

-- Tous les livres des auteurs qui n'ont pas de prénom ou qui ont publié chez Grasset
SELECT * FROM livres_simples WHERE 
auteur_prenom IS NULL OR editeur= 'Grasset';

-- tri par editeur et prix
SELECT id, prix, editeur FROM livres_simples ORDER BY editeur, prix DESC;

-- limitation des résultats
SELECT id, prix, editeur FROM livres_simples ORDER BY editeur, prix DESC
LIMIT 5;

-- pagination
-- LIMIT nbParPage OFFSET (page - 1) x nbParPage
-- page 1 : LIMIT 5 OFFSET 0
-- page 2 : LIMIT 5 OFFSET 5
-- page 10 : LIMIT 5 OFFSET 45
SELECT id, prix, editeur FROM livres_simples ORDER BY id
LIMIT 5 OFFSET 6;

-- exemple d'agrégation
SELECT COUNT(*) as nb FROM livres_simples;

-- exemple d'agrégation
SELECT COUNT(*) as nb FROM livres_simples
WHERE editeur = 'PUF';

-- La somme des prix
SELECT SUM(prix) as total FROM livres_simples;

-- la moyenne des prix des livres d'informatique
SELECT AVG(prix) as prix_moyen 
FROM livres_simples 
WHERE genre = 'Informatique';

-- la date de publication du dernier livre publié par Grasset
SELECT MAX(date_publication) FROM livres_simples
WHERE editeur = 'Grasset';

-- Le nombre de livres par genre
SELECT genre, count(*) as nb 
FROM livres_simples
GROUP BY genre
ORDER BY nb;

-- La somme du prix des livres par auteur
SELECT auteur, SUM(prix), count(*) as nb 
FROM livres_simples
GROUP BY auteur;

-- liste des langues distinctes
SELECT langue FROM livres_simples GROUP BY langue;

SELECT DISTINCT langue FROM livres_simples;

-- le nombre de genres par éditeur
SELECT 
editeur, 
COUNT(DISTINCT genre) as nb_genres, 
COUNT(*) as nb_livres
FROM livres_simples
GROUP BY editeur;

-- le nombre d'éditeur par auteur
SELECT 
auteur, 
COUNT(DISTINCT editeur) as nb_editeurs
FROM livres_simples
GROUP BY auteur;

-- le nombre d'éditeur par auteur pour les auteurs qui ont plus d'un éditeur
SELECT 
auteur, 
COUNT(DISTINCT editeur) as nb_editeurs
FROM livres_simples
GROUP BY auteur
HAVING nb_editeurs > 1;

-- Les auteurs qui ont plus d'un genres
SELECT auteur,
COUNT(DISTINCT genre) as nb_genre
FROM livres_simples
GROUP BY auteur
HAVING nb_genre >= 2;

-- les éditeurs avec plus d'une langue
SELECT editeur,
COUNT(DISTINCT langue) as nb_langue,
GROUP_CONCAT(DISTINCT langue 
    ORDER BY langue desc
    SEPARATOR ', '
) as liste_langues
FROM livres_simples
GROUP BY editeur
HAVING nb_langue >= 2;