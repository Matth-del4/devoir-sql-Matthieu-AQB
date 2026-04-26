-- Script d'insertion de données pour la base de données "tifosi"
USE tifosi;

-- Insertion de données dans les tables
INSERT INTO marque (nom) VALUES ('Coca-Cola'), ('Cristalline'), ('Monster'), ('Pepsico');
INSERT INTO ingredient (nom) VALUES ('Ail'), ('Ananas'), ('Artichaut'), ('Bacon'), ('Base tomate'), ('Base crème'), ('Champignon'), ('Chèvre'), ('Cresson'), ('Emmental'), ('Gorgonzola'), ('Jambon cuit'), ('Jambon fumé'), ('Oeuf'), ('Oignon'), ('Olive noire'), ('Olive verte'), ('Parmesan'), ('Piment'), ('Poivre'), ('Pomme de terre'), ('Raclette'), ('Salami'), ('Tomate cerise'), ('Mozarella');
INSERT INTO boisson (id_marque, nom) VALUES (1, 'Coca-Cola Zéro'), (1, 'Coca-Cola original'), (1, 'Fanta citron'), (1, 'Fanta orange'), (1, 'Capri-Sun'), (4, 'Pepsi'), (4, 'Pepsi Max Zéro'), (4, 'Lipton zéro citron'), (4, 'Lipton peach'), (3, 'Monster energy ultra gold'), (3, 'Monster energy ultra blue'), (2, 'Eau de source');
INSERT INTO focaccia (nom, prix) VALUES ('Mozaccia', 9.80), ('Gorgonzollaccia', 10.80), ('Raclaccia', 8.90), ('Emmentalaccia', 9.80), ('Tradizione', 8.90), ('Hawaïenne', 11.20), ('Américaine', 10.80), ('Paysanne', 12.80);
INSERT INTO client (nom, email, code_postal) VALUES ('Jean Dupont', 'jean.dupont@email.com', '75001'), ('Marie Martin', 'marie.martin@email.com', '69001'), ('Pierre Durand', 'pierre.durand@email.com', '75002'), ('Sophie Dubois', 'sophie.dubois@email.com', '75003'), ('Lucie Moreau', 'lucie.moreau@email.com', '75004');
INSERT INTO menu (nom, prix) VALUES ('Menu Classique', 12.90), ('Menu Gourmand', 14.90), ('Menu Végétarien', 13.90), ('Menu Enfant', 9.90);

INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite) VALUES
-- Focaccia Mozaccia
(1, 5, 200),
(1, 25, 50),
(1, 9, 20),
(1, 13, 80),
(1, 1, 2),
(1, 3, 20),
(1, 7, 40),
(1, 18,50),
(1, 20, 1),
(1, 16, 20),
-- Focaccia Gorgonzollaccia
(2, 5, 200),
(2, 11, 50),
(2, 9, 20),
(2, 1, 2),
(2, 7, 40),
(2, 18,50),
(2, 20, 1),
(2, 16, 20),
-- Focaccia Raclaccia
(3, 5, 200),
(3, 22, 50),
(3, 9, 20),
(3, 1, 2),
(3, 7, 40),
(3, 18,50),
(3, 20, 1),
-- Focaccia Emmentalaccia
(4, 6, 200),
(4,10, 50),
(4, 9, 20),
(4, 7, 40),
(4, 18,50),
(4, 20, 1),
(4, 15, 20),
-- Focaccia Tradizione
(5, 5,200),
(5, 25, 50),
(5, 9, 20),
(5, 12, 80),
(5, 7, 80),
(5, 18, 50),
(5, 20, 1),
(5, 16, 10),
(5, 17, 10),
-- Focaccia Hawaïenne
(6, 5, 200),
(6, 25, 50),
(6, 9, 20),
(6, 4, 80),
(6, 2, 40),
(6, 19, 2),
(6, 18, 50),
(6, 20, 1),
(6, 16, 20),
-- Focaccia Américaine
(7, 5, 200),
(7, 25, 50),
(7, 9, 20),
(7, 4, 80),
(7, 21, 40),
(7, 18, 50),
(7, 20, 1),
(7, 16, 20),
-- Focaccia Paysanne
(8, 6, 200),
(8, 8, 50),
(8, 9, 20),
(8, 21, 80),
(8, 13, 80),
(8, 1, 2),
(8, 3, 20),
(8, 7, 40),
(8, 18, 50),
(8, 20, 1),
(8, 16, 20),
(8, 14, 50);

INSERT INTO menu_boisson (id_menu, id_boisson) VALUES (1, 1), (1, 6), (2, 2), (2, 7), (3, 3), (3, 8), (4, 4), (4, 9);
INSERT INTO focaccia_menu (id_focaccia, id_menu) VALUES (1, 1), (2, 1), (3, 2), (4, 2), (5, 3), (6, 3), (7, 4), (8, 4);
INSERT INTO menu_client (id_client, id_menu, date_achat) VALUES (1, 1, '2024-06-01'), (2, 2, '2024-06-02'), (3, 3, '2024-06-03'), (4, 4, '2024-06-04'), (5, 1, '2024-06-05');