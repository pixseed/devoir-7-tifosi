-- =========================================================
-- Requête SQL
-- =========================================================

-- =======================================================================================

-- 1. Afficher la liste des noms des focaccias par ordre alphabétique croissant
SELECT nom_focaccia
FROM focaccia
ORDER BY nom_focaccia;

-- Résultat attendu :
-- Américaine
-- Emmentalaccia
-- Gorgonzollaccia
-- Hawaienne
-- Mozaccia
-- Paysanne
-- Raclaccia
-- Tradizione

-- Résultat obtenu :
-- Américaine
-- Emmentalaccia
-- Gorgonzollaccia
-- Hawaienne
-- Mozaccia
-- Paysanne
-- Raclaccia
-- Tradizione

-- Commentaire :
-- Aucun écart entre le résultat attendu et le résultat obtenu

-- =======================================================================================

-- 2. Afficher le nombre total d'ingrédients
SELECT COUNT(*)
AS total_ingredients
FROM ingredient;

-- Résultat attendu :
-- 25

-- Résultat obtenu :
-- 25

-- Commentaire :
-- Aucun écart entre le résultat attendu et le résultat obtenu

-- =======================================================================================

-- 3. Afficher le prix moyen des focaccias
SELECT AVG(prix)
AS prix_moyen_focaccia
FROM focaccia;

-- Résultat attendu :
-- 10.375

-- Résultat obtenu :
-- 10.375

-- Commentaire :
-- Aucun écart entre le résultat attendu et le résultat obtenu

-- =======================================================================================

-- 4. Afficher la liste des boissons avec leur marque, triée par nom de boisson
SELECT nom_boisson, nom_marque
FROM boisson
INNER JOIN marque ON boisson.id_marque = marque.id_marque
ORDER BY nom_boisson;

-- Résultat attendu :
-- Capri-sun					| Coca-cola
-- Coca-cola original			| Coca-cola
-- Coca-cola zéro				| Coca-cola
-- Eau de source 				| Cristalline
-- Fanta citron					| Coca-cola
-- Fanta orange					| Coca-cola
-- Lipton Peach					| Pepsico
-- Lipton zéro citron			| Pepsico
-- Monster energy ultra blue 	| Monster
-- Monster energy ultra gold	| Monster
-- Pepsi						| Pepsico
-- Pepsi Max Zéro				| Pepsico

-- Résultat obtenu :
-- Capri-sun					| Coca-cola
-- Coca-cola original			| Coca-cola
-- Coca-cola zéro				| Coca-cola
-- Eau de source 				| Cristalline
-- Fanta citron					| Coca-cola
-- Fanta orange					| Coca-cola
-- Lipton Peach					| Pepsico
-- Lipton zéro citron			| Pepsico
-- Monster energy ultra blue 	| Monster
-- Monster energy ultra gold	| Monster
-- Pepsi						| Pepsico
-- Pepsi Max Zéro				| Pepsico

-- Commentaire :
-- Aucun écart entre le résultat attendu et le résultat obtenu

-- =======================================================================================

-- 5. Afficher la liste des ingrédients pour une Raclaccia
SELECT nom_ingredient
FROM focaccia
INNER JOIN comprend ON focaccia.id_focaccia = comprend.id_focaccia
INNER JOIN ingredient ON comprend.id_ingredient = ingredient.id_ingredient
WHERE focaccia.nom_focaccia = 'Raclaccia';

-- Résultat attendu :
-- Ail
-- Base Tomate
-- Champignon
-- Cresson
-- Parmesan
-- Poivre
-- Raclette

-- Résultat obtenu :
-- Ail
-- Base Tomate
-- Champignon
-- Cresson
-- Parmesan
-- Poivre
-- Raclette

-- Commentaire :
-- Aucun écart entre le résultat attendu et le résultat obtenu

-- =======================================================================================

-- 6. Afficher le nom et le nombre d'ingrédients pour chaque foccacia
SELECT nom_focaccia, COUNT(*) AS total_ingredients
FROM focaccia
INNER JOIN comprend ON focaccia.id_focaccia = comprend.id_focaccia
GROUP BY focaccia.id_focaccia;

-- Résultat attendu :
-- Mozaccia			| 10
-- Gorgonzollaccia	| 8
-- Raclaccia		| 7
-- Emmentalaccia	| 6
-- Tradizione		| 9
-- Hawaienne		| 9
-- Américaine		| 8
-- Paysanne			| 12

-- Résultat obtenu :
-- Mozaccia			| 10
-- Gorgonzollaccia	| 8
-- Raclaccia		| 7
-- Emmentalaccia	| 6
-- Tradizione		| 9
-- Hawaienne		| 9
-- Américaine		| 8
-- Paysanne			| 12

-- Commentaire :
-- Aucun écart entre le résultat attendu et le résultat obtenu

-- =======================================================================================

-- 7. Afficher le nom de la focaccia qui a le plus d'ingrédients
SELECT nom_focaccia, COUNT(*) AS total_ingredients
FROM focaccia
INNER JOIN comprend ON focaccia.id_focaccia = comprend.id_focaccia
GROUP BY focaccia.id_focaccia
HAVING COUNT(*) = (
	SELECT MAX(total)
    FROM (
		SELECT COUNT(*) AS total
        FROM comprend
        GROUP BY id_focaccia
	) AS stats
);

-- Résultat attendu :
-- Paysanne | 12

-- Résultat obtenu :
-- Paysanne | 12

-- Commentaire :
-- Aucun écart entre le résultat attendu et le résultat obtenu

-- =======================================================================================

-- 8. Afficher la liste des focaccia qui contiennent de l'ail
SELECT nom_focaccia
AS focaccia_avec_ail
FROM focaccia
INNER JOIN comprend ON focaccia.id_focaccia = comprend.id_focaccia
INNER JOIN ingredient ON comprend.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom_ingredient = 'Ail';

-- Résultat attendu :
-- Mozaccia
-- Gorgonzollaccia
-- Raclaccia
-- Paysanne

-- Résultat obtenu :
-- Mozaccia
-- Gorgonzollaccia
-- Raclaccia
-- Paysanne

-- Commentaire :
-- Aucun écart entre le résultat attendu et le résultat obtenu

-- =======================================================================================

-- 9. Afficher la liste des ingrédients inutilisés
SELECT nom_ingredient
AS ingredients_inutilisés
FROM ingredient
LEFT JOIN comprend ON ingredient.id_ingredient = comprend.id_ingredient
WHERE comprend.id_focaccia IS NULL;

-- Résultat attendu :
-- Salami
-- Tomate cerise

-- Résultat obtenu :
-- Salami
-- Tomate cerise

-- Commentaire :
-- Aucun écart entre le résultat attendu et le résultat obtenu

-- =======================================================================================

-- 10. Afficher la liste des focaccia qui n'ont pas de champignons.
SELECT nom_focaccia
AS focaccia_sans_champignons
FROM focaccia
WHERE NOT EXISTS (
	SELECT *
	FROM comprend
    INNER JOIN ingredient ON comprend.id_ingredient = ingredient.id_ingredient
    WHERE comprend.id_focaccia = focaccia.id_focaccia
    AND ingredient.nom_ingredient = 'Champignon'
);

-- Résultat attendu :
-- Hawaienne
-- Américaine

-- Résultat obtenu :
-- Hawaienne
-- Américaine

-- Commentaire :
-- Aucun écart entre le résultat attendu et le résultat obtenu

-- =======================================================================================