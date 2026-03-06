-- =======================================================================================
-- Base de donnée Tifosi
-- =======================================================================================

DROP DATABASE IF EXISTS tifosi;
CREATE DATABASE tifosi;
USE tifosi;

-- =======================================================================================
-- Création des tables
-- =======================================================================================

-- Tables principales
CREATE TABLE ingredient (
	id_ingredient INT PRIMARY KEY AUTO_INCREMENT,
    nom_ingredient VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE client (
	id_client INT PRIMARY KEY AUTO_INCREMENT,
    nom_client VARCHAR(50) NOT NULL,
    email VARCHAR(150) UNIQUE,
    code_postal INT
);

CREATE TABLE marque (
	id_marque INT PRIMARY KEY AUTO_INCREMENT,
    nom_marque VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE focaccia (
	id_focaccia INT PRIMARY KEY AUTO_INCREMENT,
    nom_focaccia VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL
);

-- Tables dépendantes 
CREATE TABLE menu (
	id_menu INT PRIMARY KEY AUTO_INCREMENT,
    nom_menu VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL,
    id_focaccia INT NOT NULL,
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);

CREATE TABLE boisson (
	id_boisson INT PRIMARY KEY AUTO_INCREMENT,
    nom_boisson VARCHAR(50) NOT NULL,
    id_marque INT NOT NULL,
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);

-- Tables de liaison
CREATE TABLE comprend (
	id_focaccia INT NOT NULL,
	id_ingredient INT NOT NULL,
	quantite INT,
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);

CREATE TABLE achete (
	id_client INT NOT NULL,
	id_menu INT NOT NULL,
	date_achat DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_client, id_menu, date_achat),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);

CREATE TABLE contient (
	id_menu INT NOT NULL,
	id_boisson INT NOT NULL,
    PRIMARY KEY (id_menu, id_boisson),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);