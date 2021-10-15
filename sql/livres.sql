DROP TABLE IF EXISTS `livres_simples`; 
CREATE TABLE `livres_simples` ( 
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT, 
  `titre` varchar(80) NOT NULL, 
  `prix` decimal(5,2) NOT NULL, 
  `auteur` varchar(50) NOT NULL, 
  `editeur` varchar(50) NOT NULL, 
  `genre` varchar(50) NOT NULL, 
  `date_publication` date DEFAULT NULL, 
  `nationalite_auteur` varchar(50) DEFAULT NULL, 
  `langue` varchar(50) DEFAULT NULL, 
  `auteur_prenom` varchar(50) DEFAULT NULL, 
  `auteur_nom` varchar(50) DEFAULT NULL, 
  PRIMARY KEY (`id`) 
); 

INSERT INTO `livres_simples` VALUES ('1', 'Le guide du routard intergallactique', '13.00', 'Douglas Adams', 'Grasset', 'Science fiction', '2000-02-08', 'anglais', 'français', 
'Douglas', 'Adams'), ('2', 'Dune', '18.00', 'Frank Herbert', 'Hachette', 'Science fiction', '1995-03-09', 'américan', 'français', 'Frank', 'Herbert'), ('3', 'La nausée', '12.50', 
'J.P. Sartre', 'PUF', 'Essai', '1988-12-11', 'français', 'français', 'J.P.', 'Sartre'), ('4', 'Désir et servitude', '9.00', 'F. Lordon', 'PUF', 'Essai', '2002-06-26', 'français', 
'français', 'F.', 'Lordon'), ('5', 'Elévation', '11.00', 'David Brin', 'Grasset', 'Science fiction', '1998-12-17', 'américain', 'français', 'David', 'Brin'), ('6', 'Critique de la 
raison pure', '12.00', 'Emmanuel Kant', 'PUF', 'Philosophie', '2000-09-04', 'français', 'français', 'Emmanuel', 'Kant'), ('7', 'Propos sur le bonheur', '9.00', ' Alain', 'PUF', 
'Philosophie', '1989-11-09', 'français', 'français', null, 'Alain'), ('8', 'Fondation', '14.00', 'Isaac Asimov', 'Robert Laffont', 'Science fiction', '1990-07-26', 'américain', 
'français', 'Isaac', 'Asimov'), ('9', 'En terre étrangère', '10.00', 'Robert Heinlein', 'Robert Laffont', 'Science fiction', '1996-08-01', 'américain', 'français', 'Robert', 
'Heinlein'), ('10', 'La République', '8.00', ' Platon', 'PUF', 'Philosophie', '1994-07-30', 'grecque', 'français', null, 'Platon'), ('11', 'Pensées', '11.00', 'Blaise Pascal', 
'Hachette', 'Philosophie', '1996-06-16', 'français', 'français', 'Blaise', 'Pascal'), ('12', 'Discours de la méthode', '9.00', 'Blaise Pascal', 'Hachette', 'Philosophie', 
'2011-11-25', 'français', 'français', 'Blaise', 'Pascal'), ('13', 'Coder proprement', '18.00', 'Robert Martin', 'Dunod', 'Informatique', '1993-07-07', 'américain', 'français', 
'Robert', 'Martin'), ('14', 'SQL Avancé', '45.00', 'Joe Celko', 'Dunod', 'Informatique', '2005-02-28', 'américain', 'français', 'Joe', 'Celko'), ('15', 'Programmer avec MySQL', 
'35.00', 'Christian Soutou', 'Eyrolles', 'Informatique', '1998-08-20', 'français', 'français', 'Christian', 'Soutou'), ('16', 'Crimes presque parfaits', '28.00', 'Patricia Highsmith', 
'Hachette', 'Roman policier', '1991-01-08', 'américain', 'français', 'Patricia', 'Highsmith'), ('17', 'Carol', '22.00', 'Patricia Highsmith', 'Hachette', 'Roman policier', 
'2002-07-04', 'américain', 'français', 'Patricia', 'Highsmith'), ('18', 'Des chats et des hommes', '22.00', 'Patricia Highsmith', 'Hachette', 'Roman policier', '1992-11-03', 
'américain', 'français', 'Patricia', 'Highsmith'), ('19', 'Sur les pas de Ripley', '22.00', 'Patricia Highsmith', 'Hachette', 'Roman policier', '2000-01-02', 'américain', 'français', 
'Patricia', 'Highsmith'), ('20', 'L\'inconnu du Nord Express', '22.00', 'Patricia Highsmith', 'Hachette', 'Roman policier', '2004-11-04', 'américain', 'français', 'Patricia', 
'Highsmith'), ('21', 'Ripley et les ombres', '22.00', 'Patricia Highsmith', 'Hachette', 'Roman policier', '2007-07-26', 'américain', 'français', 'Patricia', 'Highsmith'), ('26', 
'D\'un retournement l\'autre', '9.00', 'F. Lordon', 'La Fabrique', 'Théâtre', '2006-08-24', 'français', 'français', 'F.', 'Lordon'), ('27', 'Imperium', '15.00', 'F. Lordon', 'La 
Fabrique', 'Essai', '1993-11-19', 'français', 'français', 'F.', 'Lordon'), ('28', 'Et la vertu sauvera le monde', '6.00', 'F. Lordon', 'La Fabrique', 'Essai', '1992-10-16', 
'français', 'français', 'F.', 'Lordon'), ('29', 'Economistes à gages', '7.50', 'F. Lordon', 'La Fabrique', 'Essai', '1995-08-23', 'français', 'français', 'F.', 'Lordon'), ('30', 'SQL 
for smarties', '55.86', 'Joe Celko', 'Morgan Kauffmann', 'Informatique', '2013-03-01', 'américain', 'anglais', 'Joe', 'Celko'), ('31', 'Data and Databases : Concepts in Practice', 
'67.47', 'Joe Celko', 'Morgan Kauffmann', 'Informatique', '2002-04-15', 'américain', 'anglais', 'Joe', 'Celko'), ('32', 'Thinking in Sets : Auxiliary, Temporal, and Virtual Tables in 
SQL', '28.43', 'Joe Celko', 'Morgan Kauffmann', 'Informatique', '2015-04-02', 'américain', 'anglais', 'Joe', 'Celko'), ('33', 'SQL Antipatterns', '33.44', 'Bill Karwin', 'O\'Reilly', 
'Informatique', '1992-10-12', 'américain', 'anglais', 'Bill', 'Karwin'), ('34', 'The pragmatic programmer : Form journeyman to master', '33.85', 'Andrew Hunt', 'Addison Wesley', 
'Informatique', '1991-06-15', 'américain', 'anglais', 'Andrew', 'Hunt'), ('35', 'Sei personaggi in cerca d\'autore', '12.00', 'Luigi Pirandello', 'Grasset', 'Théâtre', '1921-06-09', 
'italien', 'italien', 'Luigi', 'Pirandello'), ('36', 'La nuova colonia', '9.00', 'Luigi Pirandello', 'Grasset', 'Théâtre', '1926-03-24', 'italien', 'italien', 'Luigi', 'Pirandello'), 
('37', 'Il nome della rosa', '10.00', 'Umberto Ecco', 'Hachette', 'Roman historique', '1980-11-12', 'italien', 'italien', 'Umberto', 'Ecco'), ('38', 'Clean code', '24.00', 'Robert 
Martin', 'Dunod', 'Informatique', '1989-11-04', 'Américain', 'anglais', 'Robert', 'Martin'), ('39', 'De bellum gallicum', '8.00', 'Julius Caesar', 'Hachette', 'Essai', '1990-06-12', 
'romain', 'latin', 'Julius', 'Caesar'), ('40', 'El Ingenioso Hidalgo Don Quijote de la Mancha', '8.00', 'Miguel de Cervantes', 'Hachette', 'Roman', '1970-10-16', 'espagnol', 
'castillan', 'Miguel', 'de Cervantes'), ('41', 'Los versos del capitán', '6.00', 'Pablo Neruda', 'Grasset', 'Poésie', '1984-11-25', 'chilien', 'castillan', 'Pablo', 'Neruda'), ('42', 
'Elogio de la sombra', '8.00', 'Jorge luis Borges', 'Grasset', 'Essai', '1978-02-05', 'argentin', 'castillan', 'Jorge Luis', 'Borges'), ('43', 'Pride and prejudice', '9.00', 'Jane 
Austen', 'Hachette', 'Roman', '1982-08-14', 'anglais', 'anglais', 'Jane', 'Austen');

