-- Création de la base de données
CREATE DATABASE IF NOT EXISTS carnet_adresse
DEFAULT CHARACTER SET utf8;
# Activation de la base de données
USE carnet_adresse;

/**************************
* Création de la table contacts
***************************/
CREATE TABLE IF NOT EXISTS contacts(
    id INT UNSIGNED AUTO_INCREMENT,
    nom VARCHAR(30) NOT NULL,
    prenom VARCHAR(30),
    code_postal CHAR(5),
    ville VARCHAR(50),
    PRIMARY KEY (id)
);

-- Suppression de la table si elle existe
DROP TABLE IF EXISTS commandes;
-- Création de la table commandes
CREATE TABLE commandes( 
    id INT UNSIGNED AUTO_INCREMENT,
    date_commande DATE NOT NULL,
    montant DECIMAL(5,2) NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
);

USE carnet_adresse;
-- Insertion de contacts
INSERT INTO contacts 
(nom, prenom, code_postal, ville)
VALUES
('Humbert', 'Sophie', '25000', 'Besançon');

INSERT INTO contacts 
(nom, prenom, code_postal, ville)
VALUES
('Humbert', 'Valentin', '75020', 'Paris'),
('Hugo', 'Victor', '75008', 'Paris'),
('Pasteur', 'Louis', '25000', 'Besançon'),
('O''Connor', 'Sinead', '75020', 'Paris'),
('Platon', NULL, '25000', 'Besançon')
;

SELECT * from contacts WHERE ascii(left(nom, 1))= 72;

UPDATE contacts SET nom = 'hugo' WHERE id = 3;

UPDATE contacts SET prenom = NULL;

