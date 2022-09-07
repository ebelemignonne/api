CREATE DATABASE city_sport;

CREATE USER 'ebele'@'localhost' IDENTIFIED BY 'somepassword';

GRANT ALL PRIVILEGES ON * . * TO 'ebele'@'localhost';

FLUSH PRIVILEGES;

USE city_sport;



CREATE TABLE client (
    id_client INT AUTO_INCREMENT, 
    nom VARCHAR(100) NOT NULL, 
    prenom VARCHAR(100), 
    adresse VARCHAR(100) NOT NULL, 
    ville VARCHAR(100) NOT NULL, 
    PRIMARY KEY(id_client)
    );



CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT, 
    marque VARCHAR(100) NOT NULL, 
    logo VARCHAR(100) NOT NULL, 
    PRIMARY KEY(id_marque)
    );


CREATE TABLE chaussure (
    id_chaussure INT AUTO_INCREMENT, 
    couleure VARCHAR(100) NOT NULL, 
    marque VARCHAR(100) NOT NULL, 
    taille INT NOT NULL, 
    prix INT NOT NULL, 
    nom_chaussure VARCHAR(100) NOT NULL, 
    PRIMARY KEY(id_chaussure)
    );


CREATE TABLE commande (
    id_commande INT AUTO_INCREMENT, 
    id_client INT NOT NULL, 
    date INT NOT NULL, 
    PRIMARY KEY(id_commande)
    );

CREATE TABLE liste_de_produit (
    id_commande INT AUTO_INCREMENT, 
    id_chaussure INT NOT NULL, 
    quantite INT NOT NULL, 
    PRIMARY KEY(id_commande)
    );

/* ajout des marques dans la table marque*/

INSERT INTO `marque` (`id_marque`, `marque`, `logo`)
 VALUES(1, "addidas", "logo_marque");


INSERT INTO `marque` (`id_marque`, `marque`, `logo`) 
VALUES(2, "nike", "logo_nike");

INSERT INTO `marque` (`id_marque`, `marque`, `logo`) 
VALUES(3, "coq", "logo_coq");

/* ajout des chaussures dans la table chaussures*/

INSERT INTO `chaussure` (`id_chaussure`, `couleure`, `marque`, `taille`, `prix`, `nom_chaussure`) 
VALUES(1, "blanche", "addidas", 45, 50000, "superstar");



INSERT INTO `chaussure` (`id_chaussure`, `couleure`, `marque`, `taille`, `prix`, `nom_chaussure`) 
VALUES(2, "gris_blanc_orange", "nike", 44, 75000, "air_max_90");



INSERT INTO `chaussure` (`id_chaussure`, `couleure`, `marque`, `taille`, `prix`, `nom_chaussure`) 
VALUES(3, "blanche", "le_coq_sportif", 42, 49000, "courtset_gs");

/*afficher la liste des chaussures et marque*/
SELECT * FROM chaussure;
SELECT * FROM marque;


/*mise a jour des infos dans la table chaussure*/
UPDATE `chaussure` SET `couleure`="rouge", `marque`="coq", `taille`=40, `prix`=60000, `nom_caussure`="gs" WHERE id_chaussure = 3;


/*supprimer une chaussure dans la table chaussure*/

DELETE FROM chaussure WHERE id_chaussure = 3;




