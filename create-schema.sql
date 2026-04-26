-- Création de la base de données et de l'utilisateur
CREATE DATABASE tifosi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Création de l'utilsateur avec un mot de passe sécurisé
CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'admin123';

-- Attribution des privilèges à l'utilisateur sur la base de données
GRANT ALL PRIVILEGES
ON tifosi.*
TO 'tifosi'@'localhost';

-- Appliquer les changements de privilèges immédiatement
FLUSH PRIVILEGES;

-- Sélection de la base de données pour les opérations futures
use tifosi;

-- Création des tables
CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    id_marque INT NOT NULL,
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);
CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL
);
CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    code_postal VARCHAR(5) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE menu (
    id_menu INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL
);

-- Création des tables de liaison
CREATE TABLE focaccia_ingredient (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);
CREATE TABLE focaccia_menu (
    id_focaccia INT NOT NULL,
    id_menu INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_menu),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);
CREATE TABLE menu_client (
    id_menu INT NOT NULL,
    id_client INT NOT NULL,
    date_achat DATE NOT NULL,
    PRIMARY KEY (id_menu, id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_client) REFERENCES client(id_client)
);
CREATE TABLE menu_boisson (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    PRIMARY KEY (id_menu, id_boisson),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);