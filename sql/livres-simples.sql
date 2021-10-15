SELECT * FROM livres_simples;

--les livres d'informatique
SELECT * FROM livres_simples WHERE genre='informatique';

-- les livres dont le prix est inférieur à 10euro
SELECT * FROM livres_simples where prix <10;

SELECT * FROM livres_simples where prix BETWEEN 15 and 25;

-- les livres publiés le 9/3/1995 et 7/7/1993

SELECT * FROM livres_simples where date_publication in ('1995-03-09','1993-07-07');

SELECT * FROM livres_simples  
WHERE  
langue = 'anglais'  
OR  
editeur = 'Morgan Kauffmann';

--Rechercher les livres d'informatique écrits en français
SELECT * FROM livres_simples  
WHERE  
langue = 'français' and genre='informatique';

--Rechercher les livres écrits en italien ou en castillan 
SELECT * FROM livres_simples  
WHERE  
langue ='italien' or langue='castillan';

SELECT * FROM livres_simples WHERE langue IN ( 'italien','castillan');

--Rechercher tous les livres qui ne sont pas en anglais  

SELECT * FROM livres_simples WHERE langue <>'anglais' and prix < '12';

--Rechercher tous les livres qui ne sont pas en anglais  ni en francais et dont le prix est inférieur à 12

SELECT * FROM livres_simples WHERE prix < 12 and (langue !='anglais' and langue !='français');

SELECT * FROM livres_simples WHERE prix < 12 and langue NOT IN ('anglais','français');

--tous les livres des auteurs qui n'ont pas de prénom ou qui ont publié chez puf

SELECT * FROM livres_simples WHERE
auteur_prenom is null or editeur='GRASSET'; 

-- tri par prix
SELECT id,prix,editeur FROM livres_simples  
ORDER BY  editeur, prix desc;

-- limitation des résultats
SELECT * FROM livres_simples  
WHERE editeur = 'Hachette' 
ORDER BY prix DESC 
LIMIT 5;

--pagination
-- limit nbParPage offset (nbParPage - 1) x nbParPpage
-- page 1 : LIMIT 5 OFFSET 0
-- page 2 : LIMIT 5 OFFSET 5
-- page 10 : LIMITE 5 OFFSET 45
SELECT * FROM livres_simples  
ORDER BY id 
LIMIT 5 OFFSET 5;

-- Agregation des résultats

SELECT COUNT(*) as nb FROM livres_simples WHERE editeur = 'puf';

SELECT AVG(prix) as total  
FROM livres_simples where genre='informatique';


-- La date de publication du dernier livre publié par grasset

SELECT MAX(date_publication) from livres_simples where editeur='PUF';

-- le nombre de livre par genre

SELECT genre, count(*) as nb  
FROM livres_simples  
GROUP BY genre ORDER BY nb DESC;

-- somme prix des livres par auteur

SELECT auteur, SUM(prix), count(*) 
FROM livres_simples GROUP BY auteur;

-- Dans combien de langues différentes sont écrits les livres
SELECT langue from livres_simples GROUP BY langue;

SELECT DISTINCT langue FROM livres_simples;

-- Nombre de genre par éditeur
SELECT 
editeur,
count(DISTINCT genre) as nb_genres,
count(*) as nb_livres
FROM livres_simples 
GROUP BY editeur;

-- nombre d'éditeur par auteur
SELECT 
auteur,
count(DISTINCT editeur) as nb_editeurs
FROM livres_simples 
GROUP BY auteur;


-- nombre d'éditeur par auteur pour les auteurs qui ont plus d'un éditeur

SELECT  
auteur,  
count(DISTINCT editeur) as nb_editeurs  
FROM livres_simples 
GROUP BY auteur 
HAVING nb_editeurs > 1;

--Les auteurs qui ont écrit dans plus de deux genres

SELECT  
auteur,  
count(DISTINCT genre) as nb_genres  
FROM livres_simples 
GROUP BY auteur 
HAVING nb_genres > 1;

--Les éditeurs qui ont publié des livres dans plus d'une langue

SELECT  
editeur,  
count(DISTINCT langue) as nb_langues,
GROUP_CONCAT(DISTINCT langue ORDER BY langue SEPARATOR ' : ') as liste_langues
FROM livres_simples 
GROUP BY editeur 
HAVING nb_langues > 1;