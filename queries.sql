-- Requête pour afficher les noms de toutes les focaccias, triés par ordre alphabétique
SELECT nom 
FROM focaccia
ORDER BY nom;

-- Requête pour afficher le nombre total d'ingrédients disponibles dans la base de données
SELECT COUNT(id_ingredient) FROM ingredient;

-- Requête pour afficher le prix moyen des focaccias
SELECT AVG(prix) FROM focaccia;

-- Requête pour afficher la liste des boissons avec leur marque, triée par nom de boisson
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
SELECT focaccia.nom, COUNT(id_ingredient)
FROM focaccia
INNER JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
GROUP BY focaccia.nom;

-- Requête pour afficher le nom de la focaccia qui utilise le plus d'ingrédients
SELECT focaccia.nom, COUNT(id_ingredient)
FROM focaccia
INNER JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
GROUP BY focaccia.nom
ORDER BY COUNT(id_ingredient) DESC
LIMIT 1;

-- Requête pour afficher les noms des focaccias qui contiennent l'ingrédient "Ail"
SELECT focaccia.nom
FROM focaccia
INNER JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
INNER JOIN ingredient ON focaccia_ingredient.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom = 'Ail';

-- Requête pour afficher les noms des ingrédients qui ne sont utilisés dans aucune focaccia
SELECT ingredient.nom
FROM ingredient
LEFT JOIN focaccia_ingredient ON ingredient.id_ingredient = focaccia_ingredient.id_ingredient
WHERE focaccia_ingredient.id_ingredient IS NULL;

-- Requête pour afficher les noms des focaccias qui ne contiennent pas l'ingrédient "Champignon"
SELECT focaccia.nom 
FROM focaccia
LEFT JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
AND focaccia_ingredient.id_ingredient = (SELECT id_ingredient FROM ingredient WHERE nom = 'Champignon')
WHERE focaccia_ingredient.id_focaccia IS NULL;