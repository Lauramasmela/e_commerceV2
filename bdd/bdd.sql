SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `tailles`;
CREATE TABLE tailles
(
    `id_taille` SMALLINT AUTO_INCREMENT PRIMARY KEY,
    `taille`    VARCHAR(40) NOT NULL,
    `statut_taille`  TINYINT(1)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `tailles`(`id_taille`, `taille`, `statut_taille`)
VALUES ('1', 'S', '1'),
       ('2', 'M', '1'),
       ('3', 'L', '1'),
       ('4', '34', '1'),
       ('5', '35', '1'),
       ('6', '36', '1'),
       ('7', '37', '1'),
       ('8', '38', '1'),
       ('9', '39', '1'),
       ('10', '40', '1'),
       ('11', '41', '1'),
       ('12', '42', '1'),
       ('13', '43', '1'),
       ('14', '44', '1'),
       ('15', '45', '1'),
       ('16', '46', '1');





DROP TABLE IF EXISTS `couleurs`;
CREATE TABLE couleurs
(
    `id_couleur`  SMALLINT AUTO_INCREMENT PRIMARY KEY,
    `codeHexa`    VARCHAR(40) NOT NULL,
    `nom_couleur` VARCHAR(40) NOT NULL,
    `statut_couleur`  TINYINT(1)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `couleurs`(`id_couleur`, `codeHexa`, `nom_couleur`, `statut_couleur`)
VALUES ('1', '#FFFFFF', 'blanc', '1'),
       ('2', '#000000', 'noir', '1'),
       ('3', '#ff0000', 'rouge', '1'),
       ('4', '#A6A4A4', 'gris', '1'),
       ('5', '#0205BF', 'bleu', '1'),
       ('6', '#7034FA', 'mauve', '1'),
       ('7', '#bf5600', 'beige foncé', '1'),
       ('8', '#2b5700', 'vert', '1'),
       ('9','#66b3ff', 'bleu clair', '1'),
       ('10','#0012b8', 'bleu foncé', '1'),
       ('11','#2b2b2b', 'gris foncé', '1'),
       ('12','#fcf9de', 'beige clair', '1'),
       ('13', '#fce300', 'jaune', '1'),
       ('14', '#004a06', 'vert foncé', '1');



DROP TABLE IF EXISTS `categorie_personne`;
CREATE TABLE categorie_personne
(
    `id_cat_personne`  SMALLINT AUTO_INCREMENT PRIMARY KEY,
    `nom_cat_personne` VARCHAR(40) NOT NULL,
    `image_cat_personne01` VARCHAR(255) NOT NULL,
    `image_cat_personne02` VARCHAR(255),
    `statut_cat_personne`  TINYINT(1)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `categorie_personne`(`id_cat_personne`, `nom_cat_personne`, `image_cat_personne01`,`image_cat_personne02`, `statut_cat_personne`)
VALUES ('1', 'Femme', 'imgs/catPer/femme01.jpg','imgs/catPer/femme02.jpeg', '1'),
       ('2', 'Homme', 'imgs/catPer/homme01.jpg','imgs/catPer/homme02.jpeg', '1'),
       ('3', 'Fille', 'imgs/catPer/fille01.jpg','imgs/catPer/fille02.jpg', '1'),
       ('4', 'Garçon', 'imgs/catPer/garcon01.jpg','imgs/catPer/garcon02.jpg', '1');


DROP TABLE IF EXISTS `categorie_nouveautes`;
CREATE TABLE categorie_nouveautes
(
    `id_cat_nouveaute`  SMALLINT AUTO_INCREMENT PRIMARY KEY,
    `libelle_cat_nouveaute` VARCHAR(40) NOT NULL,
    `statut_cat_nouveaute` TINYINT(1)


) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `categorie_nouveautes`(`id_cat_nouveaute`, `libelle_cat_nouveaute`, `statut_cat_nouveaute`)
VALUES  ('1', 'Automne-Hiver 2020', '1');


DROP TABLE IF EXISTS `categorie_soldes`;
CREATE TABLE categorie_soldes
(
    `id_cat_soldes`  SMALLINT AUTO_INCREMENT PRIMARY KEY,
    `libelle_cat_soldes` VARCHAR(40) NOT NULL,
    `dateDebut` DATE,
    `dateFin` DATE,
    `statut_cat_soldes` TINYINT(1)


) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `categorie_soldes`(`id_cat_soldes`, `libelle_cat_soldes`,  `dateDebut`, `dateFin`, `statut_cat_soldes`)
VALUES  ('1', 'Soldes d\'été', '2020-07-15', '2020-08-11', '1');



DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE utilisateurs
(
    `id_utilisateur`  SMALLINT AUTO_INCREMENT PRIMARY KEY,
    `prenom` VARCHAR(255) NOT NULL,
    `nom` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `motDePasse` VARCHAR(255) NOT NULL,
    `dateNaissance` DATE NOT NULL,
    `adresse` VARCHAR(255),
    `ville` VARCHAR(255),
    `codepostal` VARCHAR(255),
    `pays` VARCHAR(255),
    `statut_utilisateur` TINYINT(1)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `utilisateurs`(`id_utilisateur`, `prenom`,`nom`, `email`, `motDePasse`,`dateNaissance`, `adresse`, `ville`, `codepostal`, `pays`, `statut_utilisateur`)
VALUES ('1', 'Pablo', 'Perez', 'pabloperez@gmail.com', 'abc', '1986-09-19', '4 rue La Libération', 'Nancy', '54000', 'France', '1');


 -- *********************************** AVEC CLES ETRANGERES ****************************************


DROP TABLE IF EXISTS `categorie_produit`;
CREATE TABLE categorie_produit
(
    `id_cat_produit`  SMALLINT AUTO_INCREMENT PRIMARY KEY,
    `cat_personne_id` SMALLINT    NOT NULL,
    `nom_cat_produit` VARCHAR(255) NOT NULL,
    `image` VARCHAR(255),
    `statut_cat_produit` TINYINT(1),
    KEY `fk_categoriePersonneId` (`cat_personne_id`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `categorie_produit`(`id_cat_produit`, `cat_personne_id`, `nom_cat_produit`, `image`, `statut_cat_produit`)
VALUES ('1', '1', 'chemise', 'imgs/catProd/femme/chf010134_1.jpeg', '1'),
       ('2', '1','pantalon', 'imgs/catProd/femme/paf010243_1.jpeg', '1'),
       ('3', '1','robe', 'imgs/catProd/femme/rof010161_1.jpeg', '1'),
       ('4', '1','jupe', 'imgs/catProd/femme/juf010267_1.jpeg', '1'),
       ('5', '1','chaussures', 'imgs/catProd/femme/caf041279_1.jpeg', '1'),
       ('6', '2','chemise', 'imgs/catProd/homme/chh010198_1.jpeg', '1'),
       ('7', '2','pantalon', 'imgs/catProd/homme/pah0102104_1.jpeg', '1'),
       ('8', '2','chaussures', 'imgs/catProd/homme/cah0901113_1.jpeg', '1'),
       ('9', '3','chemise', 'imgs/catProd/fille/chi0101121_1.jpeg', '1'),
       ('10', '3','pantalon', 'imgs/catProd/fille/pai0110130_1.jpeg', '1'),
       ('11', '3','robe', 'imgs/catProd/fille/roi0114139_1.jpeg', '1'),
       ('12', '3','jupe', 'imgs/catProd/fille/jui0114148_1.jpeg', '1'),
       ('13', '4','chemise', 'imgs/catProd/garcon/chg0103157_1.jpeg', '1'),
       ('14', '4','pantalon', 'imgs/catProd/garcon/pag0102166_1.jpeg', '1');


DROP TABLE IF EXISTS `produits`;
CREATE TABLE produits
(
    `id_produit`  SMALLINT AUTO_INCREMENT PRIMARY KEY,
    `id_modele` SMALLINT NOT NULL,
    `cat_produit_id` SMALLINT  NOT NULL,
    `taille_id` SMALLINT,
    `couleur_id` SMALLINT,
    `libelle_prod` VARCHAR(255) NOT NULL,
    `prix_prod` FLOAT NOT NULL,
    `ref_prod` VARCHAR(40) NOT NULL,
    `description_prod` VARCHAR(500),
    `quantite` SMALLINT,
    `img_default` VARCHAR(255),
    `statut_produit` TINYINT(1),

    KEY `fk_categorieProduitId` (`cat_produit_id`),
    KEY `fk_tailleId` (`taille_id`),
    KEY `fk_couleurId` (`couleur_id`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `produits`(`id_produit`,`id_modele`, `cat_produit_id`,  `taille_id`, `couleur_id` , `libelle_prod`, `prix_prod`, `ref_prod` , `description_prod`,`quantite`,`img_default` ,`statut_produit` )
VALUES ('1','1', '1', '1','2', 'Chemise en velours', 19.99, 'CHF010201',
        'Chemise en velours doux. Modèle avec col en pointe et boutonnage devant.
Manches longues terminées par poignet boutonné. Base légèrement arrondie avec
un peu plus de longueur dans le dos.', '3', 'imgs/produits/nouveautes/imgnouv/chf010201_1.jpeg','1'),
       ('2','1', '1', '2','2', 'Chemise en velours', 19.99, 'CHF020202',
        'Chemise en velours doux. Modèle avec col en pointe et boutonnage devant.
Manches longues terminées par poignet boutonné. Base légèrement arrondie avec
un peu plus de longueur dans le dos.', '3','imgs/produits/nouveautes/imgnouv/chf010201_1.jpeg', '1'),
       ('3','1', '1', '3','2', 'Chemise en velours', 19.99, 'CHF030203',
        'Chemise en velours doux. Modèle avec col en pointe et boutonnage devant.
Manches longues terminées par poignet boutonné. Base légèrement arrondie avec
un peu plus de longueur dans le dos.', '3','imgs/produits/nouveautes/imgnouv/chf010201_1.jpeg', '1'),

       ('4','2', '1', '1','1', 'T-shirt imprimé', 14.99, 'CHF010104',
        'The Vampire’s Wife x H&M. The Vampire T-shirt est un T-shirt en doux
jersey de coton bio. Coupe ajustée avec logo du designer sur la poitrine.', '3','imgs/produits/nouveautes/imgnouv/chf010104_1.jpeg', '1'),
       ('5','2', '1', '2','1', 'T-shirt imprimé', 14.99, 'CHF020105',
        'The Vampire’s Wife x H&M. The Vampire T-shirt est un T-shirt en doux
jersey de coton bio. Coupe ajustée avec logo du designer sur la poitrine.', '3','imgs/produits/nouveautes/imgnouv/chf010104_1.jpeg', '1'),
       ('6','2', '1', '3','1', 'T-shirt imprimé', 14.99, 'CHF030106',
        'The Vampire’s Wife x H&M. The Vampire T-shirt est un T-shirt en doux
jersey de coton bio. Coupe ajustée avec logo du designer sur la poitrine.', '3','imgs/produits/nouveautes/imgnouv/chf010104_1.jpeg', '1'),



       ('7','3', '3', '1','4', 'Robe avec broderie anglaise', 69.99,'ROF010407',
        'Robe courte en coton avec broderie anglaise. Modèle à col droit
avec boutonnage en haut et taille légèrement cintrée. Emmanchures descendues et longues
manches amples terminées par large poignet boutonné. Partiellement doublée.', '3','imgs/produits/nouveautes/imgnouv/rof010407_1.jpeg', '1'),
       ('8','3', '3', '2','4', 'Robe avec broderie anglaise', 69.99,
        'ROF020408', 'Robe courte en coton avec broderie anglaise. Modèle à col droit
avec boutonnage en haut et taille légèrement cintrée. Emmanchures descendues et longues
manches amples terminées par large poignet boutonné. Partiellement doublée.', '3','imgs/produits/nouveautes/imgnouv/rof010407_1.jpeg', '1'),
       ('9','3', '3', '3','4', 'Robe avec broderie anglaise', 69.99,
        'ROF030409', 'Robe courte en coton avec broderie anglaise. Modèle à col droit
avec boutonnage en haut et taille légèrement cintrée. Emmanchures descendues et longues
manches amples terminées par large poignet boutonné. Partiellement doublée.', '3','imgs/produits/nouveautes/imgnouv/rof010407_1.jpeg', '1'),
       ('10','3', '3', '1','7', 'Robe avec broderie anglaise', 69.99,
        'ROF010710', 'Robe courte en coton avec broderie anglaise. Modèle à col droit
avec boutonnage en haut et taille légèrement cintrée. Emmanchures descendues et longues
manches amples terminées par large poignet boutonné. Partiellement doublée.', '3','imgs/produits/nouveautes/imgnouv/rof010710_1.jpeg', '1'),
       ('11','3', '3', '2','7', 'Robe avec broderie anglaise', 69.99,
        'ROF020711', 'Robe courte en coton avec broderie anglaise. Modèle à col droit
avec boutonnage en haut et taille légèrement cintrée. Emmanchures descendues et longues
manches amples terminées par large poignet boutonné. Partiellement doublée.', '3','imgs/produits/nouveautes/imgnouv/rof010710_1.jpeg', '1'),
       ('12','3', '3', '3','7', 'Robe avec broderie anglaise', 69.99,
        'ROF030712', 'Robe courte en coton avec broderie anglaise. Modèle à col droit
avec boutonnage en haut et taille légèrement cintrée. Emmanchures descendues et longues
manches amples terminées par large poignet boutonné. Partiellement doublée.', '3','imgs/produits/nouveautes/imgnouv/rof010710_1.jpeg', '1'),

       ('13','4', '7',  '1','5', 'Lot de 2 pantalons de pyjama', 29.99, 'PAH010513',
        'Pantalons de pyjama en tissu de coton aérien. Modèle avec élastique habillé et
lien de serrage à la taille. Fausse braguette et poches latérales.', '3','imgs/produits/nouveautes/imgnouv/pah010513_1.jpeg', '1'),
       ('14','4', '7',  '2','5', 'Lot de 2 pantalons de pyjama', 29.99, 'PAH020514',
        'Pantalons de pyjama en tissu de coton aérien. Modèle avec élastique habillé et
lien de serrage à la taille. Fausse braguette et poches latérales.', '3', 'imgs/produits/nouveautes/imgnouv/pah010513_1.jpeg','1'),
       ('15','4', '7',  '3','5', 'Lot de 2 pantalons de pyjama', 29.99, 'PAH030515',
        'Pantalons de pyjama en tissu de coton aérien. Modèle avec élastique habillé et
lien de serrage à la taille. Fausse braguette et poches latérales.', '3', 'imgs/produits/nouveautes/imgnouv/pah010513_1.jpeg','1'),

       ('16','5', '6',  '1','3', 'Surchemise en twill', 29.99, 'CHH010316',
        'Surchemise en twill de coton. Modèle avec col et fermeture à glissière devant.
Poches de poitrine avec rabat muni d’un bouton-pression dissimulé. Manches terminées par
fente et poignet boutonné. Empiècement dans le dos et base droite. Non doublée.', '3','imgs/produits/nouveautes/imgnouv/chh010316_1.jpeg', '1'),
       ('17','5', '6',  '2','3', 'Surchemise en twill', 29.99, 'CHH020317',
        'Surchemise en twill de coton. Modèle avec col et fermeture à glissière devant.
Poches de poitrine avec rabat muni d’un bouton-pression dissimulé. Manches terminées par
fente et poignet boutonné. Empiècement dans le dos et base droite. Non doublée.', '3','imgs/produits/nouveautes/imgnouv/chh010316_1.jpeg', '1'),
       ('18','5', '6',  '3','3', 'Surchemise en twill', 29.99, 'CHH030318',
        'Surchemise en twill de coton. Modèle avec col et fermeture à glissière devant.
Poches de poitrine avec rabat muni d’un bouton-pression dissimulé. Manches terminées par
fente et poignet boutonné. Empiècement dans le dos et base droite. Non doublée.', '3','imgs/produits/nouveautes/imgnouv/chh010316_1.jpeg', '1'),
       ('19','5', '6',  '1','8', 'Surchemise en twill', 29.99, 'CHH010819',
        'Surchemise en twill de coton. Modèle avec col et fermeture à glissière devant.
Poches de poitrine avec rabat muni d’un bouton-pression dissimulé. Manches terminées par
fente et poignet boutonné. Empiècement dans le dos et base droite. Non doublée.', '3','imgs/produits/nouveautes/imgnouv/chh010819_1.jpeg', '1'),
       ('20','5', '6',  '2','8', 'Surchemise en twill', 29.99, 'CHH020820',
        'Surchemise en twill de coton. Modèle avec col et fermeture à glissière devant.
Poches de poitrine avec rabat muni d’un bouton-pression dissimulé. Manches terminées par
fente et poignet boutonné. Empiècement dans le dos et base droite. Non doublée.', '3','imgs/produits/nouveautes/imgnouv/chh010819_1.jpeg', '1'),
       ('21','5', '6',  '3','8', 'Surchemise en twill', 29.99, 'CHH030821',
        'Surchemise en twill de coton. Modèle avec col et fermeture à glissière devant.
Poches de poitrine avec rabat muni d’un bouton-pression dissimulé. Manches terminées par
fente et poignet boutonné. Empiècement dans le dos et base droite. Non doublée.', '3','imgs/produits/nouveautes/imgnouv/chh010819_1.jpeg', '1'),

       ('22','6', '2',  '1','6', 'Pantalon jogger', 14.99, 'PAF010622',
        'Pantalon jogger en molleton de coton mélangé. Coupe décontractée avec
élastique et lien de serrage à la taille. Poches latérales discrètes.
Bord élastique en bas de jambe.', '3','imgs/produits/nouveautes/imgnouv/paf010622_1.jpeg', '1'),
       ('23','6', '2',  '2','6', 'Pantalon jogger', 14.99, 'PAF020623',
        'Pantalon jogger en molleton de coton mélangé. Coupe décontractée avec
élastique et lien de serrage à la taille. Poches latérales discrètes.
Bord élastique en bas de jambe.', '3','imgs/produits/nouveautes/imgnouv/paf010622_1.jpeg', '1'),
       ('24','6', '2',  '3','6', 'Pantalon jogger', 14.99, 'PAF030624',
        'Pantalon jogger en molleton de coton mélangé. Coupe décontractée avec
élastique et lien de serrage à la taille. Poches latérales discrètes.
Bord élastique en bas de jambe.', '3','imgs/produits/nouveautes/imgnouv/paf010622_1.jpeg', '1'),

       ('25','7', '1', '1','9', 'Longue chemise en jean', 29.99, 'CHF010925',
        'Chemise longue en denim souple de lyocell Tencel™. Coupe droite avec
col, poches de poitrine plissées et boutonnage devant. Manches longues terminées
par poignet boutonné.', '3','imgs/produits/femme/chemises/chf010925_1.jpeg', '1'),
       ('26','7', '1', '2','9', 'Longue chemise en jean', 29.99, 'CHF020926',
        'Chemise longue en denim souple de lyocell Tencel™. Coupe droite avec
col, poches de poitrine plissées et boutonnage devant. Manches longues terminées
par poignet boutonné.', '3','imgs/produits/femme/chemises/chf010925_1.jpeg', '1'),
       ('27','7', '1', '3','9', 'Longue chemise en jean', 29.99, 'CHF030927',
        'Chemise longue en denim souple de lyocell Tencel™. Coupe droite avec
col, poches de poitrine plissées et boutonnage devant. Manches longues terminées
par poignet boutonné.', '3','imgs/produits/femme/chemises/chf010925_1.jpeg', '1'),
       ('28','7', '1', '1','10', 'Longue chemise en jean', 29.99, 'CHF011028',
        'Chemise longue en denim souple de lyocell Tencel™. Coupe droite avec
col, poches de poitrine plissées et boutonnage devant. Manches longues terminées
par poignet boutonné.', '3','imgs/produits/femme/chemises/chf011028_1.jpeg', '1'),
       ('29','7', '1', '2','10', 'Longue chemise en jean', 29.99, 'CHF021029',
        'Chemise longue en denim souple de lyocell Tencel™. Coupe droite avec
col, poches de poitrine plissées et boutonnage devant. Manches longues terminées
par poignet boutonné.', '3','imgs/produits/femme/chemises/chf011028_1.jpeg', '1'),
       ('30','7', '1', '3','10', 'Longue chemise en jean', 29.99, 'CHF031030',
        'Chemise longue en denim souple de lyocell Tencel™. Coupe droite avec
col, poches de poitrine plissées et boutonnage devant. Manches longues terminées
par poignet boutonné.', '3','imgs/produits/femme/chemises/chf011028_1.jpeg', '1'),


       ('31','8', '1', '1','3', 'Chemise en coton', 14.99, 'CHF010331',
        'Chemise droite en coton tissé. Modèle avec col, poche de poitrine et
boutonnage devant. Manches longues terminées par poignet boutonné. Empiècement
avec pli creux dans le dos. Base arrondie avec un peu plus de longueur dans le dos.', '3','imgs/produits/femme/chemises/chf010331_1.jpeg', '1'),
       ('32','8', '1', '2','3', 'Chemise en coton',  14.99, 'CHF020332',
        'Chemise droite en coton tissé. Modèle avec col, poche de poitrine et
boutonnage devant. Manches longues terminées par poignet boutonné. Empiècement
avec pli creux dans le dos. Base arrondie avec un peu plus de longueur dans le dos.', '3','imgs/produits/femme/chemises/chf010331_1.jpeg', '1'),
       ('33','8', '1', '3','3', 'Chemise en coton',  14.99, 'CHF030333',
        'Chemise droite en coton tissé. Modèle avec col, poche de poitrine et
boutonnage devant. Manches longues terminées par poignet boutonné. Empiècement
avec pli creux dans le dos. Base arrondie avec un peu plus de longueur dans le dos.', '3','imgs/produits/femme/chemises/chf010331_1.jpeg', '1'),

       ('34','9', '1', '1','1', 'Chemise oversize en coton', 19.99, 'CHF010134',
        'Chemise oversize classique en tissu de coton craquant. Modèle avec col
et boutonnage dissimulé devant. Emmanchure descendue et manches longues terminées
par poignet boutonné. Base arrondie avec un peu plus de longueur dans le dos.', '3','imgs/produits/femme/chemises/chf010134_1.jpeg', '1'),
       ('35','9', '1', '2','1', 'Chemise oversize en coton',19.99, 'CHF020135',
        'Chemise oversize classique en tissu de coton craquant. Modèle avec col
et boutonnage dissimulé devant. Emmanchure descendue et manches longues terminées
par poignet boutonné. Base arrondie avec un peu plus de longueur dans le dos.', '3','imgs/produits/femme/chemises/chf010134_1.jpeg',  '1'),
       ('36','9', '1', '3','1', 'Chemise oversize en coton', 19.99, 'CHF030136',
        'Chemise oversize classique en tissu de coton craquant. Modèle avec col
et boutonnage dissimulé devant. Emmanchure descendue et manches longues terminées
par poignet boutonné. Base arrondie avec un peu plus de longueur dans le dos.', '3','imgs/produits/femme/chemises/chf010134_1.jpeg', '1'),

       ('37','10', '1', '1','9',  'Chemise en jean', 24.99, 'CHF010937',
        'Chemise en denim lavé. Modèle avec col et fermeture au moyen de
boutons-pression nacrés devant. Poches de poitrine à rabat pressionné.
Manches longues terminées par poignet boutonné. Empiècement devant et
dans le dos. Base arrondie.', '3','imgs/produits/femme/chemises/chf010937_1.jpeg', '1'),
       ('38','10', '1', '2','9',  'Chemise en jean', 24.99, 'CHF020938',
        'Chemise en denim lavé. Modèle avec col et fermeture au moyen de
boutons-pression nacrés devant. Poches de poitrine à rabat pressionné.
Manches longues terminées par poignet boutonné. Empiècement devant et
dans le dos. Base arrondie.', '3','imgs/produits/femme/chemises/chf010937_1.jpeg', '1'),
       ('39','10', '1', '3','9',  'Chemise en jean', 24.99, 'CHF030939',
        'Chemise en denim lavé. Modèle avec col et fermeture au moyen de
boutons-pression nacrés devant. Poches de poitrine à rabat pressionné.
Manches longues terminées par poignet boutonné. Empiècement devant et
dans le dos. Base arrondie.', '3','imgs/produits/femme/chemises/chf010937_1.jpeg', '1'),

       ('40','11', '2',  '1','11', 'Pantalon habillé', 29.99, 'PAF011140',
        'Pantalon tissé. Modèle taille haute avec plis couchés en haut
et braguette zippée surmontée d’une agrafe. Poches latérales et
fausses poches dans le dos. Jambes effilées, de longueur cheville,
avec plis marqués. ', '3','imgs/produits/femme/pantalons/paf011140_1.jpeg', '1'),
       ('41','11', '2', '2','11', 'Pantalon habillé', '29,99 €', 'PAF021141',
        'Pantalon tissé. Modèle taille haute avec plis couchés en haut
et braguette zippée surmontée d’une agrafe. Poches latérales et
fausses poches dans le dos. Jambes effilées, de longueur cheville,
avec plis marqués. ', '3','imgs/produits/femme/pantalons/paf011140_1.jpeg', '1'),
       ('42','11', '2',  '3','11', 'Pantalon habillé',  29.99, 'PAF031142',
        'Pantalon tissé. Modèle taille haute avec plis couchés en haut
et braguette zippée surmontée d’une agrafe. Poches latérales et
fausses poches dans le dos. Jambes effilées, de longueur cheville,
avec plis marqués. ', '3','imgs/produits/femme/pantalons/paf011140_1.jpeg', '1'),
       ('43','11', '2',  '1','2', 'Pantalon habillé',  29.99, 'PAF010243',
        'Pantalon tissé. Modèle taille haute avec plis couchés en haut
et braguette zippée surmontée d’une agrafe. Poches latérales et
fausses poches dans le dos. Jambes effilées, de longueur cheville,
avec plis marqués. ', '3','imgs/produits/femme/pantalons/paf010243_1.jpeg', '1'),
       ('44','11', '2',  '2','2', 'Pantalon habillé',  29.99, 'PAF020244',
        'Pantalon tissé. Modèle taille haute avec plis couchés en haut
et braguette zippée surmontée d’une agrafe. Poches latérales et
fausses poches dans le dos. Jambes effilées, de longueur cheville,
avec plis marqués. ', '3','imgs/produits/femme/pantalons/paf010243_1.jpeg', '1'),
       ('45','11', '2',  '3','2', 'Pantalon habillé',  29.99, 'PAF030245',
        'Pantalon tissé. Modèle taille haute avec plis couchés en haut
et braguette zippée surmontée d’une agrafe. Poches latérales et
fausses poches dans le dos. Jambes effilées, de longueur cheville,
avec plis marqués. ', '3','imgs/produits/femme/pantalons/paf010243_1.jpeg', '1'),

       ('46','12', '2', '1','5', 'Jean large', 19.99, 'PAF010546',
        'Jean en denim extensible. Modèle taille haute avec braguette
zippée surmontée d’un bouton, poche à monnaie et poches dans le dos.
Jambes amples et droites de longueur cheville. Le coton contenu dans cet
article est partiellement d’origine recyclée.', '3','imgs/produits/femme/pantalons/paf010546_1.jpeg', '1'),
       ('47','12', '2', '2','5', 'Jean large', 19.99, 'PAF020547',
        'Jean en denim extensible. Modèle taille haute avec braguette
zippée surmontée d’un bouton, poche à monnaie et poches dans le dos.
Jambes amples et droites de longueur cheville. Le coton contenu dans cet
article est partiellement d’origine recyclée.', '3','imgs/produits/femme/pantalons/paf010546_1.jpeg', '1'),
       ('48','12', '2', '3','5', 'Jean large', 19.99, 'PAF030548',
        'Jean en denim extensible. Modèle taille haute avec braguette
zippée surmontée d’un bouton, poche à monnaie et poches dans le dos.
Jambes amples et droites de longueur cheville. Le coton contenu dans cet
article est partiellement d’origine recyclée.', '3','imgs/produits/femme/pantalons/paf010546_1.jpeg', '1'),

       ('49','13', '2', '1','12', 'Pantalon ample en lin mélangé', 49.99, 'PAF011249',
        'Pantalon en tissu de lin et coton mélangés. Modèle taille haute avec braguette
zippée surmontée d’un bouton. Poches latérales et poches dans le dos. Jambes très
longues, amples et droites, avec plis cousus devant.', '3','imgs/produits/femme/pantalons/paf011249_1.jpeg', '1'),
       ('50','13', '2', '2','12', 'Pantalon ample en lin mélangé', 49.99, 'PAF021250',
        'Pantalon en tissu de lin et coton mélangés. Modèle taille haute avec braguette
zippée surmontée d’un bouton. Poches latérales et poches dans le dos. Jambes très
longues, amples et droites, avec plis cousus devant.', '3','imgs/produits/femme/pantalons/paf011249_1.jpeg', '1'),
       ('51','13', '2', '3','12', 'Pantalon ample en lin mélangé', 49.99, 'PAF031251',
        'Pantalon en tissu de lin et coton mélangés. Modèle taille haute avec braguette
zippée surmontée d’un bouton. Poches latérales et poches dans le dos. Jambes très
longues, amples et droites, avec plis cousus devant.', '3','imgs/produits/femme/pantalons/paf011249_1.jpeg', '1'),

       ('52','14', '2',  '1','12', 'Pantalon cigarette', 29.99, 'PAF011252',
        'Pantalon cigarette tissé. Modèle taille haute avec braguette zippée
et fermeture par agrafe. Poches latérales obliques et fausses poches dans le dos.
Jambes fines, de longueur cheville, avec plis marqués. ', '3','imgs/produits/femme/pantalons/paf011252_1.jpeg', '1'),
       ('53','14', '2', '2','12', 'Pantalon cigarette', 29.99, 'PAF021253',
        'Pantalon cigarette tissé. Modèle taille haute avec braguette zippée
et fermeture par agrafe. Poches latérales obliques et fausses poches dans le dos.
Jambes fines, de longueur cheville, avec plis marqués. ', '3','imgs/produits/femme/pantalons/paf011252_1.jpeg', '1'),
       ('54','14', '2',  '3','12', 'Pantalon cigarette', 29.99, 'PAF031254',
        'Pantalon cigarette tissé. Modèle taille haute avec braguette zippée
et fermeture par agrafe. Poches latérales obliques et fausses poches dans le dos.
Jambes fines, de longueur cheville, avec plis marqués. ', '3','imgs/produits/femme/pantalons/paf011252_1.jpeg', '1'),

       ('55','15', '3', '1','2', 'Robe en mousseline', 24.99, 'ROF010255',
        'Robe trapèze courte en mousseline froissée. Modèle avec col mao et
boutons habillés en haut. Longues manches bouffantes terminées par petit
poignet à bouton habillé. Découpe à la taille et sur la jupe.', '3','imgs/produits/femme/robes/rof010255_1.jpeg', '1'),
       ('56','15', '3',  '2','2', 'Robe en mousseline', 24.99, 'ROF020256',
        'Robe trapèze courte en mousseline froissée. Modèle avec col mao et
boutons habillés en haut. Longues manches bouffantes terminées par petit
poignet à bouton habillé. Découpe à la taille et sur la jupe.', '3','imgs/produits/femme/robes/rof010255_1.jpeg', '1'),
       ('57','15', '3',  '3','2', 'Robe en mousseline', 24.99, 'ROF030257',
        'Robe trapèze courte en mousseline froissée. Modèle avec col mao et
boutons habillés en haut. Longues manches bouffantes terminées par petit
poignet à bouton habillé. Découpe à la taille et sur la jupe.  ','imgs/produits/femme/robes/rof010255_1.jpeg', '3', '1'),
       ('58','15', '3',  '1','12', 'Robe en mousseline', 24.99, 'ROF011258',
        'Robe trapèze courte en mousseline froissée. Modèle avec col mao et
boutons habillés en haut. Longues manches bouffantes terminées par petit
poignet à bouton habillé. Découpe à la taille et sur la jupe.', '3','imgs/produits/femme/robes/rof011258_1.jpeg', '1'),
       ('59','15', '3',  '2','12', 'Robe en mousseline', 24.99, 'ROF021259',
        'Robe trapèze courte en mousseline froissée. Modèle avec col mao et
boutons habillés en haut. Longues manches bouffantes terminées par petit
poignet à bouton habillé. Découpe à la taille et sur la jupe.', '3','imgs/produits/femme/robes/rof011258_1.jpeg', '1'),
       ('60','15', '3', '3','12', 'Robe en mousseline', 24.99, 'ROF031260',
        'Robe trapèze courte en mousseline froissée. Modèle avec col mao et
boutons habillés en haut. Longues manches bouffantes terminées par petit
poignet à bouton habillé. Découpe à la taille et sur la jupe.  ', '3','imgs/produits/femme/robes/rof011258_1.jpeg', '1'),

       ('61','16', '3',  '1','1', 'Robe en maille', 24.99, 'ROF010161',
        'Robe courte en maille douce. Modèle avec encolure ronde, emmanchures
descendues et longues manches ballon. Finition côtelée à l\'encolure,
aux poignets et à la base.', '3','imgs/produits/femme/robes/rof010161_1.jpeg', '1'),
       ('62','16', '3' ,'2','1', 'Robe en maille', 24.99, 'ROF020162',
        'Robe courte en maille douce. Modèle avec encolure ronde, emmanchures
descendues et longues manches ballon. Finition côtelée à l\'encolure,
aux poignets et à la base.', '3','imgs/produits/femme/robes/rof010161_1.jpeg', '1'),
       ('63','16', '3', '3','1', 'Robe en maille', 24.99, 'ROF030163',
        'Robe courte en maille douce. Modèle avec encolure ronde, emmanchures
descendues et longues manches ballon. Finition côtelée à l\'encolure,
aux poignets et à la base.', '3','imgs/produits/femme/robes/rof010161_1.jpeg', '1'),

       ('64','17', '3',  '1','2', 'Robe à col volanté', 29.99, 'ROF010264',
        'Robe courte tissée. Coupe droite avec col volanté montant, empiècement
et boutons habillés devant. Manches bouffantes longues et amples, terminées par
petite fente boutonnée. Non doublée.', '3','imgs/produits/femme/robes/rof010264_1.jpeg', '1'),
       ('65','17', '3', '2','2', 'Robe à col volanté', 29.99, 'ROF020265',
        'Robe courte tissée. Coupe droite avec col volanté montant, empiècement
et boutons habillés devant. Manches bouffantes longues et amples, terminées par
petite fente boutonnée. Non doublée.', '3','imgs/produits/femme/robes/rof010264_1.jpeg', '1'),
       ('66','17', '3',  '3','2', 'Robe à col volanté', 29.99, 'ROF030266',
        'Robe courte tissée. Coupe droite avec col volanté montant, empiècement
et boutons habillés devant. Manches bouffantes longues et amples, terminées par
petite fente boutonnée. Non doublée.', '3','imgs/produits/femme/robes/rof010264_1.jpeg', '1'),


       ('67','18', '4', '1','2', 'Jupe trapèze', 19.99, 'JUF010267',
        'Jupe trapèze courte. Modèle taille haute avec boutonnage devant.', '3','imgs/produits/femme/jupes/juf010267_1.jpeg', '1'),
       ('68','18', '4', '2','2', 'Jupe trapèze', 19.99, 'JUF020268',
        'Jupe trapèze courte. Modèle taille haute avec boutonnage devant.','imgs/produits/femme/jupes/juf010267_1.jpeg', '3', '1'),
       ('69','18', '4', '3','2', 'Jupe trapèze', 19.99, 'JUF030269',
        'Jupe trapèze courte. Modèle taille haute avec boutonnage devant.','imgs/produits/femme/jupes/juf010267_1.jpeg', '3', '1'),
       ('70','18', '4', '1','9', 'Jupe trapèze', 19.99, 'JUF010970',
        'Jupe trapèze courte. Modèle taille haute avec boutonnage devant.', '3','imgs/produits/femme/jupes/juf010970_1.jpeg', '1'),
       ('71','18', '4', '2','9', 'Jupe trapèze', 19.99, 'JUF020971',
        'Jupe trapèze courte. Modèle taille haute avec boutonnage devant.', '3','imgs/produits/femme/jupes/juf010970_1.jpeg', '1'),
       ('72','18', '4', '3','9', 'Jupe trapèze', 19.99, 'JUF030972',
        'Jupe trapèze courte. Modèle taille haute avec boutonnage devant.', '3','imgs/produits/femme/jupes/juf010970_1.jpeg', '1'),

       ('73','19', '4', '1','2', 'Jupe corolle', 14.99, 'JUF010273',
        'Jupe corolle en jersey de bonne tenue. Modèle court avec élastique à la
taille et fermeture à glissière apparente dans le dos. Non doublée.', '3','imgs/produits/femme/jupes/juf010273_1.jpeg', '1'),
       ('74','19', '4', '2','2', 'Jupe corolle', 14.99, 'JUF0202754',
        'Jupe corolle en jersey de bonne tenue. Modèle court avec élastique à la
taille et fermeture à glissière apparente dans le dos. Non doublée.', '3','imgs/produits/femme/jupes/juf010273_1.jpeg', '1'),
       ('75','19', '4', '3','2', 'Jupe corolle', 14.99, 'JUF0302765',
        'Jupe corolle en jersey de bonne tenue. Modèle court avec élastique à la
taille et fermeture à glissière apparente dans le dos. Non doublée.', '3','imgs/produits/femme/jupes/juf010273_1.jpeg', '1'),

       ('76','20', '4', '1','4', 'Jupe courte', 19.99, 'JUF010476',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/jupes/juf010476_1.jpeg', '1'),
       ('77','20', '4', '2','4', 'Jupe courte', 19.99, 'JUF020477',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/jupes/juf010476_1.jpeg', '1'),
       ('78','20', '4',  '3','4', 'Jupe courte', 19.99, 'JUF030478',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/jupes/juf010476_1.jpeg', '1'),

       ('79','21', '5',  '4','12', 'Bottines Chelsea', 34.99, 'CAF041279',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/chaussures/caf041279_1.jpeg', '1'),
       ('80','21', '5',  '5','12', 'Bottines Chelsea', 34.99, 'CAF051280',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/chaussures/caf041279_1.jpeg', '1'),
       ('81','21', '5', '6','12', 'Bottines Chelsea', 34.99, 'CAF061281',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/chaussures/caf041279_1.jpeg', '1'),
       ('82','21', '5',  '7','12', 'Bottines Chelsea', 34.99, 'CAF071282',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/chaussures/caf041279_1.jpeg', '1'),
       ('83','21', '5',  '8','12', 'Bottines Chelsea', 34.99, 'CAF081283',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/chaussures/caf041279_1.jpeg', '1'),
       ('84','21', '5', '9','12', 'Bottines Chelsea', 34.99, 'CAF091284',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/chaussures/caf041279_1.jpeg', '1'),
       ('85','21', '5', '10','12', 'Bottines Chelsea', 34.99, 'CAF101285',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/chaussures/caf041279_1.jpeg', '1'),
       ('86','21', '5',  '11','12', 'Bottines Chelsea', 34.99, 'CAF111286',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/chaussures/caf041279_1.jpeg', '1'),
       ('87','21', '5', '12','12', 'Bottines Chelsea', 34.99, 'CAF121287',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/chaussures/caf041279_1.jpeg', '1'),
       ('88','21', '5', '13','12', 'Bottines Chelsea', 34.99, 'CAF131288',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/chaussures/caf041279_1.jpeg', '1'),
       ('89','21', '5', '14','12', 'Bottines Chelsea', 34.99, 'CAF141289',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/chaussures/caf041279_1.jpeg', '1'),
       ('90','21', '5', '15','12', 'Bottines Chelsea', 34.99, 'CAF151290',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/chaussures/caf041279_1.jpeg', '1'),
       ('91','21', '5',  '16','12', 'Bottines Chelsea', 34.99, 'CAF161291',
        'Jupe courte en tissu à la surface brossée. Modèle taille haute avec
fermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', '3','imgs/produits/femme/chaussures/caf041279_1.jpeg', '1'),


       ('92','22', '6',  '1','2', 'Surchemise en twill', 29.99, 'CHH010292',
'Surchemise en twill. Modèle avec col, boutonnage devant et empiècement dans le dos.
Poches de poitrine à rabat boutonné. Manches longues terminées par poignet boutonné.', '3','imgs/produits/homme/chemises/chh010292_1.jpeg', '1'),
       ('93','22', '6', '2','2', 'Surchemise en twill', 29.99, 'CHH020293',
'Surchemise en twill. Modèle avec col, boutonnage devant et empiècement dans le dos.
Poches de poitrine à rabat boutonné. Manches longues terminées par poignet boutonné.', '3','imgs/produits/homme/chemises/chh010292_1.jpeg', '1'),
       ('94','22', '6', '3','2', 'Surchemise en twill', 29.99, 'CHH030294',
'Surchemise en twill. Modèle avec col, boutonnage devant et empiècement dans le dos.
Poches de poitrine à rabat boutonné. Manches longues terminées par poignet boutonné.', '3','imgs/produits/homme/chemises/chh010292_1.jpeg', '1'),
       ('95','22', '6', '1','7', 'Surchemise en twill', 29.99, 'CHH010795',
'Surchemise en twill. Modèle avec col, boutonnage devant et empiècement dans le dos.
Poches de poitrine à rabat boutonné. Manches longues terminées par poignet boutonné.', '3','imgs/produits/homme/chemises/chh010795_1.jpeg', '1'),
       ('96','22', '6', '2','7', 'Surchemise en twill', 29.99, 'CHH020796',
'Surchemise en twill. Modèle avec col, boutonnage devant et empiècement dans le dos.
Poches de poitrine à rabat boutonné. Manches longues terminées par poignet boutonné.', '3','imgs/produits/homme/chemises/chh010795_1.jpeg', '1'),
       ('97','22', '6',  '3','7', 'Surchemise en twill', 29.99, 'CHH030797',
'Surchemise en twill. Modèle avec col, boutonnage devant et empiècement dans le dos.
Poches de poitrine à rabat boutonné. Manches longues terminées par poignet boutonné.', '3','imgs/produits/homme/chemises/chh010795_1.jpeg', '1'),

       ('98','23', '6',  '1','1', 'Chemise Oxford Muscle Fit', 19.99, 'CHH010198',
        'Chemise extensible en coton Oxford. Modèle avec col américain et boutonnage classique. Manches longues terminées par poignet à boutonnage ajustable. Empiècement
d’épaules et pinces dans le dos. Base arrondie. Muscle Fit – une coupe avec des épaules resserrées
et des manches effilées pour une silhouette flatteuse, qui met le corps en valeur.', '3','imgs/produits/homme/chemises/chh010198_1.jpeg', '1'),
       ('99','23', '6', '2','1', 'Chemise Oxford Muscle Fit', 19.99, 'CHH020199',
        'Chemise extensible en coton Oxford. Modèle avec col américain et boutonnage classique. Manches longues terminées par poignet à boutonnage ajustable. Empiècement
d’épaules et pinces dans le dos. Base arrondie. Muscle Fit – une coupe avec des épaules resserrées
et des manches effilées pour une silhouette flatteuse, qui met le corps en valeur.', '3','imgs/produits/homme/chemises/chh010198_1.jpeg', '1'),
       ('100','23', '6', '3','1', 'Chemise Oxford Muscle Fit', 19.99, 'CHH0301100',
        'Chemise extensible en coton Oxford. Modèle avec col américain et boutonnage classique. Manches longues terminées par poignet à boutonnage ajustable. Empiècement
d’épaules et pinces dans le dos. Base arrondie. Muscle Fit – une coupe avec des épaules resserrées
et des manches effilées pour une silhouette flatteuse, qui met le corps en valeur.', '3','imgs/produits/homme/chemises/chh010198_1.jpeg', '1'),

       ('101','24', '6',  '1','5', 'Chemise en velours Regular Fit', 19.99, 'CHH0105101',
        'Chemise en velours de coton côtelé. Modèle avec col boutonné, poche de poitrine et
boutonnage classique. Manches longues terminées par fente boutonnée et poignet à boutonnage
ajustable. ', '3','imgs/produits/homme/chemises/chh0105101_1.jpeg', '1'),
       ('102','24', '6', '2','5', 'Chemise en velours Regular Fit', 19.99, 'CHH0205102',
        'Chemise en velours de coton côtelé. Modèle avec col boutonné, poche de poitrine et
boutonnage classique. Manches longues terminées par fente boutonnée et poignet à boutonnage
ajustable. ', '3','imgs/produits/homme/chemises/chh0105101_1.jpeg', '1'),
       ('103','24', '6',  '3','5', 'Chemise en velours Regular Fit', 19.99, 'CHH0305103',
        'Chemise en velours de coton côtelé. Modèle avec col boutonné, poche de poitrine et
boutonnage classique. Manches longues terminées par fente boutonnée et poignet à boutonnage
ajustable. ', '3','imgs/produits/homme/chemises/chh0105101_1.jpeg', '1'),


       ('104','25', '7', '1','2', 'Pantalon jogger Slim Fit', 29.99, 'PAH0102104',
        'Pantalon jogger tissé. Modèle avec élastique et lien de serrage à la taille.
Poches latérales obliques et poches passepoilées avec bouton dans le dos, Jambes de longueur
cheville avec plis marqués et terminées par revers cousu. ', '3','imgs/produits/homme/pantalons/pah0102104_1.jpeg', '1'),
       ('105','25', '7',  '2','2', 'Pantalon jogger Slim Fit', 29.99, 'PAH0202105',
        'Pantalon jogger tissé. Modèle avec élastique et lien de serrage à la taille.
Poches latérales obliques et poches passepoilées avec bouton dans le dos, Jambes de longueur
cheville avec plis marqués et terminées par revers cousu. ', '3','imgs/produits/homme/pantalons/pah0102104_1.jpeg', '1'),
       ('106','25', '7',  '3','2', 'Pantalon jogger Slim Fit', 29.99, 'PAH0302106',
        'Pantalon jogger tissé. Modèle avec élastique et lien de serrage à la taille.
Poches latérales obliques et poches passepoilées avec bouton dans le dos, Jambes de longueur
cheville avec plis marqués et terminées par revers cousu. ', '3','imgs/produits/homme/pantalons/pah0102104_1.jpeg', '1'),
       ('107','25', '7', '1','4', 'Pantalon jogger Slim Fit', 29.99, 'PAH0104107',
        'Pantalon jogger tissé. Modèle avec élastique et lien de serrage à la taille.
Poches latérales obliques et poches passepoilées avec bouton dans le dos, Jambes de longueur
cheville avec plis marqués et terminées par revers cousu. ', '3','imgs/produits/homme/pantalons/pah0104107_1.jpeg', '1'),
       ('108','25', '7',  '2','4', 'Pantalon jogger Slim Fit', 29.99, 'PAH0204108',
        'Pantalon jogger tissé. Modèle avec élastique et lien de serrage à la taille.
Poches latérales obliques et poches passepoilées avec bouton dans le dos, Jambes de longueur
cheville avec plis marqués et terminées par revers cousu. ', '3','imgs/produits/homme/pantalons/pah0104107_1.jpeg', '1'),
       ('109','25', '7',  '3','4', 'Pantalon jogger Slim Fit', 29.99, 'PAH0304109',
        'Pantalon jogger tissé. Modèle avec élastique et lien de serrage à la taille.
Poches latérales obliques et poches passepoilées avec bouton dans le dos, Jambes de longueur
cheville avec plis marqués et terminées par revers cousu. ', '3','imgs/produits/homme/pantalons/pah0104107_1.jpeg', '1'),

       ('110','26', '7', '1','7', 'Pantalon cargo', 34.99, 'PAH0107110',
        'Pantalon cargo en twill de coton extensible. Modèle avec élastique et lien de serrage
à la taille. Fausse braguette. Poches sur les côtés et dans le dos et poches sur les jambes à
rabat pressionné.', '3','imgs/produits/homme/pantalons/pah0107110_1.jpeg', '1'),
       ('111','26', '7',  '2','7', 'Pantalon cargo', 34.99, 'PAH0207111',
        'Pantalon cargo en twill de coton extensible. Modèle avec élastique et lien de serrage
à la taille. Fausse braguette. Poches sur les côtés et dans le dos et poches sur les jambes à
rabat pressionné.', '3','imgs/produits/homme/pantalons/pah0107110_1.jpeg', '1'),
       ('112','26', '7',  '3','7', 'Pantalon cargo', 34.99, 'PAH0307112',
        'Pantalon cargo en twill de coton extensible. Modèle avec élastique et lien de serrage
à la taille. Fausse braguette. Poches sur les côtés et dans le dos et poches sur les jambes à
rabat pressionné.', '3','imgs/produits/homme/pantalons/pah0107110_1.jpeg', '1'),


       ('113','27', '8',  '9','1', 'Baskets', 24.99, 'CAH0901113',
        'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette
matelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.
Motif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', '3','imgs/produits/homme/chaussures/cah0901113_1.jpeg', '1'),
       ('114','27', '8',  '10','1', 'Baskets', 24.99, 'CAH1001114',
        'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette
matelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.
Motif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', '3','imgs/produits/homme/chaussures/cah0901113_1.jpeg', '1'),
       ('115','27', '8',  '11','1', 'Baskets', 24.99, 'CAH1101115',
        'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette
matelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.
Motif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', '3','imgs/produits/homme/chaussures/cah0901113_1.jpeg', '1'),
       ('116','27', '8',  '12','1', 'Baskets', 24.99, 'CAH1201116',
        'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette
matelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.
Motif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', '3','imgs/produits/homme/chaussures/cah0901113_1.jpeg', '1'),
       ('117','27', '8', '13','1', 'Baskets', 24.99, 'CAH1301117',
        'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette
matelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.
Motif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', '3','imgs/produits/homme/chaussures/cah0901113_1.jpeg', '1'),
       ('118','27', '8',  '14','1', 'Baskets', 24.99, 'CAH1401118',
        'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette
matelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.
Motif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', '3','imgs/produits/homme/chaussures/cah0901113_1.jpeg', '1'),
       ('119','27', '8',  '15','1', 'Baskets', 24.99, 'CAH1501119',
        'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette
matelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.
Motif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', '3','imgs/produits/homme/chaussures/cah0901113_1.jpeg', '1'),
       ('120','27', '8',  '16','1', 'Baskets', 24.99, 'CAH1601120',
        'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette
matelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.
Motif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', '3','imgs/produits/homme/chaussures/cah0901113_1.jpeg', '1'),


       ('121','28', '9', '1','1', 'Blouse avec dentelle', 12.99, 'CHI0101121',
        'Blouse trapèze en viscose tissée. Modèle double épaisseur en haut avec empiècement
en dentelle. Longues manches bouffantes terminées par mince élastique et petit bord volanté.
Petite ouverture dans le dos surmontée d’un bouton sur la nuque.', '3','imgs/produits/fille/chemises/chi0101121_1.jpeg', '1'),
       ('122','28', '9',  '2','1', 'Blouse avec dentelle', 12.99, 'CHI0201122',
        'Blouse trapèze en viscose tissée. Modèle double épaisseur en haut avec empiècement
en dentelle. Longues manches bouffantes terminées par mince élastique et petit bord volanté.
Petite ouverture dans le dos surmontée d’un bouton sur la nuque.', '3','imgs/produits/fille/chemises/chi0101121_1.jpeg', '1'),
       ('123','28', '9',  '3','1', 'Blouse avec dentelle', 12.99, 'CHI0301123',
        'Blouse trapèze en viscose tissée. Modèle double épaisseur en haut avec empiècement
en dentelle. Longues manches bouffantes terminées par mince élastique et petit bord volanté.
Petite ouverture dans le dos surmontée d’un bouton sur la nuque.', '3','imgs/produits/fille/chemises/chi0101121_1.jpeg', '1'),
       ('124','28', '9', '1','13', 'Blouse avec dentelle', 12.99, 'CHI0113124',
        'Blouse trapèze en viscose tissée. Modèle double épaisseur en haut avec empiècement
en dentelle. Longues manches bouffantes terminées par mince élastique et petit bord volanté.
Petite ouverture dans le dos surmontée d’un bouton sur la nuque.', '3','imgs/produits/fille/chemises/chi0113124_1.jpeg', '1'),
       ('125','28', '9',  '2','13', 'Blouse avec dentelle', 12.99, 'CHI0213125',
        'Blouse trapèze en viscose tissée. Modèle double épaisseur en haut avec empiècement
en dentelle. Longues manches bouffantes terminées par mince élastique et petit bord volanté.
Petite ouverture dans le dos surmontée d’un bouton sur la nuque.', '3','imgs/produits/fille/chemises/chi0113124_1.jpeg', '1'),
       ('126','28', '9',  '3','13', 'Blouse avec dentelle', 12.99, 'CHI0313126',
        'Blouse trapèze en viscose tissée. Modèle double épaisseur en haut avec empiècement
en dentelle. Longues manches bouffantes terminées par mince élastique et petit bord volanté.
Petite ouverture dans le dos surmontée d’un bouton sur la nuque.', '3','imgs/produits/fille/chemises/chi0113124_1.jpeg', '1'),

       ('127','29', '9',  '1','1', 'Blouse à plis nervure', 19.99, 'CHI0101127',
        'Exclusivité enfants. Blouse en tissu de coton bio avec plis nervure et rubans de
dentelle incrustés en haut. Modèle avec manches longues terminées par mince élastique.
Découpe légèrement froncée en haut. Boutons nacrés dans le dos.', '3','imgs/produits/fille/chemises/chi0101127_1.jpeg', '1'),
       ('128','29', '9',  '2','1', 'Blouse à plis nervure', 19.99, 'CHI0201128',
        'Exclusivité enfants. Blouse en tissu de coton bio avec plis nervure et rubans de
dentelle incrustés en haut. Modèle avec manches longues terminées par mince élastique.
Découpe légèrement froncée en haut. Boutons nacrés dans le dos.', '3','imgs/produits/fille/chemises/chi0101127_1.jpeg', '1'),
       ('129','29', '9',  '3','1', 'Blouse à plis nervure', 19.99, 'CHI0301129',
        'Exclusivité enfants. Blouse en tissu de coton bio avec plis nervure et rubans de
dentelle incrustés en haut. Modèle avec manches longues terminées par mince élastique.
Découpe légèrement froncée en haut. Boutons nacrés dans le dos.', '3','imgs/produits/fille/chemises/chi0101127_1.jpeg', '1'),


       ('130','30', '10', '1','10', 'Legging en denim', 9.99, 'PAI0110130',
        'Legging en denim extensible lavé. Modèle avec élastique à la taille, fausses poches
devant et vraies poches dans le dos.', '3','imgs/produits/fille/pantalons/pai0110130_1.jpeg', '1'),
       ('131','30', '10', '2','10', 'Legging en denim', 9.99, 'PAI0210131',
        'Legging en denim extensible lavé. Modèle avec élastique à la taille, fausses poches
devant et vraies poches dans le dos.', '3','imgs/produits/fille/pantalons/pai0110130_1.jpeg', '1'),
       ('132','30', '10', '3','10', 'Legging en denim', 9.99, 'PAI0310132',
        'Legging en denim extensible lavé. Modèle avec élastique à la taille, fausses poches
devant et vraies poches dans le dos.', '3','imgs/produits/fille/pantalons/pai0110130_1.jpeg', '1'),
       ('133','30', '10', '1','4', 'Legging en denim', 9.99, 'PAI0104133',
        'Legging en denim extensible lavé. Modèle avec élastique à la taille, fausses poches
devant et vraies poches dans le dos.', '3','imgs/produits/fille/pantalons/pai0104133_1.jpeg', '1'),
       ('134','30', '10', '2','4', 'Legging en denim', 9.99, 'PAI0204134',
        'Legging en denim extensible lavé. Modèle avec élastique à la taille, fausses poches
devant et vraies poches dans le dos.', '3', 'imgs/produits/fille/pantalons/pai0104133_1.jpeg','1'),
       ('135','30', '10', '3','4', 'Legging en denim', 9.99, 'PAI0304135',
        'Legging en denim extensible lavé. Modèle avec élastique à la taille, fausses poches
devant et vraies poches dans le dos.', '3','imgs/produits/fille/pantalons/pai0104133_1.jpeg', '1'),

       ('136','31', '10',  '1','3', 'Tregging', 9.99, 'PAI0103136',
        'Tregging en molleton de coton. Coupe très près du corps avec bord-côte élastique à
la taille qui facilite l’habillage. ', '3','imgs/produits/fille/pantalons/pai0103136_1.jpeg', '1'),
       ('137','31', '10', '2','3', 'Tregging', 9.99, 'PAI0203137',
        'Tregging en molleton de coton. Coupe très près du corps avec bord-côte élastique à
la taille qui facilite l’habillage. ', '3','imgs/produits/fille/pantalons/pai0103136_1.jpeg', '1'),
       ('138','31', '10', '3','3', 'Tregging ', 9.99, 'PAI0303138',
        'Tregging en molleton de coton. Coupe très près du corps avec bord-côte élastique à
la taille qui facilite l’habillage. ', '3','imgs/produits/fille/pantalons/pai0103136_1.jpeg', '1'),


       ('139','32', '11', '1','14', 'Robe en velours côtelé', 19.99, 'ROI0114139',
        'Robe en doux velours de coton côtelé. Modèle avec empiècement bordé d’un volant,
petite ouverture dans le dos surmontée d’un bouton sur la nuque et découpes froncées
sur la jupe. ', '3','imgs/produits/fille/robes/roi0114139_1.jpeg', '1'),
       ('140','32', '11', '2','14', 'Robe en velours côtelé', 19.99, 'ROI0214140',
        'Robe en doux velours de coton côtelé. Modèle avec empiècement bordé d’un volant,
petite ouverture dans le dos surmontée d’un bouton sur la nuque et découpes froncées
sur la jupe. ', '3','imgs/produits/fille/robes/roi0114139_1.jpeg', '1'),
       ('141','32', '11',  '3','14', 'Robe en velours côtelé', 19.99, 'ROI0314141',
        'Robe en doux velours de coton côtelé. Modèle avec empiècement bordé d’un volant,
petite ouverture dans le dos surmontée d’un bouton sur la nuque et découpes froncées
sur la jupe. ', '3','imgs/produits/fille/robes/roi0114139_1.jpeg', '1'),
       ('142','32', '11', '1','3', 'Robe en velours côtelé', 19.99, 'ROI0103142',
        'Robe en doux velours de coton côtelé. Modèle avec empiècement bordé d’un volant,
petite ouverture dans le dos surmontée d’un bouton sur la nuque et découpes froncées
sur la jupe. ', '3','imgs/produits/fille/robes/roi0103142_1.jpeg', '1'),
       ('143','32', '11', '2','3', 'Robe en velours côtelé', 19.99, 'ROI0203143',
        'Robe en doux velours de coton côtelé. Modèle avec empiècement bordé d’un volant,
petite ouverture dans le dos surmontée d’un bouton sur la nuque et découpes froncées
sur la jupe. ', '3','imgs/produits/fille/robes/roi0103142_1.jpeg', '1'),
       ('144','32', '11', '3','3', 'Robe en velours côtelé', 19.99, 'ROI0303144',
        'Robe en doux velours de coton côtelé. Modèle avec empiècement bordé d’un volant,
petite ouverture dans le dos surmontée d’un bouton sur la nuque et découpes froncées
sur la jupe. ', '3','imgs/produits/fille/robes/roi0103142_1.jpeg', '1'),

       ('145','33', '11',  '1','9', 'Robe chemise en denim', 19.99, 'ROI0109145',
        'Robe en denim de bonne tenue. Modèle avec col, poches de poitrine et boutonnage
devant. Manches longues terminées par poignet boutonné. Empiècement avec pli creux dans
le dos. ', '3','imgs/produits/fille/robes/roi0109145_1.jpeg', '1'),
       ('146','33', '11', '2','9', 'Robe chemise en denim', 19.99, 'ROI0209146',
        'Robe en denim de bonne tenue. Modèle avec col, poches de poitrine et boutonnage
devant. Manches longues terminées par poignet boutonné. Empiècement avec pli creux dans
le dos. ', '3','imgs/produits/fille/robes/roi0109145_1.jpeg', '1'),
       ('147','33', '11', '3','9', 'Robe chemise en denim', 19.99, 'ROI0309147',
        'Robe en denim de bonne tenue. Modèle avec col, poches de poitrine et boutonnage
devant. Manches longues terminées par poignet boutonné. Empiècement avec pli creux dans
le dos. ', '3','imgs/produits/fille/robes/roi0109145_1.jpeg', '1'),


       ('148','34', '12',  '1','14', 'Jupe en velours côtelé', 12.99, 'JUI0114148',
        'Jupe corolle en velours de coton doux et côtelé. Modèle avec petit bord volanté
en haut, élastique habillé à la taille et découpe froncée à la base. Non doublée.', '3','imgs/produits/fille/jupes/jui0114148_1.jpeg', '1'),
       ('149','34', '12', '2','14', 'Jupe en velours côtelé', 12.99, 'JUI0214149',
        'Jupe corolle en velours de coton doux et côtelé. Modèle avec petit bord volanté
en haut, élastique habillé à la taille et découpe froncée à la base. Non doublée.', '3','imgs/produits/fille/jupes/jui0114148_1.jpeg', '1'),
       ('150','34', '12',  '3','14', 'Jupe en velours côtelé', 12.99, 'JUI0314150',
        'Jupe corolle en velours de coton doux et côtelé. Modèle avec petit bord volanté
en haut, élastique habillé à la taille et découpe froncée à la base. Non doublée.', '3','imgs/produits/fille/jupes/jui0114148_1.jpeg', '1'),
       ('151','34', '12', '1','3', 'Jupe en velours côtelé', 12.99, 'JUI0103151',
        'Jupe corolle en velours de coton doux et côtelé. Modèle avec petit bord volanté
en haut, élastique habillé à la taille et découpe froncée à la base. Non doublée.', '3','imgs/produits/fille/jupes/jui0103151_1.jpeg', '1'),
       ('152','34', '12', '2','3', 'Jupe en velours côtelé', 12.99, 'JUI0203152',
        'Jupe corolle en velours de coton doux et côtelé. Modèle avec petit bord volanté
en haut, élastique habillé à la taille et découpe froncée à la base. Non doublée.', '3','imgs/produits/fille/jupes/jui0103151_1.jpeg', '1'),
       ('153','34', '12',  '3','3', 'Jupe en velours côtelé', 12.99, 'JUI0303153',
        'Jupe corolle en velours de coton doux et côtelé. Modèle avec petit bord volanté
en haut, élastique habillé à la taille et découpe froncée à la base. Non doublée.', '3','imgs/produits/fille/jupes/jui0103151_1.jpeg', '1'),

       ('154','35', '12',  '1','2', 'Jupe plissée', 17.99, 'JUI0102154',
        'Jupe plissée en tissu vaporeux. Modèle avec élastique habillé à la
taille. Doublée.', '3','imgs/produits/fille/jupes/jui0102154_1.jpeg', '1'),
       ('155','35', '12', '2','2', 'Jupe plissée', 17.99, 'JUI0202155',
        'Jupe plissée en tissu vaporeux. Modèle avec élastique habillé à la
taille. Doublée.', '3','imgs/produits/fille/jupes/jui0102154_1.jpeg', '1'),
       ('156','35', '12',  '3','2', 'Jupe plissée', 17.99, 'JUI0302156',
        'Jupe plissée en tissu vaporeux. Modèle avec élastique habillé à la
taille. Doublée.', '3','imgs/produits/fille/jupes/jui0102154_1.jpeg', '1'),



       ('157','36', '13', '1','3', 'Chemise en flanelle', 14.99, 'CHG0103157',
        'Chemise en douce flanelle de coton. Modèle avec col, poche de poitrine et
boutonnage devant. Manches longues terminées par poignet boutonné. Empiècement
double épaisseur dans le dos. Base fortement arrondie.', '3','imgs/produits/garcon/chemises/chg0103157_1.jpeg', '1'),
       ('158','36', '13',  '2','3', 'Chemise en flanelle', 14.99, 'CHG0203158',
        'Chemise en douce flanelle de coton. Modèle avec col, poche de poitrine et
boutonnage devant. Manches longues terminées par poignet boutonné. Empiècement
double épaisseur dans le dos. Base fortement arrondie.', '3','imgs/produits/garcon/chemises/chg0103157_1.jpeg', '1'),
       ('159','36', '13', '3','3', 'Chemise en flanelle', 14.99, 'CHG0303159',
        'Chemise en douce flanelle de coton. Modèle avec col, poche de poitrine et
boutonnage devant. Manches longues terminées par poignet boutonné. Empiècement
double épaisseur dans le dos. Base fortement arrondie.', '3','imgs/produits/garcon/chemises/chg0103157_1.jpeg', '1'),
       ('160','36', '13', '1','5', 'Chemise en flanelle', 14.99, 'CHG0105160',
        'Chemise en douce flanelle de coton. Modèle avec col, poche de poitrine et
boutonnage devant. Manches longues terminées par poignet boutonné. Empiècement
double épaisseur dans le dos. Base fortement arrondie.', '3','imgs/produits/garcon/chemises/chg0105160_1.jpeg', '1'),
       ('161','36', '13',  '2','5', 'Chemise en flanelle', 14.99, 'CHG0205161',
        'Chemise en douce flanelle de coton. Modèle avec col, poche de poitrine et
boutonnage devant. Manches longues terminées par poignet boutonné. Empiècement
double épaisseur dans le dos. Base fortement arrondie.', '3','imgs/produits/garcon/chemises/chg0105160_1.jpeg', '1'),
       ('162','36', '13',  '3','5', 'Chemise en flanelle', 14.99, 'CHG0305162',
        'Chemise en douce flanelle de coton. Modèle avec col, poche de poitrine et
boutonnage devant. Manches longues terminées par poignet boutonné. Empiècement
double épaisseur dans le dos. Base fortement arrondie.', '3','imgs/produits/garcon/chemises/chg0105160_1.jpeg', '1'),

       ('163','37', '13',  '1','1', 'Chemise en coton', 9.99, 'CHG0101163',
        'Chemise en coton tissé. Modèle avec col rabattu et boutonnage devant.
Manches longues terminées par poignet boutonné.', '3','imgs/produits/garcon/chemises/chg0101163_1.jpeg', '1'),
       ('164','37', '13',  '2','1', 'Chemise en coton', 9.99, 'CHG0201164',
        'Chemise en coton tissé. Modèle avec col rabattu et boutonnage devant.
Manches longues terminées par poignet boutonné.', '3','imgs/produits/garcon/chemises/chg0101163_1.jpeg', '1'),
       ('165','37', '13',  '3','1', 'Chemise en coton', 9.99, 'CHG0301165',
        'Chemise en coton tissé. Modèle avec col rabattu et boutonnage devant.
Manches longues terminées par poignet boutonné.', '3','imgs/produits/garcon/chemises/chg0101163_1.jpeg', '1'),


       ('166','38', '14',  '1','2', 'Skinny Fit Jeans', 9.99, 'PAG0102166',
        'Jean en denim extensible lavé. Coupe étroite avec élastique réglable à la
taille, braguette zippée et bouton-pression. Poches devant et dans le dos.
Bas de jambe étroit.', '3','imgs/produits/garcon/pantalons/pag0102166_1.jpeg', '1'),
       ('167','38', '14', '2','2', 'Skinny Fit Jeans', 9.99, 'PAG0202167',
        'Jean en denim extensible lavé. Coupe étroite avec élastique réglable à la
taille, braguette zippée et bouton-pression. Poches devant et dans le dos.
Bas de jambe étroit.', '3','imgs/produits/garcon/pantalons/pag0102166_1.jpeg', '1'),
       ('168','38', '14', '3','2', 'Skinny Fit Jeans', 9.99, 'PAG0302168',
        'Jean en denim extensible lavé. Coupe étroite avec élastique réglable à la
taille, braguette zippée et bouton-pression. Poches devant et dans le dos.
Bas de jambe étroit.', '3','imgs/produits/garcon/pantalons/pag0102166_1.jpeg', '1'),
       ('169','38', '14', '1','4', 'Skinny Fit Jeans', 9.99, 'PAG0104169',
        'Jean en denim extensible lavé. Coupe étroite avec élastique réglable à la
taille, braguette zippée et bouton-pression. Poches devant et dans le dos.
Bas de jambe étroit.', '3','imgs/produits/garcon/pantalons/pag0104169_1.jpeg', '1'),
       ('170','38', '14',  '2','4', 'Skinny Fit Jeans', 9.99, 'PAG0204170',
        'Jean en denim extensible lavé. Coupe étroite avec élastique réglable à la
taille, braguette zippée et bouton-pression. Poches devant et dans le dos.
Bas de jambe étroit.', '3','imgs/produits/garcon/pantalons/pag0104169_1.jpeg', '1'),
       ('171','38', '14',  '3','4', 'Skinny Fit Jeans', 9.99, 'PAG0304171',
        'Jean en denim extensible lavé. Coupe étroite avec élastique réglable à la
taille, braguette zippée et bouton-pression. Poches devant et dans le dos.
Bas de jambe étroit.', '3','imgs/produits/garcon/pantalons/pag0104169_1.jpeg', '1'),

       ('172','39', '14', '1','5', 'Pantalon Slim Fit', 9.99, 'PAG0105172',
        'Pantalon en doux velours de coton finement côtelé. Coupe étroite avec
élastique réglable à la taille et braguette zippée surmontée d’un bouton-pression.
Poches devant et dans le dos.', '3','imgs/produits/garcon/pantalons/pag0105172_1.jpeg', '1'),
       ('173','39', '14', '2','5', 'Pantalon Slim Fit', 9.99, 'PAG0205173',
        'Pantalon en doux velours de coton finement côtelé. Coupe étroite avec
élastique réglable à la taille et braguette zippée surmontée d’un bouton-pression.
Poches devant et dans le dos.', '3','imgs/produits/garcon/pantalons/pag0105172_1.jpeg', '1'),
       ('174','39', '14', '3','5', 'Pantalon Slim Fit', 9.99, 'PAG0305174',
        'Pantalon en doux velours de coton finement côtelé. Coupe étroite avec
élastique réglable à la taille et braguette zippée surmontée d’un bouton-pression.
Poches devant et dans le dos.', '3','imgs/produits/garcon/pantalons/pag0105172_1.jpeg', '1');



    DROP TABLE IF EXISTS `imgs`;
CREATE TABLE imgs
(
    `id_imgs` SMALLINT AUTO_INCREMENT PRIMARY KEY,
    `produit_id` SMALLINT NOT NULL,
    `produit_modele` SMALLINT NOT NULL,
    `couleur_id` SMALLINT NOT NULL ,
    `fichier_prod_img` VARCHAR(255),
    `fichier_prodCouleur_img` VARCHAR(255),
    `statut_img` TINYINT(1),

    KEY `fk_produitId` (`produit_id`),
    KEY `fk_couleurImgId` (`couleur_id`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `imgs`(`id_imgs`,  `produit_id`,`produit_modele`,  `couleur_id`, `fichier_prod_img`, `fichier_prodCouleur_img`, `statut_img`)
VALUES('1', '1','1', '2', 'imgs/produits/nouveautes/imgnouv/chf010201_1.jpeg', '', '1'),
      ('2', '1','1', '2', 'imgs/produits/nouveautes/imgnouv/chf010201_2.jpeg', '', '0'),
      ('3', '1','1', '2', 'imgs/produits/nouveautes/imgnouv/chf010201_3.jpeg', '', '0'),
      ('4', '1','1', '2', 'imgs/produits/nouveautes/imgnouv/chf010201_4.jpeg', '', '0'),

      ('5', '4','2', '1', 'imgs/produits/nouveautes/imgnouv/chf010104_1.jpeg', '', '1'),
      ('6', '4','2', '1', 'imgs/produits/nouveautes/imgnouv/chf010104_2.jpeg', '', '0'),
      ('7', '4','2', '1', 'imgs/produits/nouveautes/imgnouv/chf010104_3.jpeg', '', '0'),
      ('8', '4','2', '1', 'imgs/produits/nouveautes/imgnouv/chf010104_4.jpeg', '', '0'),

      ('9', '7',  '3',  '4', 'imgs/produits/nouveautes/imgnouv/rof010407_1.jpeg', '', '1'),
      ('10', '7', '3','4', 'imgs/produits/nouveautes/imgnouv/rof010407_2.jpeg', '', '0'),
      ('11', '7', '3','4', 'imgs/produits/nouveautes/imgnouv/rof010407_3.jpeg', '', '0'),
      ('12', '7', '3','4', 'imgs/produits/nouveautes/imgnouv/rof010407_4.jpeg', '', '0'),
      ('13', '10','3', '7', 'imgs/produits/nouveautes/imgnouv/rof010710_1.jpeg', '', '0'),
      ('14', '10','3', '7', 'imgs/produits/nouveautes/imgnouv/rof010710_2.jpeg', '', '0'),
      ('15', '10','3', '7', 'imgs/produits/nouveautes/imgnouv/rof010710_3.jpeg', '', '0'),
      ('16', '10','3', '7', 'imgs/produits/nouveautes/imgnouv/rof010710_4.jpeg', '', '0'),

      ('17', '13','4', '5', 'imgs/produits/nouveautes/imgnouv/pah010513_1.jpeg', '', '1'),
      ('18', '13','4', '5', 'imgs/produits/nouveautes/imgnouv/pah010513_2.jpeg', '', '0'),
      ('19', '13','4', '5', 'imgs/produits/nouveautes/imgnouv/pah010513_3.jpeg', '', '0'),
      ('20', '13','4', '5', 'imgs/produits/nouveautes/imgnouv/pah010513_4.jpeg', '', '0'),

      ('21', '16','5', '3', 'imgs/produits/nouveautes/imgnouv/chh010316_1.jpeg', '', '1'),
      ('22', '16','5', '3', 'imgs/produits/nouveautes/imgnouv/chh010316_2.jpeg', '', '0'),
      ('23', '16','5', '3', 'imgs/produits/nouveautes/imgnouv/chh010316_3.jpeg', '', '0'),
      ('24', '16','5', '3', 'imgs/produits/nouveautes/imgnouv/chh010316_4.jpeg', '', '0'),
      ('25', '19','5', '8', 'imgs/produits/nouveautes/imgnouv/chh010819_1.jpeg', '', '1'),
      ('26', '19','5', '8', 'imgs/produits/nouveautes/imgnouv/chh010819_2.jpeg', '', '0'),
      ('27', '19','5', '8', 'imgs/produits/nouveautes/imgnouv/chh010819_3.jpeg', '', '0'),
      ('28', '19','5', '8', 'imgs/produits/nouveautes/imgnouv/chh010819_4.jpeg', '', '0'),

      ('29', '22','6', '6', 'imgs/produits/nouveautes/imgnouv/paf010622_1.jpeg', '', '1'),
      ('30', '22','6', '6', 'imgs/produits/nouveautes/imgnouv/paf010622_2.jpeg', '', '0'),
      ('31', '22','6', '6', 'imgs/produits/nouveautes/imgnouv/paf010622_3.jpeg', '', '0'),
      ('32', '22','6', '6', 'imgs/produits/nouveautes/imgnouv/paf010622_4.jpeg', '', '0'),

      ('33', '25','7', '9', 'imgs/produits/femme/chemises/chf010925_1.jpeg', '', '1'),
      ('34', '25','7', '9', 'imgs/produits/femme/chemises/chf010925_2.jpeg', '', '0'),
      ('35', '25','7', '9', 'imgs/produits/femme/chemises/chf010925_3.jpeg', '', '0'),
      ('36', '25','7', '9', 'imgs/produits/femme/chemises/chf010925_4.jpeg', '', '0'),
      ('37', '28','7', '10','imgs/produits/femme/chemises/chf011028_1.jpeg', '', '0'),
      ('38', '28','7', '10','imgs/produits/femme/chemises/chf011028_2.jpeg', '', '0'),
      ('39', '28','7', '10','imgs/produits/femme/chemises/chf011028_3.jpeg', '', '0'),
      ('40', '28','7', '10','imgs/produits/femme/chemises/chf011028_4.jpeg', '', '0'),

      ('41', '31','8', '3','imgs/produits/femme/chemises/chf010331_1.jpeg', '', '1'),
      ('42', '31','8', '3','imgs/produits/femme/chemises/chf010331_2.jpeg', '', '0'),
      ('43', '31','8', '3','imgs/produits/femme/chemises/chf010331_3.jpeg', '', '0'),
      ('44', '31','8', '3','imgs/produits/femme/chemises/chf010331_4.jpeg', '', '0'),

      ('45', '34','9', '1','imgs/produits/femme/chemises/chf010134_1.jpeg', '', '1'),
      ('46', '34','9', '1','imgs/produits/femme/chemises/chf010134_2.jpeg', '', '0'),
      ('47', '34','9', '1','imgs/produits/femme/chemises/chf010134_3.jpeg', '', '0'),
      ('48', '34','9', '1','imgs/produits/femme/chemises/chf010134_4.jpeg', '', '0'),

      ('49', '37','10', '9','imgs/produits/femme/chemises/chf010937_1.jpeg', '', '1'),
      ('50', '37','10', '9','imgs/produits/femme/chemises/chf010937_2.jpeg', '', '0'),
      ('51', '37','10', '9','imgs/produits/femme/chemises/chf010937_3.jpeg', '', '0'),
      ('52', '37','10', '9','imgs/produits/femme/chemises/chf010937_4.jpeg', '', '0'),


      ('53', '40','11', '11','imgs/produits/femme/pantalons/paf011140_1.jpeg', '', '1'),
      ('54', '40','11', '11','imgs/produits/femme/pantalons/paf011140_2.jpeg', '', '0'),
      ('55', '40','11', '11','imgs/produits/femme/pantalons/paf011140_3.jpeg', '', '0'),
      ('56', '40','11', '11','imgs/produits/femme/pantalons/paf011140_4.jpeg', '', '0'),
      ('57', '43','11', '2','imgs/produits/femme/pantalons/paf010243_1.jpeg', '', '0'),
      ('58', '43','11', '2','imgs/produits/femme/pantalons/paf010243_2.jpeg', '', '0'),
      ('59', '43','11', '2','imgs/produits/femme/pantalons/paf010243_3.jpeg', '', '0'),
      ('60', '43','11', '2','imgs/produits/femme/pantalons/paf010243_4.jpeg', '', '0'),

      ('61', '46','12', '5','imgs/produits/femme/pantalons/paf010546_1.jpeg', '', '1'),
      ('62', '46','12', '5','imgs/produits/femme/pantalons/paf010546_2.jpeg', '', '0'),
      ('63', '46','12', '5','imgs/produits/femme/pantalons/paf010546_3.jpeg', '', '0'),
      ('64', '46','12', '5','imgs/produits/femme/pantalons/paf010546_4.jpeg', '', '0'),

      ('65', '49','13', '12','imgs/produits/femme/pantalons/paf011249_1.jpeg', '', '1'),
      ('66', '49','13', '12','imgs/produits/femme/pantalons/paf011249_2.jpeg', '', '0'),
      ('67', '49','13', '12','imgs/produits/femme/pantalons/paf011249_3.jpeg', '', '0'),
      ('68', '49','13', '12','imgs/produits/femme/pantalons/paf011249_4.jpeg', '', '0'),

      ('69', '52','14', '12','imgs/produits/femme/pantalons/paf011252_1.jpeg', '', '1'),
      ('70', '52','14', '12','imgs/produits/femme/pantalons/paf011252_2.jpeg', '', '0'),
      ('71', '52','14', '12','imgs/produits/femme/pantalons/paf011252_3.jpeg', '', '0'),
      ('72', '52','14', '12','imgs/produits/femme/pantalons/paf011252_4.jpeg', '', '0'),

      ('73', '55','15', '2','imgs/produits/femme/robes/rof010255_1.jpeg', '', '1'),
      ('74', '55','15', '2','imgs/produits/femme/robes/rof010255_2.jpeg', '', '0'),
      ('75', '55','15', '2','imgs/produits/femme/robes/rof010255_3.jpeg', '', '0'),
      ('76', '55','15', '2','imgs/produits/femme/robes/rof010255_4.jpeg', '', '0'),
      ('77', '58','15', '12','imgs/produits/femme/robes/rof011258_1.jpeg', '', '0'),
      ('78', '58','15', '12','imgs/produits/femme/robes/rof011258_2.jpeg', '', '0'),
      ('79', '58','15', '12','imgs/produits/femme/robes/rof011258_3.jpeg', '', '0'),
      ('80', '58','15', '12','imgs/produits/femme/robes/rof011258_4.jpeg', '', '0'),

      ('81', '61','16', '1','imgs/produits/femme/robes/rof010161_1.jpeg', '', '1'),
      ('82', '61','16', '1','imgs/produits/femme/robes/rof010161_2.jpeg', '', '0'),
      ('83', '61','16', '1','imgs/produits/femme/robes/rof010161_3.jpeg', '', '0'),
      ('84', '61','16', '1','imgs/produits/femme/robes/rof010161_4.jpeg', '', '0'),

      ('85', '64','17', '2','imgs/produits/femme/robes/rof010264_1.jpeg', '', '1'),
      ('86', '64','17', '2','imgs/produits/femme/robes/rof010264_2.jpeg', '', '0'),
      ('87', '64','17', '2','imgs/produits/femme/robes/rof010264_3.jpeg', '', '0'),
      ('88', '64','17', '2','imgs/produits/femme/robes/rof010264_4.jpeg', '', '0'),


      ('89', '67','18', '2','imgs/produits/femme/jupes/juf010267_1.jpeg', '', '1'),
      ('90', '67','18', '2','imgs/produits/femme/jupes/juf010267_2.jpeg', '', '0'),
      ('91', '70','18', '9','imgs/produits/femme/jupes/juf010970_1.jpeg', '', '0'),
      ('92', '70','18', '9','imgs/produits/femme/jupes/juf010970_2.jpeg', '', '0'),

      ('93', '73','19', '2','imgs/produits/femme/jupes/juf010273_1.jpeg', '', '1'),
      ('94', '73','19', '2','imgs/produits/femme/jupes/juf010273_2.jpeg', '', '0'),
      ('95', '73','19', '2','imgs/produits/femme/jupes/juf010273_3.jpeg', '', '0'),
      ('96', '73','19', '2','imgs/produits/femme/jupes/juf010273_4.jpeg', '', '0'),

      ('97', '76','20', '4','imgs/produits/femme/jupes/juf010476_1.jpeg', '', '1'),
      ('98', '76','20', '4','imgs/produits/femme/jupes/juf010476_2.jpeg', '', '0'),
      ('99', '76','20', '4','imgs/produits/femme/jupes/juf010476_3.jpeg', '', '0'),
      ('100','76','20', '4','imgs/produits/femme/jupes/juf010476_4.jpeg', '', '0'),


      ('101', '79','21', '12','imgs/produits/femme/chaussures/caf041279_1.jpeg', '', '1'),
      ('102', '79','21', '12','imgs/produits/femme/chaussures/caf041279_2.jpeg', '', '0'),
      ('103', '79','21', '12','imgs/produits/femme/chaussures/caf041279_3.jpeg', '', '0'),
      ('104', '79','21', '12','imgs/produits/femme/chaussures/caf041279_4.jpeg', '', '0'),


      ('105', '92','22',  '2','imgs/produits/homme/chemises/chh010292_1.jpeg', '', '1'),
      ('106', '92','22',  '2','imgs/produits/homme/chemises/chh010292_2.jpeg', '', '0'),
      ('107', '92','22',  '2','imgs/produits/homme/chemises/chh010292_3.jpeg', '', '0'),
      ('108', '92','22',  '2','imgs/produits/homme/chemises/chh010292_4.jpeg', '', '0'),
      ('109', '95','22',  '7','imgs/produits/homme/chemises/chh010795_1.jpeg', '', '0'),
      ('110', '95','22',  '7','imgs/produits/homme/chemises/chh010795_2.jpeg', '', '0'),
      ('111', '95','22',  '7','imgs/produits/homme/chemises/chh010795_3.jpeg', '', '0'),
      ('112', '95','22',  '7','imgs/produits/homme/chemises/chh010795_4.jpeg', '', '0'),

      ('113', '98','23', '1','imgs/produits/homme/chemises/chh010198_1.jpeg', '', '1'),
      ('114', '98','23', '1','imgs/produits/homme/chemises/chh010198_2.jpeg', '', '0'),
      ('115', '98','23', '1','imgs/produits/homme/chemises/chh010198_3.jpeg', '', '0'),
      ('116', '98','23', '1','imgs/produits/homme/chemises/chh010198_4.jpeg', '', '0'),

      ('117', '101','24', '5','imgs/produits/homme/chemises/chh0105101_1.jpeg', '', '1'),
      ('118', '101','24', '5','imgs/produits/homme/chemises/chh0105101_2.jpeg', '', '0'),
      ('119', '101','24', '5','imgs/produits/homme/chemises/chh0105101_3.jpeg', '', '0'),
      ('120', '101','24', '5','imgs/produits/homme/chemises/chh0105101_4.jpeg', '', '0'),

      ('121', '104','25', '2','imgs/produits/homme/pantalons/pah0102104_1.jpeg', '', '1'),
      ('122', '104','25', '2','imgs/produits/homme/pantalons/pah0102104_2.jpeg', '', '0'),
      ('123', '104','25', '2','imgs/produits/homme/pantalons/pah0102104_3.jpeg', '', '0'),
      ('124', '104','25', '2','imgs/produits/homme/pantalons/pah0102104_4.jpeg', '', '0'),
      ('125', '107','25', '4','imgs/produits/homme/pantalons/pah0104107_1.jpeg', '', '0'),
      ('126', '107','25', '4','imgs/produits/homme/pantalons/pah0104107_2.jpeg', '', '0'),
      ('127', '107','25', '4','imgs/produits/homme/pantalons/pah0104107_3.jpeg', '', '0'),
      ('128', '107','25', '4','imgs/produits/homme/pantalons/pah0104107_4.jpeg', '', '0'),

      ('129', '110','26', '7','imgs/produits/homme/pantalons/pah0107110_1.jpeg', '', '1'),
      ('130', '110','26', '7','imgs/produits/homme/pantalons/pah0107110_2.jpeg', '', '0'),
      ('131', '110','26', '7','imgs/produits/homme/pantalons/pah0107110_3.jpeg', '', '0'),
      ('132', '110','26', '7','imgs/produits/homme/pantalons/pah0107110_4.jpeg', '', '0'),


      ('133', '113','27', '1','imgs/produits/homme/chaussures/cah0901113_1.jpeg', '', '1'),
      ('134', '113','27', '1','imgs/produits/homme/chaussures/cah0901113_2.jpeg', '', '0'),
      ('135', '113','27', '1','imgs/produits/homme/chaussures/cah0901113_3.jpeg', '', '0'),
      ('136', '113','27', '1','imgs/produits/homme/chaussures/cah0901113_4.jpeg', '', '0'),


      ('137', '121', '28','1','imgs/produits/fille/chemises/chi0101121_1.jpeg', '', '1'),
      ('138', '121', '28','1','imgs/produits/fille/chemises/chi0101121_2.jpeg', '', '0'),
      ('139', '121', '28','1','imgs/produits/fille/chemises/chi0101121_3.jpeg', '', '0'),
      ('140', '121', '28','1','imgs/produits/fille/chemises/chi0101121_4.jpeg', '', '0'),
      ('141', '124', '28','13','imgs/produits/fille/chemises/chi0113124_1.jpeg', '', '0'),
      ('142', '124', '28','13','imgs/produits/fille/chemises/chi0113124_2.jpeg', '', '0'),
      ('143', '124', '28','13','imgs/produits/fille/chemises/chi0113124_3.jpeg', '', '0'),

      ('144', '127','29', '1','imgs/produits/fille/chemises/chi0101127_1.jpeg', '', '1'),
      ('145', '127','29', '1','imgs/produits/fille/chemises/chi0101127_2.jpeg', '', '0'),
      ('146', '127','29', '1','imgs/produits/fille/chemises/chi0101127_3.jpeg', '', '0'),
      ('147', '127','29', '1','imgs/produits/fille/chemises/chi0101127_4.jpeg', '', '0'),

      ('148', '130','30', '10','imgs/produits/fille/pantalons/pai0110130_1.jpeg', '', '1'),
      ('149', '130','30', '10','imgs/produits/fille/pantalons/pai0110130_2.jpeg', '', '0'),
      ('150', '130','30', '10','imgs/produits/fille/pantalons/pai0110130_3.jpeg', '', '0'),
      ('151', '133','30', '4','imgs/produits/fille/pantalons/pai0104133_1.jpeg', '', '0'),
      ('152', '133','30', '4','imgs/produits/fille/pantalons/pai0104133_2.jpeg', '', '0'),
      ('153', '133','30', '4','imgs/produits/fille/pantalons/pai0104133_3.jpeg', '', '0'),

      ('154', '136','31', '3','imgs/produits/fille/pantalons/pai0103136_1.jpeg', '', '1'),
      ('155', '136','31', '3','imgs/produits/fille/pantalons/pai0103136_2.jpeg', '', '0'),
      ('156', '136','31', '3','imgs/produits/fille/pantalons/pai0103136_3.jpeg', '', '0'),


      ('157', '139','32', '14','imgs/produits/fille/robes/roi0114139_1.jpeg', '', '1'),
      ('158', '139','32', '14','imgs/produits/fille/robes/roi0114139_2.jpeg', '', '0'),
      ('159', '139','32', '14','imgs/produits/fille/robes/roi0114139_3.jpeg', '', '0'),
      ('160', '139','32', '14','imgs/produits/fille/robes/roi0114139_4.jpeg', '', '0'),
      ('161', '142','32', '3','imgs/produits/fille/robes/roi0103142_1.jpeg', '', '0'),
      ('162', '142','32', '3','imgs/produits/fille/robes/roi0103142_2.jpeg', '', '0'),

      ('163', '145','33','9','imgs/produits/fille/robes/roi0109145_1.jpeg', '', '1'),
      ('164', '145','33','9','imgs/produits/fille/robes/roi0109145_2.jpeg', '', '0'),
      ('165', '145','33','9','imgs/produits/fille/robes/roi0109145_3.jpeg', '', '0'),

      ('166', '148','34', '14','imgs/produits/fille/jupes/jui0114148_1.jpeg', '', '1'),
      ('167', '148','34', '14','imgs/produits/fille/jupes/jui0114148_2.jpeg', '', '0'),
      ('168', '148','34', '14','imgs/produits/fille/jupes/jui0114148_3.jpeg', '', '0'),
      ('169', '151','34', '3','imgs/produits/fille/jupes/jui0103151_1.jpeg', '', '0'),
      ('170', '151','34', '3','imgs/produits/fille/jupes/jui0103151_2.jpeg', '', '0'),
      ('171', '151','34', '3','imgs/produits/fille/jupes/jui0103151_3.jpeg', '', '0'),

      ('172', '154','35', '2','imgs/produits/fille/jupes/jui0102154_1.jpeg', '', '1'),
      ('173', '154','35', '2','imgs/produits/fille/jupes/jui0102154_2.jpeg', '', '0'),
      ('174', '154','35', '2','imgs/produits/fille/jupes/jui0102154_3.jpeg', '', '0'),
      ('175', '154','35', '2','imgs/produits/fille/jupes/jui0102154_4.jpeg', '', '0'),


      ('176', '157','36', '3','imgs/produits/garcon/chemises/chg0103157_1.jpeg', '', '1'),
      ('177', '157','36', '3','imgs/produits/garcon/chemises/chg0103157_2.jpeg', '', '0'),
      ('178', '157','36', '3','imgs/produits/garcon/chemises/chg0103157_3.jpeg', '', '0'),
      ('179', '160','36', '5','imgs/produits/garcon/chemises/chg0105160_1.jpeg', '', '0'),
      ('180', '160','36', '5','imgs/produits/garcon/chemises/chg0105160_2.jpeg', '', '0'),
      ('181', '160','36', '5','imgs/produits/garcon/chemises/chg0105160_3.jpeg', '', '0'),

      ('182', '163','37', '1','imgs/produits/garcon/chemises/chg0101163_1.jpeg', '', '1'),
      ('183', '163','37', '1','imgs/produits/garcon/chemises/chg0101163_2.jpeg', '', '0'),
      ('184', '163','37', '1','imgs/produits/garcon/chemises/chg0101163_3.jpeg', '', '0'),


      ('185', '166','38', '2','imgs/produits/garcon/pantalons/pag0102166_1.jpeg', '', '1'),
      ('186', '166','38', '2','imgs/produits/garcon/pantalons/pag0102166_2.jpeg', '', '0'),
      ('187', '166','38', '2','imgs/produits/garcon/pantalons/pag0102166_3.jpeg', '', '0'),
      ('188', '169','38', '4','imgs/produits/garcon/pantalons/pag0104169_1.jpeg', '', '0'),
      ('189', '169','38', '4','imgs/produits/garcon/pantalons/pag0104169_2.jpeg', '', '0'),
      ('190', '169','38', '4','imgs/produits/garcon/pantalons/pag0104169_3.jpeg', '', '0'),

      ('191', '172','39', '5','imgs/produits/garcon/pantalons/pag0105172_1.jpeg', '', '0'),
      ('192', '172','39', '5','imgs/produits/garcon/pantalons/pag0105172_2.jpeg', '', '0'),
      ('193', '172','39', '5','imgs/produits/garcon/pantalons/pag0105172_3.jpeg', '', '0');


DROP TABLE IF EXISTS `commandes`;
CREATE TABLE commandes
(
    `id_commande` SMALLINT AUTO_INCREMENT PRIMARY KEY,
    `commande_photo_produit` VARCHAR(255),
    `commande_nom_produit` VARCHAR(255) ,
    `commande_ref_produit` VARCHAR(255),
    `commande_qtite_produit` SMALLINT,
    `commande_prix_produit` FLOAT,
    `commande_id_commande` VARCHAR(255),
    `commande_utilisateur_id` SMALLINT,
    `commande_transaction` SMALLINT

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `panier`;
CREATE TABLE panier
(
    `id_panier` SMALLINT AUTO_INCREMENT PRIMARY KEY,
    `panier_photo_produit` VARCHAR(255),
    `panier_nom_produit` VARCHAR(255) ,
    `panier_ref_produit` VARCHAR(255),
    `panier_qtite_produit` SMALLINT,
    `panier_prix_produit` FLOAT,
    `panier_id_commande` VARCHAR(255),
    `panier_utilisateur_id` VARCHAR(255),
    `panier_transaction` SMALLINT

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
















-- CLES ETRANGERES

ALTER TABLE `categorie_produit`
    ADD CONSTRAINT `fk_categoriePersonneId` FOREIGN KEY (`cat_personne_id`) REFERENCES `categorie_personne` (`id_cat_personne`);

ALTER TABLE `imgs`
    ADD CONSTRAINT `fk_produitId` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id_produit`);
ALTER TABLE `imgs`
    ADD CONSTRAINT `fk_couleurImgId` FOREIGN KEY (`couleur_id`) REFERENCES `couleurs` (`id_couleur`);


ALTER TABLE `produits`
    ADD CONSTRAINT `fk_categorieProduitId`  FOREIGN KEY (`cat_produit_id`) REFERENCES `categorie_produit` (`id_cat_produit`);


ALTER TABLE `produits`
    ADD CONSTRAINT `fk_tailleId`  FOREIGN KEY (`taille_id`) REFERENCES `tailles` (`id_taille`);

ALTER TABLE `produits`
    ADD CONSTRAINT `fk_couleurId`  FOREIGN KEY (`couleur_id`) REFERENCES `couleurs` (`id_couleur`);
