# Base de données Tifosi
![MySQL](https://img.shields.io/badge/MySQL-Database-blue)
![SQL](https://img.shields.io/badge/Language-SQL-orange)

**Devoir n°7** "Concevoir une base de données avec MySQL".

Projet SQL réalisé par **Cédric Kernec** | **PixSeed** dans le cadre de la formation **Développeur Web et Web Mobile** au _Centre Européen de Formation_.

---

## Structure

| Fichier | Description |
|---------|-------------|
| `create_schema.sql` | création de la base de données et des tables |
| `insert_data.sql` | insertion des données |
| `queries.sql` | requêtes SQL demandées dans le devoir |

---

## Tables

**Tables principales (sans dépendance)**
- client
- ingredient
- marque
- focaccia

**Tables dépendantes**
- menu
- boisson

**Tables de liaison**
- comprend (relation entre `ingredient` et `focaccia`)
- achete (relation entre `client` et `menu`)
- contient (relation entre `boisson` et `menu`)

---

## Données insérées

4 fichiers ont été transmis par le Centre Européen de Formation :
| Fichier source | Données utilisées |
|----------------|-------------------|
| `focaccia.xlsx` | id_boisson + nom_boisson |
| `ingredient.xlsx` | id_ingredient + nom_ingredient |
| `boisson.xlsx` | id_boisson + nom_boisson + marque |
| `marque.xlsx` | id_marque + nom_marque |

Les données des tables `client` et `menu` ont été ajoutées manuellement afin
de faciliter la création des tables de liaison `contient` et `achete`
et de permettre le fonctionnement de celles-ci.

---

## Requêtes SQL

Les reqûetes de vérification sont regroupées dans le fichier :
```
queries.sql
```

**La liste des reqûetes existantes est la suivante :**
1. Afficher la liste des noms des focaccias par ordre alphabétique croissant,
2. Afficher le nombre total d'ingrédients,
3. Afficher le prix moyen des focaccias,
4. Afficher la liste des boissons avec leur marque, triée par nom de boisson,
5. Afficher la liste des ingrédients pour une Raclaccia,
6. Afficher le nom et le nombre d'ingrédients pour chaque foccacia,
7. Afficher le nom de la focaccia qui a le plus d'ingrédients,
8. Afficher la liste des focaccia qui contiennent de l'ail,
9. Afficher la liste des ingrédients inutilisés,
10. Afficher la liste des focaccia qui n'ont pas de champignons.

**Les requêtes ont été testées/vérifiées. Chaque requête contient :**
- Le numéro de requête
- La description (le titre) de la requête
- le code SQL
- le résultat attendu
- le résultat obtenu
- un commentaire d'analyse

---

## Installation

1. Cloner le dépôt :
   
```
git clone https://github.com/pixseed/devoir-7-tifosi.git
```
3. Ouvrir MySQL Workbench.
4. Exécuter le script de création de la base :
   
```
create_schema.sql
```
5. Insérer les données :
   
```
insert_data.sql
```
