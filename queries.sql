-- Requête pour afficher les noms de toutes les focaccias, triés par ordre alphabétique
/* Résultat obtenu : Américaine
--                -- Emmentalaccia
--                -- Gorgonzollaccia
--                -- Hawaïenne
--                -- Mozaccia
--                -- Paysanne
--                -- Raclaccia
--                -- Tradizione*/
SELECT nom 
FROM focaccia
ORDER BY nom;

-- Requête pour afficher le nombre total d'ingrédients disponibles dans la base de données
-- Résultat obtenu : 25
SELECT COUNT(id_ingredient) FROM ingredient;

-- Requête pour afficher le prix moyen des focaccias
-- Résultat obtenu : 10.375000
SELECT AVG(prix) FROM focaccia;

-- Requête pour afficher la liste des boissons avec leur marque, triée par nom de boisson
/* Résultat obtenu : Capri-Sun-Coca-Cola
                     Coca-Cola original-Coca-Cola
                     Coca-Cola Zéro-Coca-Cola
                     Eau de source-Cristalline
                     Fanta citron-Coca-Cola
                     Fanta orange-Coca-Cola
                     Lipton peach-Pepsico
                     Lipton zéro citron-Pepsico
                     Monster energy ultra blue-Monster
                     Monster energy ultra gold-Monster
                     Pepsi	Pepsico
                     Pepsi Max Zéro	Pepsico*/
SELECT boisson.nom, marque.nom 
FROM boisson
INNER JOIN marque ON boisson.id_marque = marque.id_marque
ORDER BY boisson.nom;

-- Requête pour afficher les noms des ingrédients utilisés dans la focaccia "Raclaccia"
SELECT ingredient.nom
FROM focaccia
INNER JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
INNER JOIN ingredient ON focaccia_ingredient.id_ingredient = ingredient.id_ingredient
WHERE focaccia.nom = 'Raclaccia';

-- Requête pour afficher le nombre d'ingrédients utilisés dans chaque focaccia
/* Résultat obtenu : Ail
                     Base tomate
                     Champignon
                     Cresson
                     Parmesan
                     Poivre
                     Raclette*/
SELECT focaccia.nom, COUNT(id_ingredient)
FROM focaccia
INNER JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
GROUP BY focaccia.nom;

-- Requête pour afficher le nom de la focaccia qui utilise le plus d'ingrédients
-- Résultat obtenu : Paysanne 12
SELECT focaccia.nom, COUNT(id_ingredient)
FROM focaccia
INNER JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
GROUP BY focaccia.nom
ORDER BY COUNT(id_ingredient) DESC
LIMIT 1;

-- Requête pour afficher les noms des focaccias qui contiennent l'ingrédient "Ail"
/* Résultat obtenu : Mozaccia
                     Gorgonzollaccia
                     Raclaccia
                     Paysanne*/
SELECT focaccia.nom
FROM focaccia
INNER JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
INNER JOIN ingredient ON focaccia_ingredient.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom = 'Ail';

-- Requête pour afficher les noms des ingrédients qui ne sont utilisés dans aucune focaccia
-- Résultat obtenu : Salami et tomate cerise
SELECT ingredient.nom
FROM ingredient
LEFT JOIN focaccia_ingredient ON ingredient.id_ingredient = focaccia_ingredient.id_ingredient
WHERE focaccia_ingredient.id_ingredient IS NULL;

-- Requête pour afficher les noms des focaccias qui ne contiennent pas l'ingrédient "Champignon"
-- Résultat obtenu : Américaine et Hawaïenne
SELECT focaccia.nom 
FROM focaccia
LEFT JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
AND focaccia_ingredient.id_ingredient = (SELECT id_ingredient FROM ingredient WHERE nom = 'Champignon')
WHERE focaccia_ingredient.id_focaccia IS NULL;