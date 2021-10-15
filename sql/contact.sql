-- création de la base de données
CREATE DATABASE IF NOT EXISTS carnet_adresse DEFAULT CHARACTER SET utf8;
--activation de la base de données
USE carnet_adresse;
/**************
* Création de la table contacts
***********************/
CREATE TABLE IF NOT EXISTS contacts (
  id INT UNSIGNED AUTO_INCREMENT,
  nom VARCHAR (30) NOT NULL,
  prenom VARCHAR (30),
  code_postal CHAR (5),
  ville VARCHAR (50),
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS commandes;
CREATE TABLE IF NOT EXISTS commandes (
    id INT UNSIGNED AUTO_INCREMENT,
    date_commande DATE NOT NULL,
    montant DECIMAL (5,2) NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
);

USE Carnet_adresse;
INSERT INTO contacts (nom, prenom, code_postal, ville)
     VALUES ('Vanderstocken', 'Steeve', '59100', 'Roubaix');
);


INSERT INTO contacts (nom, prenom, code_postal, ville)
     VALUES ('Vanderstocken', 'Alain', '59100', 'Roubaix'),
     ('Vanderstocken', 'Guy', '59100', 'Roubaix'),
     ('O'\'Connor', 'John', '59100', 'Roubaix'),
     ('Platon', NULL, '59100', 'Roubaix');

SELECT * FROM contacts WHERE ascii(left(nom,1))= 2;
UPDATE contacts set prenom = 'Steeve' WHERE id ="3";

USE contacts;

DELETE FROM contacts where id BETWEEN 4 and 6;

DELETE FROM contacts where pri BETWEEN 4 and 6;