-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 06 mars 2021 à 15:29
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e-commerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `motDePasse` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id_admin`, `photo`, `prenom`, `nom`, `email`, `username`, `motDePasse`, `role`) VALUES
(1, NULL, 'Jean', 'Pi', 'jp@gmail.com', 'jean.pi', '$2y$10$CdpyodDU/0sWUP/mzYswe.d49AdqMv4B5Bq2n33ScHyu4tw/c82ku', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_nouveautes`
--

DROP TABLE IF EXISTS `categorie_nouveautes`;
CREATE TABLE IF NOT EXISTS `categorie_nouveautes` (
  `id_cat_nouveaute` smallint(6) NOT NULL AUTO_INCREMENT,
  `libelle_cat_nouveaute` varchar(40) NOT NULL,
  `statut_cat_nouveaute` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_cat_nouveaute`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie_nouveautes`
--

INSERT INTO `categorie_nouveautes` (`id_cat_nouveaute`, `libelle_cat_nouveaute`, `statut_cat_nouveaute`) VALUES
(1, 'Automne-Hiver 2020', 1);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_personne`
--

DROP TABLE IF EXISTS `categorie_personne`;
CREATE TABLE IF NOT EXISTS `categorie_personne` (
  `id_cat_personne` smallint(6) NOT NULL AUTO_INCREMENT,
  `nom_cat_personne` varchar(255) NOT NULL,
  `image_cat_personne01` varchar(255) DEFAULT NULL,
  `image_cat_personne02` varchar(255) DEFAULT NULL,
  `statut_cat_personne` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_cat_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie_personne`
--

INSERT INTO `categorie_personne` (`id_cat_personne`, `nom_cat_personne`, `image_cat_personne01`, `image_cat_personne02`, `statut_cat_personne`) VALUES
(1, 'Femme', 'imgs/catPer/femme01.jpg', 'imgs/catPer/femme02.jpeg', 1),
(2, 'Homme', 'imgs/catPer/homme01.jpg', 'imgs/catPer/homme02.jpeg', 1),
(3, 'Fille', 'imgs/catPer/fille01.jpg', 'imgs/catPer/fille02.jpg', 1),
(4, 'Garçon', 'imgs/catPer/garcon01.jpg', 'imgs/catPer/garcon02.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_produit`
--

DROP TABLE IF EXISTS `categorie_produit`;
CREATE TABLE IF NOT EXISTS `categorie_produit` (
  `id_cat_produit` smallint(6) NOT NULL AUTO_INCREMENT,
  `cat_personne_id` smallint(6) NOT NULL,
  `nom_cat_produit` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `statut_cat_produit` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_cat_produit`),
  KEY `fk_categoriePersonneId` (`cat_personne_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie_produit`
--

INSERT INTO `categorie_produit` (`id_cat_produit`, `cat_personne_id`, `nom_cat_produit`, `image`, `statut_cat_produit`) VALUES
(1, 1, 'chemise', 'imgs/catProd/femme/chf010134_1.jpeg', 1),
(2, 1, 'pantalon', 'imgs/catProd/femme/paf010243_1.jpeg', 1),
(3, 1, 'robe', 'imgs/catProd/femme/rof010161_1.jpeg', 1),
(4, 1, 'jupe', 'imgs/catProd/femme/juf010267_1.jpeg', 1),
(5, 1, 'chaussures', 'imgs/catProd/femme/caf041279_1.jpeg', 1),
(6, 2, 'chemise', 'imgs/catProd/homme/chh010198_1.jpeg', 1),
(7, 2, 'pantalon', 'imgs/catProd/homme/pah0102104_1.jpeg', 1),
(8, 2, 'chaussures', 'imgs/catProd/homme/cah0901113_1.jpeg', 1),
(9, 3, 'chemise', 'imgs/catProd/fille/chi0101121_1.jpeg', 1),
(10, 3, 'pantalon', 'imgs/catProd/fille/pai0110130_1.jpeg', 1),
(11, 3, 'robe', 'imgs/catProd/fille/roi0114139_1.jpeg', 1),
(12, 3, 'jupe', 'imgs/catProd/fille/jui0114148_1.jpeg', 1),
(13, 4, 'chemise', 'imgs/catProd/garcon/chg0103157_1.jpeg', 1),
(14, 4, 'pantalon', 'imgs/catProd/garcon/pag0102166_1.jpeg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_soldes`
--

DROP TABLE IF EXISTS `categorie_soldes`;
CREATE TABLE IF NOT EXISTS `categorie_soldes` (
  `id_cat_soldes` smallint(6) NOT NULL AUTO_INCREMENT,
  `libelle_cat_soldes` varchar(40) NOT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `statut_cat_soldes` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_cat_soldes`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie_soldes`
--

INSERT INTO `categorie_soldes` (`id_cat_soldes`, `libelle_cat_soldes`, `dateDebut`, `dateFin`, `statut_cat_soldes`) VALUES
(1, 'Soldes d\'été', '2020-07-15', '2020-08-11', 1);

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `id_commande` smallint(6) NOT NULL AUTO_INCREMENT,
  `commande_photo_produit` varchar(255) DEFAULT NULL,
  `commande_nom_produit` varchar(255) DEFAULT NULL,
  `commande_ref_produit` varchar(255) DEFAULT NULL,
  `commande_qtite_produit` smallint(6) DEFAULT NULL,
  `commande_prix_produit` float DEFAULT NULL,
  `commande_prix_ligne` float DEFAULT NULL,
  `commande_prix_total` float DEFAULT NULL,
  `commande_id_commande` varchar(255) DEFAULT NULL,
  `commande_utilisateur_id` varchar(255) DEFAULT NULL,
  `commande_transaction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id_commande`, `commande_photo_produit`, `commande_nom_produit`, `commande_ref_produit`, `commande_qtite_produit`, `commande_prix_produit`, `commande_prix_ligne`, `commande_prix_total`, `commande_id_commande`, `commande_utilisateur_id`, `commande_transaction`) VALUES
(1, 'imgs/produits/nouveautes/imgnouv/paf010622_1.jpeg', 'Pantalon jogger', 'ref0102-0106-06', 1, 14.99, 14.99, 124.93, '5c87mbai8g11qtmouhfg0elu0o', '2', '703862'),
(2, 'imgs/produits/homme/chaussures/cah0901113_1.jpeg', 'Baskets', 'ref0208-1001-27', 2, 24.99, 49.98, 124.93, '5c87mbai8g11qtmouhfg0elu0o', '2', '703862'),
(3, 'imgs/produits/garcon/chemises/chg0105160_1.jpeg', 'Chemise en flanelle', 'ref0413-0305-36', 4, 14.99, 59.96, 124.93, '5c87mbai8g11qtmouhfg0elu0o', '2', '703862'),
(4, 'imgs/produits/nouveautes/imgnouv/chf010201_1.jpeg', 'Chemise en velours', 'ref0101-0302-01', 3, 19.99, 59.97, 89.96, '5c87mbai8g11qtmouhfg0elu0o', '2', '097114'),
(5, 'imgs/produits/femme/robes/rof010264_1.jpeg', 'Robe à col volanté', 'ref0103-0202-17', 1, 29.99, 29.99, 89.96, '5c87mbai8g11qtmouhfg0elu0o', '2', '097114'),
(32, 'imgs/produits/nouveautes/imgnouv/chf010201_1.jpeg', 'Chemise en velours', 'ref0101-0102-01', 1, 19.99, 19.99, 29.99, '151nftkg29bk3461olhpoimgjf', '2', '360320'),
(33, 'imgs/produits/nouveautes/imgnouv/paf010622_1.jpeg', 'Pantalon jogger', 'ref0102-0106-06', 2, 14.99, 29.98, 59.97, '151nftkg29bk3461olhpoimgjf', '2', '807793'),
(34, 'imgs/produits/femme/jupes/juf010476_1.jpeg', 'Jupe courte', 'ref0104-0304-20', 1, 19.99, 19.99, 59.97, '151nftkg29bk3461olhpoimgjf', '2', '807793'),
(35, 'imgs/produits/femme/chemises/chf010937_1.jpeg', 'Chemise en jean', 'ref0101-0109-10', 1, 24.99, 24.99, 34.99, '151nftkg29bk3461olhpoimgjf', '2', '406619'),
(36, 'imgs/produits/nouveautes/imgnouv/rof010710_1.jpeg', 'Robe avec broderie anglaise', 'ref0103-0107-03', 1, 69.99, 69.99, 159.96, '151nftkg29bk3461olhpoimgjf', '2', '904933'),
(37, 'imgs/produits/femme/robes/rof010264_1.jpeg', 'Robe à col volanté', 'ref0103-0202-17', 3, 29.99, 89.97, 159.96, '151nftkg29bk3461olhpoimgjf', '2', '904933');

-- --------------------------------------------------------

--
-- Structure de la table `couleurs`
--

DROP TABLE IF EXISTS `couleurs`;
CREATE TABLE IF NOT EXISTS `couleurs` (
  `id_couleur` smallint(6) NOT NULL AUTO_INCREMENT,
  `codeHexa` varchar(40) NOT NULL,
  `nom_couleur` varchar(40) NOT NULL,
  `statut_couleur` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_couleur`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `couleurs`
--

INSERT INTO `couleurs` (`id_couleur`, `codeHexa`, `nom_couleur`, `statut_couleur`) VALUES
(1, '#FFFFFF', 'blanc', 1),
(2, '#000000', 'noir', 1),
(3, '#ff0000', 'rouge', 1),
(4, '#A6A4A4', 'gris', 1),
(5, '#0205BF', 'bleu', 1),
(6, '#7034FA', 'mauve', 1),
(7, '#bf5600', 'beige foncé', 1),
(8, '#2b5700', 'vert', 1),
(9, '#66b3ff', 'bleu clair', 1),
(10, '#0012b8', 'bleu foncé', 1),
(11, '#2b2b2b', 'gris foncé', 1),
(12, '#fcf9de', 'beige clair', 1),
(13, '#fce300', 'jaune', 1),
(14, '#004a06', 'vert foncé', 1);

-- --------------------------------------------------------

--
-- Structure de la table `imgs`
--

DROP TABLE IF EXISTS `imgs`;
CREATE TABLE IF NOT EXISTS `imgs` (
  `id_imgs` smallint(6) NOT NULL AUTO_INCREMENT,
  `produit_id` smallint(6) NOT NULL,
  `produit_modele` smallint(6) NOT NULL,
  `couleur_id` smallint(6) NOT NULL,
  `fichier_prod_img` varchar(255) DEFAULT NULL,
  `fichier_prodCouleur_img` varchar(255) DEFAULT NULL,
  `statut_img` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_imgs`),
  KEY `fk_produitId` (`produit_id`),
  KEY `fk_couleurImgId` (`couleur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `imgs`
--

INSERT INTO `imgs` (`id_imgs`, `produit_id`, `produit_modele`, `couleur_id`, `fichier_prod_img`, `fichier_prodCouleur_img`, `statut_img`) VALUES
(1, 1, 1, 2, 'imgs/produits/nouveautes/imgnouv/chf010201_1.jpeg', '', 1),
(2, 1, 1, 2, 'imgs/produits/nouveautes/imgnouv/chf010201_2.jpeg', '', 0),
(3, 1, 1, 2, 'imgs/produits/nouveautes/imgnouv/chf010201_3.jpeg', '', 0),
(4, 1, 1, 2, 'imgs/produits/nouveautes/imgnouv/chf010201_4.jpeg', '', 0),
(5, 4, 2, 1, 'imgs/produits/nouveautes/imgnouv/chf010104_1.jpeg', '', 1),
(6, 4, 2, 1, 'imgs/produits/nouveautes/imgnouv/chf010104_2.jpeg', '', 0),
(7, 4, 2, 1, 'imgs/produits/nouveautes/imgnouv/chf010104_3.jpeg', '', 0),
(8, 4, 2, 1, 'imgs/produits/nouveautes/imgnouv/chf010104_4.jpeg', '', 0),
(9, 7, 3, 4, 'imgs/produits/nouveautes/imgnouv/rof010407_1.jpeg', '', 1),
(10, 7, 3, 4, 'imgs/produits/nouveautes/imgnouv/rof010407_2.jpeg', '', 0),
(11, 7, 3, 4, 'imgs/produits/nouveautes/imgnouv/rof010407_3.jpeg', '', 0),
(12, 7, 3, 4, 'imgs/produits/nouveautes/imgnouv/rof010407_4.jpeg', '', 0),
(13, 10, 3, 7, 'imgs/produits/nouveautes/imgnouv/rof010710_1.jpeg', '', 0),
(14, 10, 3, 7, 'imgs/produits/nouveautes/imgnouv/rof010710_2.jpeg', '', 0),
(15, 10, 3, 7, 'imgs/produits/nouveautes/imgnouv/rof010710_3.jpeg', '', 0),
(16, 10, 3, 7, 'imgs/produits/nouveautes/imgnouv/rof010710_4.jpeg', '', 0),
(17, 13, 4, 5, 'imgs/produits/nouveautes/imgnouv/pah010513_1.jpeg', '', 1),
(18, 13, 4, 5, 'imgs/produits/nouveautes/imgnouv/pah010513_2.jpeg', '', 0),
(19, 13, 4, 5, 'imgs/produits/nouveautes/imgnouv/pah010513_3.jpeg', '', 0),
(20, 13, 4, 5, 'imgs/produits/nouveautes/imgnouv/pah010513_4.jpeg', '', 0),
(21, 16, 5, 3, 'imgs/produits/nouveautes/imgnouv/chh010316_1.jpeg', '', 1),
(22, 16, 5, 3, 'imgs/produits/nouveautes/imgnouv/chh010316_2.jpeg', '', 0),
(23, 16, 5, 3, 'imgs/produits/nouveautes/imgnouv/chh010316_3.jpeg', '', 0),
(24, 16, 5, 3, 'imgs/produits/nouveautes/imgnouv/chh010316_4.jpeg', '', 0),
(25, 19, 5, 8, 'imgs/produits/nouveautes/imgnouv/chh010819_1.jpeg', '', 1),
(26, 19, 5, 8, 'imgs/produits/nouveautes/imgnouv/chh010819_2.jpeg', '', 0),
(27, 19, 5, 8, 'imgs/produits/nouveautes/imgnouv/chh010819_3.jpeg', '', 0),
(28, 19, 5, 8, 'imgs/produits/nouveautes/imgnouv/chh010819_4.jpeg', '', 0),
(29, 22, 6, 6, 'imgs/produits/nouveautes/imgnouv/paf010622_1.jpeg', '', 1),
(30, 22, 6, 6, 'imgs/produits/nouveautes/imgnouv/paf010622_2.jpeg', '', 0),
(31, 22, 6, 6, 'imgs/produits/nouveautes/imgnouv/paf010622_3.jpeg', '', 0),
(32, 22, 6, 6, 'imgs/produits/nouveautes/imgnouv/paf010622_4.jpeg', '', 0),
(33, 25, 7, 9, 'imgs/produits/femme/chemises/chf010925_1.jpeg', '', 1),
(34, 25, 7, 9, 'imgs/produits/femme/chemises/chf010925_2.jpeg', '', 0),
(35, 25, 7, 9, 'imgs/produits/femme/chemises/chf010925_3.jpeg', '', 0),
(36, 25, 7, 9, 'imgs/produits/femme/chemises/chf010925_4.jpeg', '', 0),
(37, 28, 7, 10, 'imgs/produits/femme/chemises/chf011028_1.jpeg', '', 0),
(38, 28, 7, 10, 'imgs/produits/femme/chemises/chf011028_2.jpeg', '', 0),
(39, 28, 7, 10, 'imgs/produits/femme/chemises/chf011028_3.jpeg', '', 0),
(40, 28, 7, 10, 'imgs/produits/femme/chemises/chf011028_4.jpeg', '', 0),
(41, 31, 8, 3, 'imgs/produits/femme/chemises/chf010331_1.jpeg', '', 1),
(42, 31, 8, 3, 'imgs/produits/femme/chemises/chf010331_2.jpeg', '', 0),
(43, 31, 8, 3, 'imgs/produits/femme/chemises/chf010331_3.jpeg', '', 0),
(44, 31, 8, 3, 'imgs/produits/femme/chemises/chf010331_4.jpeg', '', 0),
(45, 34, 9, 1, 'imgs/produits/femme/chemises/chf010134_1.jpeg', '', 1),
(46, 34, 9, 1, 'imgs/produits/femme/chemises/chf010134_2.jpeg', '', 0),
(47, 34, 9, 1, 'imgs/produits/femme/chemises/chf010134_3.jpeg', '', 0),
(48, 34, 9, 1, 'imgs/produits/femme/chemises/chf010134_4.jpeg', '', 0),
(49, 37, 10, 9, 'imgs/produits/femme/chemises/chf010937_1.jpeg', '', 1),
(50, 37, 10, 9, 'imgs/produits/femme/chemises/chf010937_2.jpeg', '', 0),
(51, 37, 10, 9, 'imgs/produits/femme/chemises/chf010937_3.jpeg', '', 0),
(52, 37, 10, 9, 'imgs/produits/femme/chemises/chf010937_4.jpeg', '', 0),
(53, 40, 11, 11, 'imgs/produits/femme/pantalons/paf011140_1.jpeg', '', 1),
(54, 40, 11, 11, 'imgs/produits/femme/pantalons/paf011140_2.jpeg', '', 0),
(55, 40, 11, 11, 'imgs/produits/femme/pantalons/paf011140_3.jpeg', '', 0),
(56, 40, 11, 11, 'imgs/produits/femme/pantalons/paf011140_4.jpeg', '', 0),
(57, 43, 11, 2, 'imgs/produits/femme/pantalons/paf010243_1.jpeg', '', 0),
(58, 43, 11, 2, 'imgs/produits/femme/pantalons/paf010243_2.jpeg', '', 0),
(59, 43, 11, 2, 'imgs/produits/femme/pantalons/paf010243_3.jpeg', '', 0),
(60, 43, 11, 2, 'imgs/produits/femme/pantalons/paf010243_4.jpeg', '', 0),
(61, 46, 12, 5, 'imgs/produits/femme/pantalons/paf010546_1.jpeg', '', 1),
(62, 46, 12, 5, 'imgs/produits/femme/pantalons/paf010546_2.jpeg', '', 0),
(63, 46, 12, 5, 'imgs/produits/femme/pantalons/paf010546_3.jpeg', '', 0),
(64, 46, 12, 5, 'imgs/produits/femme/pantalons/paf010546_4.jpeg', '', 0),
(65, 49, 13, 12, 'imgs/produits/femme/pantalons/paf011249_1.jpeg', '', 1),
(66, 49, 13, 12, 'imgs/produits/femme/pantalons/paf011249_2.jpeg', '', 0),
(67, 49, 13, 12, 'imgs/produits/femme/pantalons/paf011249_3.jpeg', '', 0),
(68, 49, 13, 12, 'imgs/produits/femme/pantalons/paf011249_4.jpeg', '', 0),
(69, 52, 14, 12, 'imgs/produits/femme/pantalons/paf011252_1.jpeg', '', 1),
(70, 52, 14, 12, 'imgs/produits/femme/pantalons/paf011252_2.jpeg', '', 0),
(71, 52, 14, 12, 'imgs/produits/femme/pantalons/paf011252_3.jpeg', '', 0),
(72, 52, 14, 12, 'imgs/produits/femme/pantalons/paf011252_4.jpeg', '', 0),
(73, 55, 15, 2, 'imgs/produits/femme/robes/rof010255_1.jpeg', '', 1),
(74, 55, 15, 2, 'imgs/produits/femme/robes/rof010255_2.jpeg', '', 0),
(75, 55, 15, 2, 'imgs/produits/femme/robes/rof010255_3.jpeg', '', 0),
(76, 55, 15, 2, 'imgs/produits/femme/robes/rof010255_4.jpeg', '', 0),
(77, 58, 15, 12, 'imgs/produits/femme/robes/rof011258_1.jpeg', '', 0),
(78, 58, 15, 12, 'imgs/produits/femme/robes/rof011258_2.jpeg', '', 0),
(79, 58, 15, 12, 'imgs/produits/femme/robes/rof011258_3.jpeg', '', 0),
(80, 58, 15, 12, 'imgs/produits/femme/robes/rof011258_4.jpeg', '', 0),
(81, 61, 16, 1, 'imgs/produits/femme/robes/rof010161_1.jpeg', '', 1),
(82, 61, 16, 1, 'imgs/produits/femme/robes/rof010161_2.jpeg', '', 0),
(83, 61, 16, 1, 'imgs/produits/femme/robes/rof010161_3.jpeg', '', 0),
(84, 61, 16, 1, 'imgs/produits/femme/robes/rof010161_4.jpeg', '', 0),
(85, 64, 17, 2, 'imgs/produits/femme/robes/rof010264_1.jpeg', '', 1),
(86, 64, 17, 2, 'imgs/produits/femme/robes/rof010264_2.jpeg', '', 0),
(87, 64, 17, 2, 'imgs/produits/femme/robes/rof010264_3.jpeg', '', 0),
(88, 64, 17, 2, 'imgs/produits/femme/robes/rof010264_4.jpeg', '', 0),
(89, 67, 18, 2, 'imgs/produits/femme/jupes/juf010267_1.jpeg', '', 1),
(90, 67, 18, 2, 'imgs/produits/femme/jupes/juf010267_2.jpeg', '', 0),
(91, 70, 18, 9, 'imgs/produits/femme/jupes/juf010970_1.jpeg', '', 0),
(92, 70, 18, 9, 'imgs/produits/femme/jupes/juf010970_2.jpeg', '', 0),
(93, 73, 19, 2, 'imgs/produits/femme/jupes/juf010273_1.jpeg', '', 1),
(94, 73, 19, 2, 'imgs/produits/femme/jupes/juf010273_2.jpeg', '', 0),
(95, 73, 19, 2, 'imgs/produits/femme/jupes/juf010273_3.jpeg', '', 0),
(96, 73, 19, 2, 'imgs/produits/femme/jupes/juf010273_4.jpeg', '', 0),
(97, 76, 20, 4, 'imgs/produits/femme/jupes/juf010476_1.jpeg', '', 1),
(98, 76, 20, 4, 'imgs/produits/femme/jupes/juf010476_2.jpeg', '', 0),
(99, 76, 20, 4, 'imgs/produits/femme/jupes/juf010476_3.jpeg', '', 0),
(100, 76, 20, 4, 'imgs/produits/femme/jupes/juf010476_4.jpeg', '', 0),
(101, 79, 21, 12, 'imgs/produits/femme/chaussures/caf041279_1.jpeg', '', 1),
(102, 79, 21, 12, 'imgs/produits/femme/chaussures/caf041279_2.jpeg', '', 0),
(103, 79, 21, 12, 'imgs/produits/femme/chaussures/caf041279_3.jpeg', '', 0),
(104, 79, 21, 12, 'imgs/produits/femme/chaussures/caf041279_4.jpeg', '', 0),
(105, 92, 22, 2, 'imgs/produits/homme/chemises/chh010292_1.jpeg', '', 1),
(106, 92, 22, 2, 'imgs/produits/homme/chemises/chh010292_2.jpeg', '', 0),
(107, 92, 22, 2, 'imgs/produits/homme/chemises/chh010292_3.jpeg', '', 0),
(108, 92, 22, 2, 'imgs/produits/homme/chemises/chh010292_4.jpeg', '', 0),
(109, 95, 22, 7, 'imgs/produits/homme/chemises/chh010795_1.jpeg', '', 0),
(110, 95, 22, 7, 'imgs/produits/homme/chemises/chh010795_2.jpeg', '', 0),
(111, 95, 22, 7, 'imgs/produits/homme/chemises/chh010795_3.jpeg', '', 0),
(112, 95, 22, 7, 'imgs/produits/homme/chemises/chh010795_4.jpeg', '', 0),
(113, 98, 23, 1, 'imgs/produits/homme/chemises/chh010198_1.jpeg', '', 1),
(114, 98, 23, 1, 'imgs/produits/homme/chemises/chh010198_2.jpeg', '', 0),
(115, 98, 23, 1, 'imgs/produits/homme/chemises/chh010198_3.jpeg', '', 0),
(116, 98, 23, 1, 'imgs/produits/homme/chemises/chh010198_4.jpeg', '', 0),
(117, 101, 24, 5, 'imgs/produits/homme/chemises/chh0105101_1.jpeg', '', 1),
(118, 101, 24, 5, 'imgs/produits/homme/chemises/chh0105101_2.jpeg', '', 0),
(119, 101, 24, 5, 'imgs/produits/homme/chemises/chh0105101_3.jpeg', '', 0),
(120, 101, 24, 5, 'imgs/produits/homme/chemises/chh0105101_4.jpeg', '', 0),
(121, 104, 25, 2, 'imgs/produits/homme/pantalons/pah0102104_1.jpeg', '', 1),
(122, 104, 25, 2, 'imgs/produits/homme/pantalons/pah0102104_2.jpeg', '', 0),
(123, 104, 25, 2, 'imgs/produits/homme/pantalons/pah0102104_3.jpeg', '', 0),
(124, 104, 25, 2, 'imgs/produits/homme/pantalons/pah0102104_4.jpeg', '', 0),
(125, 107, 25, 4, 'imgs/produits/homme/pantalons/pah0104107_1.jpeg', '', 0),
(126, 107, 25, 4, 'imgs/produits/homme/pantalons/pah0104107_2.jpeg', '', 0),
(127, 107, 25, 4, 'imgs/produits/homme/pantalons/pah0104107_3.jpeg', '', 0),
(128, 107, 25, 4, 'imgs/produits/homme/pantalons/pah0104107_4.jpeg', '', 0),
(129, 110, 26, 7, 'imgs/produits/homme/pantalons/pah0107110_1.jpeg', '', 1),
(130, 110, 26, 7, 'imgs/produits/homme/pantalons/pah0107110_2.jpeg', '', 0),
(131, 110, 26, 7, 'imgs/produits/homme/pantalons/pah0107110_3.jpeg', '', 0),
(132, 110, 26, 7, 'imgs/produits/homme/pantalons/pah0107110_4.jpeg', '', 0),
(133, 113, 27, 1, 'imgs/produits/homme/chaussures/cah0901113_1.jpeg', '', 1),
(134, 113, 27, 1, 'imgs/produits/homme/chaussures/cah0901113_2.jpeg', '', 0),
(135, 113, 27, 1, 'imgs/produits/homme/chaussures/cah0901113_3.jpeg', '', 0),
(136, 113, 27, 1, 'imgs/produits/homme/chaussures/cah0901113_4.jpeg', '', 0),
(137, 121, 28, 1, 'imgs/produits/fille/chemises/chi0101121_1.jpeg', '', 1),
(138, 121, 28, 1, 'imgs/produits/fille/chemises/chi0101121_2.jpeg', '', 0),
(139, 121, 28, 1, 'imgs/produits/fille/chemises/chi0101121_3.jpeg', '', 0),
(140, 121, 28, 1, 'imgs/produits/fille/chemises/chi0101121_4.jpeg', '', 0),
(141, 124, 28, 13, 'imgs/produits/fille/chemises/chi0113124_1.jpeg', '', 0),
(142, 124, 28, 13, 'imgs/produits/fille/chemises/chi0113124_2.jpeg', '', 0),
(143, 124, 28, 13, 'imgs/produits/fille/chemises/chi0113124_3.jpeg', '', 0),
(144, 127, 29, 1, 'imgs/produits/fille/chemises/chi0101127_1.jpeg', '', 1),
(145, 127, 29, 1, 'imgs/produits/fille/chemises/chi0101127_2.jpeg', '', 0),
(146, 127, 29, 1, 'imgs/produits/fille/chemises/chi0101127_3.jpeg', '', 0),
(147, 127, 29, 1, 'imgs/produits/fille/chemises/chi0101127_4.jpeg', '', 0),
(148, 130, 30, 10, 'imgs/produits/fille/pantalons/pai0110130_1.jpeg', '', 1),
(149, 130, 30, 10, 'imgs/produits/fille/pantalons/pai0110130_2.jpeg', '', 0),
(150, 130, 30, 10, 'imgs/produits/fille/pantalons/pai0110130_3.jpeg', '', 0),
(151, 133, 30, 4, 'imgs/produits/fille/pantalons/pai0104133_1.jpeg', '', 0),
(152, 133, 30, 4, 'imgs/produits/fille/pantalons/pai0104133_2.jpeg', '', 0),
(153, 133, 30, 4, 'imgs/produits/fille/pantalons/pai0104133_3.jpeg', '', 0),
(154, 136, 31, 3, 'imgs/produits/fille/pantalons/pai0103136_1.jpeg', '', 1),
(155, 136, 31, 3, 'imgs/produits/fille/pantalons/pai0103136_2.jpeg', '', 0),
(156, 136, 31, 3, 'imgs/produits/fille/pantalons/pai0103136_3.jpeg', '', 0),
(157, 139, 32, 14, 'imgs/produits/fille/robes/roi0114139_1.jpeg', '', 1),
(158, 139, 32, 14, 'imgs/produits/fille/robes/roi0114139_2.jpeg', '', 0),
(159, 139, 32, 14, 'imgs/produits/fille/robes/roi0114139_3.jpeg', '', 0),
(160, 139, 32, 14, 'imgs/produits/fille/robes/roi0114139_4.jpeg', '', 0),
(161, 142, 32, 3, 'imgs/produits/fille/robes/roi0103142_1.jpeg', '', 0),
(162, 142, 32, 3, 'imgs/produits/fille/robes/roi0103142_2.jpeg', '', 0),
(163, 145, 33, 9, 'imgs/produits/fille/robes/roi0109145_1.jpeg', '', 1),
(164, 145, 33, 9, 'imgs/produits/fille/robes/roi0109145_2.jpeg', '', 0),
(165, 145, 33, 9, 'imgs/produits/fille/robes/roi0109145_3.jpeg', '', 0),
(166, 148, 34, 14, 'imgs/produits/fille/jupes/jui0114148_1.jpeg', '', 1),
(167, 148, 34, 14, 'imgs/produits/fille/jupes/jui0114148_2.jpeg', '', 0),
(168, 148, 34, 14, 'imgs/produits/fille/jupes/jui0114148_3.jpeg', '', 0),
(169, 151, 34, 3, 'imgs/produits/fille/jupes/jui0103151_1.jpeg', '', 0),
(170, 151, 34, 3, 'imgs/produits/fille/jupes/jui0103151_2.jpeg', '', 0),
(171, 151, 34, 3, 'imgs/produits/fille/jupes/jui0103151_3.jpeg', '', 0),
(172, 154, 35, 2, 'imgs/produits/fille/jupes/jui0102154_1.jpeg', '', 1),
(173, 154, 35, 2, 'imgs/produits/fille/jupes/jui0102154_2.jpeg', '', 0),
(174, 154, 35, 2, 'imgs/produits/fille/jupes/jui0102154_3.jpeg', '', 0),
(175, 154, 35, 2, 'imgs/produits/fille/jupes/jui0102154_4.jpeg', '', 0),
(176, 157, 36, 3, 'imgs/produits/garcon/chemises/chg0103157_1.jpeg', '', 1),
(177, 157, 36, 3, 'imgs/produits/garcon/chemises/chg0103157_2.jpeg', '', 0),
(178, 157, 36, 3, 'imgs/produits/garcon/chemises/chg0103157_3.jpeg', '', 0),
(179, 160, 36, 5, 'imgs/produits/garcon/chemises/chg0105160_1.jpeg', '', 0),
(180, 160, 36, 5, 'imgs/produits/garcon/chemises/chg0105160_2.jpeg', '', 0),
(181, 160, 36, 5, 'imgs/produits/garcon/chemises/chg0105160_3.jpeg', '', 0),
(182, 163, 37, 1, 'imgs/produits/garcon/chemises/chg0101163_1.jpeg', '', 1),
(183, 163, 37, 1, 'imgs/produits/garcon/chemises/chg0101163_2.jpeg', '', 0),
(184, 163, 37, 1, 'imgs/produits/garcon/chemises/chg0101163_3.jpeg', '', 0),
(185, 166, 38, 2, 'imgs/produits/garcon/pantalons/pag0102166_1.jpeg', '', 1),
(186, 166, 38, 2, 'imgs/produits/garcon/pantalons/pag0102166_2.jpeg', '', 0),
(187, 166, 38, 2, 'imgs/produits/garcon/pantalons/pag0102166_3.jpeg', '', 0),
(188, 169, 38, 4, 'imgs/produits/garcon/pantalons/pag0104169_1.jpeg', '', 0),
(189, 169, 38, 4, 'imgs/produits/garcon/pantalons/pag0104169_2.jpeg', '', 0),
(190, 169, 38, 4, 'imgs/produits/garcon/pantalons/pag0104169_3.jpeg', '', 0),
(191, 172, 39, 5, 'imgs/produits/garcon/pantalons/pag0105172_1.jpeg', '', 0),
(192, 172, 39, 5, 'imgs/produits/garcon/pantalons/pag0105172_2.jpeg', '', 0),
(193, 172, 39, 5, 'imgs/produits/garcon/pantalons/pag0105172_3.jpeg', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `id_panier` smallint(6) NOT NULL AUTO_INCREMENT,
  `panier_photo_produit` varchar(255) DEFAULT NULL,
  `panier_nom_produit` varchar(255) DEFAULT NULL,
  `panier_ref_produit` varchar(255) DEFAULT NULL,
  `panier_qtite_produit` smallint(6) DEFAULT NULL,
  `panier_prix_produit` float DEFAULT NULL,
  `panier_prix_ligne` float DEFAULT NULL,
  `panier_prix_total` float DEFAULT NULL,
  `panier_id_commande` varchar(255) DEFAULT NULL,
  `panier_utilisateur_id` varchar(255) DEFAULT NULL,
  `panier_transaction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_panier`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id_panier`, `panier_photo_produit`, `panier_nom_produit`, `panier_ref_produit`, `panier_qtite_produit`, `panier_prix_produit`, `panier_prix_ligne`, `panier_prix_total`, `panier_id_commande`, `panier_utilisateur_id`, `panier_transaction`) VALUES
(6, 'imgs/produits/femme/chemises/chf011028_1.jpeg', 'Longue chemise en jean', 'ref0101-0210-07', 3, 29.99, 89.97, 89.97, '5c87mbai8g11qtmouhfg0elu0o', '2', '155142'),
(7, 'imgs/produits/nouveautes/imgnouv/chf010201_1.jpeg', 'Chemise en velours', 'ref0101-0102-01', 4, 19.99, NULL, NULL, '2jgn38n4nf68he38hfmaaa4fbi', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `id_produit` smallint(6) NOT NULL AUTO_INCREMENT,
  `id_modele` smallint(6) DEFAULT NULL,
  `cat_produit_id` smallint(6) NOT NULL,
  `taille_id` smallint(6) DEFAULT NULL,
  `couleur_id` smallint(6) DEFAULT NULL,
  `libelle_prod` varchar(255) NOT NULL,
  `prix_prod` float NOT NULL,
  `ref_prod` varchar(40) DEFAULT NULL,
  `description_prod` varchar(500) DEFAULT NULL,
  `quantite` smallint(6) DEFAULT NULL,
  `img_default` varchar(255) DEFAULT NULL,
  `statut_produit` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `fk_categorieProduitId` (`cat_produit_id`),
  KEY `fk_tailleId` (`taille_id`),
  KEY `fk_couleurId` (`couleur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id_produit`, `id_modele`, `cat_produit_id`, `taille_id`, `couleur_id`, `libelle_prod`, `prix_prod`, `ref_prod`, `description_prod`, `quantite`, `img_default`, `statut_produit`) VALUES
(1, 1, 1, 1, 2, 'Chemise en velours', 19.99, 'ref0101-0102-01', 'Chemise en velours doux. Modèle avec col en pointe et boutonnage devant.\nManches longues terminées par poignet boutonné. Base légèrement arrondie avec\nun peu plus de longueur dans le dos.', 3, 'imgs/produits/nouveautes/imgnouv/chf010201_1.jpeg', 1),
(2, 1, 1, 2, 2, 'Chemise en velours', 19.99, 'ref0101-0202-01', 'Chemise en velours doux. Modèle avec col en pointe et boutonnage devant.\nManches longues terminées par poignet boutonné. Base légèrement arrondie avec\nun peu plus de longueur dans le dos.', 3, 'imgs/produits/nouveautes/imgnouv/chf010201_1.jpeg', 1),
(3, 1, 1, 3, 2, 'Chemise en velours', 19.99, 'ref0101-0302-01', 'Chemise en velours doux. Modèle avec col en pointe et boutonnage devant.\nManches longues terminées par poignet boutonné. Base légèrement arrondie avec\nun peu plus de longueur dans le dos.', 3, 'imgs/produits/nouveautes/imgnouv/chf010201_1.jpeg', 1),
(4, 2, 1, 1, 1, 'T-shirt imprimé', 14.99, 'ref0101-0101-02', 'The Vampire’s Wife x H&M. The Vampire T-shirt est un T-shirt en doux\njersey de coton bio. Coupe ajustée avec logo du designer sur la poitrine.', 3, 'imgs/produits/nouveautes/imgnouv/chf010104_1.jpeg', 1),
(5, 2, 1, 2, 1, 'T-shirt imprimé', 14.99, 'ref0101-0201-02', 'The Vampire’s Wife x H&M. The Vampire T-shirt est un T-shirt en doux\njersey de coton bio. Coupe ajustée avec logo du designer sur la poitrine.', 3, 'imgs/produits/nouveautes/imgnouv/chf010104_1.jpeg', 1),
(6, 2, 1, 3, 1, 'T-shirt imprimé', 14.99, 'ref0101-0301-02', 'The Vampire’s Wife x H&M. The Vampire T-shirt est un T-shirt en doux\njersey de coton bio. Coupe ajustée avec logo du designer sur la poitrine.', 3, 'imgs/produits/nouveautes/imgnouv/chf010104_1.jpeg', 1),
(7, 3, 3, 1, 4, 'Robe avec broderie anglaise', 69.99, 'ref0103-0104-03', 'Robe courte en coton avec broderie anglaise. Modèle à col droit\navec boutonnage en haut et taille légèrement cintrée. Emmanchures descendues et longues\nmanches amples terminées par large poignet boutonné. Partiellement doublée.', 3, 'imgs/produits/nouveautes/imgnouv/rof010407_1.jpeg', 1),
(8, 3, 3, 2, 4, 'Robe avec broderie anglaise', 69.99, 'ref0103-0204-03', 'Robe courte en coton avec broderie anglaise. Modèle à col droit\navec boutonnage en haut et taille légèrement cintrée. Emmanchures descendues et longues\nmanches amples terminées par large poignet boutonné. Partiellement doublée.', 3, 'imgs/produits/nouveautes/imgnouv/rof010407_1.jpeg', 1),
(9, 3, 3, 3, 4, 'Robe avec broderie anglaise', 69.99, 'ref0103-0304-03', 'Robe courte en coton avec broderie anglaise. Modèle à col droit\navec boutonnage en haut et taille légèrement cintrée. Emmanchures descendues et longues\nmanches amples terminées par large poignet boutonné. Partiellement doublée.', 3, 'imgs/produits/nouveautes/imgnouv/rof010407_1.jpeg', 1),
(10, 3, 3, 1, 7, 'Robe avec broderie anglaise', 69.99, 'ref0103-0107-03', 'Robe courte en coton avec broderie anglaise. Modèle à col droit\navec boutonnage en haut et taille légèrement cintrée. Emmanchures descendues et longues\nmanches amples terminées par large poignet boutonné. Partiellement doublée.', 3, 'imgs/produits/nouveautes/imgnouv/rof010710_1.jpeg', 1),
(11, 3, 3, 2, 7, 'Robe avec broderie anglaise', 69.99, 'ref0103-0207-03', 'Robe courte en coton avec broderie anglaise. Modèle à col droit\navec boutonnage en haut et taille légèrement cintrée. Emmanchures descendues et longues\nmanches amples terminées par large poignet boutonné. Partiellement doublée.', 3, 'imgs/produits/nouveautes/imgnouv/rof010710_1.jpeg', 1),
(12, 3, 3, 3, 7, 'Robe avec broderie anglaise', 69.99, 'ref0103-0307-03', 'Robe courte en coton avec broderie anglaise. Modèle à col droit\navec boutonnage en haut et taille légèrement cintrée. Emmanchures descendues et longues\nmanches amples terminées par large poignet boutonné. Partiellement doublée.', 3, 'imgs/produits/nouveautes/imgnouv/rof010710_1.jpeg', 1),
(13, 4, 7, 1, 5, 'Lot de 2 pantalons de pyjama', 29.99, 'ref0207-0105-04', 'Pantalons de pyjama en tissu de coton aérien. Modèle avec élastique habillé et\nlien de serrage à la taille. Fausse braguette et poches latérales.', 3, 'imgs/produits/nouveautes/imgnouv/pah010513_1.jpeg', 1),
(14, 4, 7, 2, 5, 'Lot de 2 pantalons de pyjama', 29.99, 'ref0207-0205-04', 'Pantalons de pyjama en tissu de coton aérien. Modèle avec élastique habillé et\nlien de serrage à la taille. Fausse braguette et poches latérales.', 3, 'imgs/produits/nouveautes/imgnouv/pah010513_1.jpeg', 1),
(15, 4, 7, 3, 5, 'Lot de 2 pantalons de pyjama', 29.99, 'ref0207-0305-04', 'Pantalons de pyjama en tissu de coton aérien. Modèle avec élastique habillé et\nlien de serrage à la taille. Fausse braguette et poches latérales.', 3, 'imgs/produits/nouveautes/imgnouv/pah010513_1.jpeg', 1),
(16, 5, 6, 1, 3, 'Surchemise en twill', 29.99, 'ref0206-0103-05', 'Surchemise en twill de coton. Modèle avec col et fermeture à glissière devant.\nPoches de poitrine avec rabat muni d’un bouton-pression dissimulé. Manches terminées par\nfente et poignet boutonné. Empiècement dans le dos et base droite. Non doublée.', 3, 'imgs/produits/nouveautes/imgnouv/chh010316_1.jpeg', 1),
(17, 5, 6, 2, 3, 'Surchemise en twill', 29.99, 'ref0206-0203-05', 'Surchemise en twill de coton. Modèle avec col et fermeture à glissière devant.\nPoches de poitrine avec rabat muni d’un bouton-pression dissimulé. Manches terminées par\nfente et poignet boutonné. Empiècement dans le dos et base droite. Non doublée.', 3, 'imgs/produits/nouveautes/imgnouv/chh010316_1.jpeg', 1),
(18, 5, 6, 3, 3, 'Surchemise en twill', 29.99, 'ref0206-0303-05', 'Surchemise en twill de coton. Modèle avec col et fermeture à glissière devant.\nPoches de poitrine avec rabat muni d’un bouton-pression dissimulé. Manches terminées par\nfente et poignet boutonné. Empiècement dans le dos et base droite. Non doublée.', 3, 'imgs/produits/nouveautes/imgnouv/chh010316_1.jpeg', 1),
(19, 5, 6, 1, 8, 'Surchemise en twill', 29.99, 'ref0206-0108-05', 'Surchemise en twill de coton. Modèle avec col et fermeture à glissière devant.\nPoches de poitrine avec rabat muni d’un bouton-pression dissimulé. Manches terminées par\nfente et poignet boutonné. Empiècement dans le dos et base droite. Non doublée.', 3, 'imgs/produits/nouveautes/imgnouv/chh010819_1.jpeg', 1),
(20, 5, 6, 2, 8, 'Surchemise en twill', 29.99, 'ref0206-0208-05', 'Surchemise en twill de coton. Modèle avec col et fermeture à glissière devant.\nPoches de poitrine avec rabat muni d’un bouton-pression dissimulé. Manches terminées par\nfente et poignet boutonné. Empiècement dans le dos et base droite. Non doublée.', 3, 'imgs/produits/nouveautes/imgnouv/chh010819_1.jpeg', 1),
(21, 5, 6, 3, 8, 'Surchemise en twill', 29.99, 'ref0206-0308-05', 'Surchemise en twill de coton. Modèle avec col et fermeture à glissière devant.\nPoches de poitrine avec rabat muni d’un bouton-pression dissimulé. Manches terminées par\nfente et poignet boutonné. Empiècement dans le dos et base droite. Non doublée.', 3, 'imgs/produits/nouveautes/imgnouv/chh010819_1.jpeg', 1),
(22, 6, 2, 1, 6, 'Pantalon jogger', 14.99, 'ref0102-0106-06', 'Pantalon jogger en molleton de coton mélangé. Coupe décontractée avec\nélastique et lien de serrage à la taille. Poches latérales discrètes.\nBord élastique en bas de jambe.', 3, 'imgs/produits/nouveautes/imgnouv/paf010622_1.jpeg', 1),
(23, 6, 2, 2, 6, 'Pantalon jogger', 14.99, 'ref0102-0206-06', 'Pantalon jogger en molleton de coton mélangé. Coupe décontractée avec\nélastique et lien de serrage à la taille. Poches latérales discrètes.\nBord élastique en bas de jambe.', 3, 'imgs/produits/nouveautes/imgnouv/paf010622_1.jpeg', 1),
(24, 6, 2, 3, 6, 'Pantalon jogger', 14.99, 'ref0102-0306-06', 'Pantalon jogger en molleton de coton mélangé. Coupe décontractée avec\nélastique et lien de serrage à la taille. Poches latérales discrètes.\nBord élastique en bas de jambe.', 3, 'imgs/produits/nouveautes/imgnouv/paf010622_1.jpeg', 1),
(25, 7, 1, 1, 9, 'Longue chemise en jean', 29.99, 'ref0101-0109-07', 'Chemise longue en denim souple de lyocell Tencel™. Coupe droite avec\ncol, poches de poitrine plissées et boutonnage devant. Manches longues terminées\npar poignet boutonné.', 3, 'imgs/produits/femme/chemises/chf010925_1.jpeg', 1),
(26, 7, 1, 2, 9, 'Longue chemise en jean', 29.99, 'ref0101-0209-07', 'Chemise longue en denim souple de lyocell Tencel™. Coupe droite avec\ncol, poches de poitrine plissées et boutonnage devant. Manches longues terminées\npar poignet boutonné.', 3, 'imgs/produits/femme/chemises/chf010925_1.jpeg', 1),
(27, 7, 1, 3, 9, 'Longue chemise en jean', 29.99, 'ref0101-0309-07', 'Chemise longue en denim souple de lyocell Tencel™. Coupe droite avec\ncol, poches de poitrine plissées et boutonnage devant. Manches longues terminées\npar poignet boutonné.', 3, 'imgs/produits/femme/chemises/chf010925_1.jpeg', 1),
(28, 7, 1, 1, 10, 'Longue chemise en jean', 29.99, 'ref0101-0110-07', 'Chemise longue en denim souple de lyocell Tencel™. Coupe droite avec\ncol, poches de poitrine plissées et boutonnage devant. Manches longues terminées\npar poignet boutonné.', 3, 'imgs/produits/femme/chemises/chf011028_1.jpeg', 1),
(29, 7, 1, 2, 10, 'Longue chemise en jean', 29.99, 'ref0101-0210-07', 'Chemise longue en denim souple de lyocell Tencel™. Coupe droite avec\ncol, poches de poitrine plissées et boutonnage devant. Manches longues terminées\npar poignet boutonné.', 3, 'imgs/produits/femme/chemises/chf011028_1.jpeg', 1),
(30, 7, 1, 3, 10, 'Longue chemise en jean', 29.99, 'ref0101-0310-07', 'Chemise longue en denim souple de lyocell Tencel™. Coupe droite avec\ncol, poches de poitrine plissées et boutonnage devant. Manches longues terminées\npar poignet boutonné.', 3, 'imgs/produits/femme/chemises/chf011028_1.jpeg', 1),
(31, 8, 1, 1, 3, 'Chemise en coton', 14.99, 'ref0101-0103-08', 'Chemise droite en coton tissé. Modèle avec col, poche de poitrine et\nboutonnage devant. Manches longues terminées par poignet boutonné. Empiècement\navec pli creux dans le dos. Base arrondie avec un peu plus de longueur dans le dos.', 3, 'imgs/produits/femme/chemises/chf010331_1.jpeg', 1),
(32, 8, 1, 2, 3, 'Chemise en coton', 14.99, 'ref0101-0203-08', 'Chemise droite en coton tissé. Modèle avec col, poche de poitrine et\nboutonnage devant. Manches longues terminées par poignet boutonné. Empiècement\navec pli creux dans le dos. Base arrondie avec un peu plus de longueur dans le dos.', 3, 'imgs/produits/femme/chemises/chf010331_1.jpeg', 1),
(33, 8, 1, 3, 3, 'Chemise en coton', 14.99, 'ref0101-0303-08', 'Chemise droite en coton tissé. Modèle avec col, poche de poitrine et\nboutonnage devant. Manches longues terminées par poignet boutonné. Empiècement\navec pli creux dans le dos. Base arrondie avec un peu plus de longueur dans le dos.', 3, 'imgs/produits/femme/chemises/chf010331_1.jpeg', 1),
(34, 9, 1, 1, 1, 'Chemise oversize en coton', 19.99, 'ref0101-0101-09', 'Chemise oversize classique en tissu de coton craquant. Modèle avec col\net boutonnage dissimulé devant. Emmanchure descendue et manches longues terminées\npar poignet boutonné. Base arrondie avec un peu plus de longueur dans le dos.', 3, 'imgs/produits/femme/chemises/chf010134_1.jpeg', 1),
(35, 9, 1, 2, 1, 'Chemise oversize en coton', 19.99, 'ref0101-0201-09', 'Chemise oversize classique en tissu de coton craquant. Modèle avec col\net boutonnage dissimulé devant. Emmanchure descendue et manches longues terminées\npar poignet boutonné. Base arrondie avec un peu plus de longueur dans le dos.', 3, 'imgs/produits/femme/chemises/chf010134_1.jpeg', 1),
(36, 9, 1, 3, 1, 'Chemise oversize en coton', 19.99, 'ref0101-0301-09', 'Chemise oversize classique en tissu de coton craquant. Modèle avec col\net boutonnage dissimulé devant. Emmanchure descendue et manches longues terminées\npar poignet boutonné. Base arrondie avec un peu plus de longueur dans le dos.', 3, 'imgs/produits/femme/chemises/chf010134_1.jpeg', 1),
(37, 10, 1, 1, 9, 'Chemise en jean', 24.99, 'ref0101-0109-10', 'Chemise en denim lavé. Modèle avec col et fermeture au moyen de\nboutons-pression nacrés devant. Poches de poitrine à rabat pressionné.\nManches longues terminées par poignet boutonné. Empiècement devant et\ndans le dos. Base arrondie.', 3, 'imgs/produits/femme/chemises/chf010937_1.jpeg', 1),
(38, 10, 1, 2, 9, 'Chemise en jean', 24.99, 'ref0101-0209-10', 'Chemise en denim lavé. Modèle avec col et fermeture au moyen de\nboutons-pression nacrés devant. Poches de poitrine à rabat pressionné.\nManches longues terminées par poignet boutonné. Empiècement devant et\ndans le dos. Base arrondie.', 3, 'imgs/produits/femme/chemises/chf010937_1.jpeg', 1),
(39, 10, 1, 3, 9, 'Chemise en jean', 24.99, 'ref0101-0309-10', 'Chemise en denim lavé. Modèle avec col et fermeture au moyen de\nboutons-pression nacrés devant. Poches de poitrine à rabat pressionné.\nManches longues terminées par poignet boutonné. Empiècement devant et\ndans le dos. Base arrondie.', 3, 'imgs/produits/femme/chemises/chf010937_1.jpeg', 1),
(40, 11, 2, 1, 11, 'Pantalon habillé', 29.99, 'ref0102-0111-11', 'Pantalon tissé. Modèle taille haute avec plis couchés en haut\net braguette zippée surmontée d’une agrafe. Poches latérales et\nfausses poches dans le dos. Jambes effilées, de longueur cheville,\navec plis marqués. ', 3, 'imgs/produits/femme/pantalons/paf011140_1.jpeg', 1),
(41, 11, 2, 2, 11, 'Pantalon habillé', 29.99, 'ref0102-0211-11', 'Pantalon tissé. Modèle taille haute avec plis couchés en haut\net braguette zippée surmontée d’une agrafe. Poches latérales et\nfausses poches dans le dos. Jambes effilées, de longueur cheville,\navec plis marqués. ', 3, 'imgs/produits/femme/pantalons/paf011140_1.jpeg', 1),
(42, 11, 2, 3, 11, 'Pantalon habillé', 29.99, 'ref0102-0311-11', 'Pantalon tissé. Modèle taille haute avec plis couchés en haut\net braguette zippée surmontée d’une agrafe. Poches latérales et\nfausses poches dans le dos. Jambes effilées, de longueur cheville,\navec plis marqués. ', 3, 'imgs/produits/femme/pantalons/paf011140_1.jpeg', 1),
(43, 11, 2, 1, 2, 'Pantalon habillé', 29.99, 'ref0102-0102-11', 'Pantalon tissé. Modèle taille haute avec plis couchés en haut\net braguette zippée surmontée d’une agrafe. Poches latérales et\nfausses poches dans le dos. Jambes effilées, de longueur cheville,\navec plis marqués. ', 3, 'imgs/produits/femme/pantalons/paf010243_1.jpeg', 1),
(44, 11, 2, 2, 2, 'Pantalon habillé', 29.99, 'ref0102-0202-11', 'Pantalon tissé. Modèle taille haute avec plis couchés en haut\net braguette zippée surmontée d’une agrafe. Poches latérales et\nfausses poches dans le dos. Jambes effilées, de longueur cheville,\navec plis marqués. ', 3, 'imgs/produits/femme/pantalons/paf010243_1.jpeg', 1),
(45, 11, 2, 3, 2, 'Pantalon habillé', 29.99, 'ref0102-0302-11', 'Pantalon tissé. Modèle taille haute avec plis couchés en haut\net braguette zippée surmontée d’une agrafe. Poches latérales et\nfausses poches dans le dos. Jambes effilées, de longueur cheville,\navec plis marqués. ', 3, 'imgs/produits/femme/pantalons/paf010243_1.jpeg', 1),
(46, 12, 2, 1, 5, 'Jean large', 19.99, 'ref0102-0105-12', 'Jean en denim extensible. Modèle taille haute avec braguette\nzippée surmontée d’un bouton, poche à monnaie et poches dans le dos.\nJambes amples et droites de longueur cheville. Le coton contenu dans cet\narticle est partiellement d’origine recyclée.', 3, 'imgs/produits/femme/pantalons/paf010546_1.jpeg', 1),
(47, 12, 2, 2, 5, 'Jean large', 19.99, 'ref0102-0205-12', 'Jean en denim extensible. Modèle taille haute avec braguette\nzippée surmontée d’un bouton, poche à monnaie et poches dans le dos.\nJambes amples et droites de longueur cheville. Le coton contenu dans cet\narticle est partiellement d’origine recyclée.', 3, 'imgs/produits/femme/pantalons/paf010546_1.jpeg', 1),
(48, 12, 2, 3, 5, 'Jean large', 19.99, 'ref0102-0305-12', 'Jean en denim extensible. Modèle taille haute avec braguette\nzippée surmontée d’un bouton, poche à monnaie et poches dans le dos.\nJambes amples et droites de longueur cheville. Le coton contenu dans cet\narticle est partiellement d’origine recyclée.', 3, 'imgs/produits/femme/pantalons/paf010546_1.jpeg', 1),
(49, 13, 2, 1, 12, 'Pantalon ample en lin mélangé', 49.99, 'ref0102-0112-13', 'Pantalon en tissu de lin et coton mélangés. Modèle taille haute avec braguette\nzippée surmontée d’un bouton. Poches latérales et poches dans le dos. Jambes très\nlongues, amples et droites, avec plis cousus devant.', 3, 'imgs/produits/femme/pantalons/paf011249_1.jpeg', 1),
(50, 13, 2, 2, 12, 'Pantalon ample en lin mélangé', 49.99, 'ref0102-0212-13', 'Pantalon en tissu de lin et coton mélangés. Modèle taille haute avec braguette\nzippée surmontée d’un bouton. Poches latérales et poches dans le dos. Jambes très\nlongues, amples et droites, avec plis cousus devant.', 3, 'imgs/produits/femme/pantalons/paf011249_1.jpeg', 1),
(51, 13, 2, 3, 12, 'Pantalon ample en lin mélangé', 49.99, 'ref0102-0312-13', 'Pantalon en tissu de lin et coton mélangés. Modèle taille haute avec braguette\nzippée surmontée d’un bouton. Poches latérales et poches dans le dos. Jambes très\nlongues, amples et droites, avec plis cousus devant.', 3, 'imgs/produits/femme/pantalons/paf011249_1.jpeg', 1),
(52, 14, 2, 1, 12, 'Pantalon cigarette', 29.99, 'ref0102-0112-14', 'Pantalon cigarette tissé. Modèle taille haute avec braguette zippée\net fermeture par agrafe. Poches latérales obliques et fausses poches dans le dos.\nJambes fines, de longueur cheville, avec plis marqués. ', 3, 'imgs/produits/femme/pantalons/paf011252_1.jpeg', 1),
(53, 14, 2, 2, 12, 'Pantalon cigarette', 29.99, 'ref0102-0212-14', 'Pantalon cigarette tissé. Modèle taille haute avec braguette zippée\net fermeture par agrafe. Poches latérales obliques et fausses poches dans le dos.\nJambes fines, de longueur cheville, avec plis marqués. ', 3, 'imgs/produits/femme/pantalons/paf011252_1.jpeg', 1),
(54, 14, 2, 3, 12, 'Pantalon cigarette', 29.99, 'ref0102-0312-14', 'Pantalon cigarette tissé. Modèle taille haute avec braguette zippée\net fermeture par agrafe. Poches latérales obliques et fausses poches dans le dos.\nJambes fines, de longueur cheville, avec plis marqués. ', 3, 'imgs/produits/femme/pantalons/paf011252_1.jpeg', 1),
(55, 15, 3, 1, 2, 'Robe en mousseline', 24.99, 'ref0103-0102-15', 'Robe trapèze courte en mousseline froissée. Modèle avec col mao et\nboutons habillés en haut. Longues manches bouffantes terminées par petit\npoignet à bouton habillé. Découpe à la taille et sur la jupe.', 3, 'imgs/produits/femme/robes/rof010255_1.jpeg', 1),
(56, 15, 3, 2, 2, 'Robe en mousseline', 24.99, 'ref0103-0202-15', 'Robe trapèze courte en mousseline froissée. Modèle avec col mao et\nboutons habillés en haut. Longues manches bouffantes terminées par petit\npoignet à bouton habillé. Découpe à la taille et sur la jupe.', 3, 'imgs/produits/femme/robes/rof010255_1.jpeg', 1),
(57, 15, 3, 3, 2, 'Robe en mousseline', 24.99, 'ref0103-0302-15', 'Robe trapèze courte en mousseline froissée. Modèle avec col mao et\nboutons habillés en haut. Longues manches bouffantes terminées par petit\npoignet à bouton habillé. Découpe à la taille et sur la jupe.  ', 3, 'imgs/produits/femme/robes/rof010255_1.jpeg', 1),
(58, 15, 3, 1, 12, 'Robe en mousseline', 24.99, 'ref0103-0112-15', 'Robe trapèze courte en mousseline froissée. Modèle avec col mao et\nboutons habillés en haut. Longues manches bouffantes terminées par petit\npoignet à bouton habillé. Découpe à la taille et sur la jupe.', 3, 'imgs/produits/femme/robes/rof011258_1.jpeg', 1),
(59, 15, 3, 2, 12, 'Robe en mousseline', 24.99, 'ref0103-0212-15', 'Robe trapèze courte en mousseline froissée. Modèle avec col mao et\nboutons habillés en haut. Longues manches bouffantes terminées par petit\npoignet à bouton habillé. Découpe à la taille et sur la jupe.', 3, 'imgs/produits/femme/robes/rof011258_1.jpeg', 1),
(60, 15, 3, 3, 12, 'Robe en mousseline', 24.99, 'ref0103-0312-15', 'Robe trapèze courte en mousseline froissée. Modèle avec col mao et\nboutons habillés en haut. Longues manches bouffantes terminées par petit\npoignet à bouton habillé. Découpe à la taille et sur la jupe.  ', 3, 'imgs/produits/femme/robes/rof011258_1.jpeg', 1),
(61, 16, 3, 1, 1, 'Robe en maille', 24.99, 'ref0103-0101-16', 'Robe courte en maille douce. Modèle avec encolure ronde, emmanchures\ndescendues et longues manches ballon. Finition côtelée à l\'encolure,\naux poignets et à la base.', 3, 'imgs/produits/femme/robes/rof010161_1.jpeg', 1),
(62, 16, 3, 2, 1, 'Robe en maille', 24.99, 'ref0103-0201-16', 'Robe courte en maille douce. Modèle avec encolure ronde, emmanchures\ndescendues et longues manches ballon. Finition côtelée à l\'encolure,\naux poignets et à la base.', 3, 'imgs/produits/femme/robes/rof010161_1.jpeg', 1),
(63, 16, 3, 3, 1, 'Robe en maille', 24.99, 'ref0103-0301-16', 'Robe courte en maille douce. Modèle avec encolure ronde, emmanchures\ndescendues et longues manches ballon. Finition côtelée à l\'encolure,\naux poignets et à la base.', 3, 'imgs/produits/femme/robes/rof010161_1.jpeg', 1),
(64, 17, 3, 1, 2, 'Robe à col volanté', 29.99, 'ref0103-0102-17', 'Robe courte tissée. Coupe droite avec col volanté montant, empiècement\net boutons habillés devant. Manches bouffantes longues et amples, terminées par\npetite fente boutonnée. Non doublée.', 3, 'imgs/produits/femme/robes/rof010264_1.jpeg', 1),
(65, 17, 3, 2, 2, 'Robe à col volanté', 29.99, 'ref0103-0202-17', 'Robe courte tissée. Coupe droite avec col volanté montant, empiècement\net boutons habillés devant. Manches bouffantes longues et amples, terminées par\npetite fente boutonnée. Non doublée.', 3, 'imgs/produits/femme/robes/rof010264_1.jpeg', 1),
(66, 17, 3, 3, 2, 'Robe à col volanté', 29.99, 'ref0103-0302-17', 'Robe courte tissée. Coupe droite avec col volanté montant, empiècement\net boutons habillés devant. Manches bouffantes longues et amples, terminées par\npetite fente boutonnée. Non doublée.', 3, 'imgs/produits/femme/robes/rof010264_1.jpeg', 1),
(67, 18, 4, 1, 2, 'Jupe trapèze', 19.99, 'ref0104-0102-18', 'Jupe trapèze courte. Modèle taille haute avec boutonnage devant.', 3, 'imgs/produits/femme/jupes/juf010267_1.jpeg', 1),
(68, 18, 4, 2, 2, 'Jupe trapèze', 19.99, 'ref0104-0202-18', 'Jupe trapèze courte. Modèle taille haute avec boutonnage devant.', 3, 'imgs/produits/femme/jupes/juf010267_1.jpeg', 1),
(69, 18, 4, 3, 2, 'Jupe trapèze', 19.99, 'ref0104-0302-18', 'Jupe trapèze courte. Modèle taille haute avec boutonnage devant.', 3, 'imgs/produits/femme/jupes/juf010267_1.jpeg', 1),
(70, 18, 4, 1, 9, 'Jupe trapèze', 19.99, 'ref0104-0109-18', 'Jupe trapèze courte. Modèle taille haute avec boutonnage devant.', 3, 'imgs/produits/femme/jupes/juf010970_1.jpeg', 1),
(71, 18, 4, 2, 9, 'Jupe trapèze', 19.99, 'ref0104-0209-18', 'Jupe trapèze courte. Modèle taille haute avec boutonnage devant.', 3, 'imgs/produits/femme/jupes/juf010970_1.jpeg', 1),
(72, 18, 4, 3, 9, 'Jupe trapèze', 19.99, 'ref0104-0309-18', 'Jupe trapèze courte. Modèle taille haute avec boutonnage devant.', 3, 'imgs/produits/femme/jupes/juf010970_1.jpeg', 1),
(73, 19, 4, 1, 2, 'Jupe corolle', 14.99, 'ref0104-0102-19', 'Jupe corolle en jersey de bonne tenue. Modèle court avec élastique à la\ntaille et fermeture à glissière apparente dans le dos. Non doublée.', 3, 'imgs/produits/femme/jupes/juf010273_1.jpeg', 1),
(74, 19, 4, 2, 2, 'Jupe corolle', 14.99, 'ref0104-0202-19', 'Jupe corolle en jersey de bonne tenue. Modèle court avec élastique à la\ntaille et fermeture à glissière apparente dans le dos. Non doublée.', 3, 'imgs/produits/femme/jupes/juf010273_1.jpeg', 1),
(75, 19, 4, 3, 2, 'Jupe corolle', 14.99, 'ref0104-0302-19', 'Jupe corolle en jersey de bonne tenue. Modèle court avec élastique à la\ntaille et fermeture à glissière apparente dans le dos. Non doublée.', 3, 'imgs/produits/femme/jupes/juf010273_1.jpeg', 1),
(76, 20, 4, 1, 4, 'Jupe courte', 19.99, 'ref0104-0104-20', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/jupes/juf010476_1.jpeg', 1),
(77, 20, 4, 2, 4, 'Jupe courte', 19.99, 'ref0104-0204-20', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/jupes/juf010476_1.jpeg', 1),
(78, 20, 4, 3, 4, 'Jupe courte', 19.99, 'ref0104-0304-20', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/jupes/juf010476_1.jpeg', 1),
(79, 21, 5, 4, 12, 'Bottines Chelsea', 34.99, 'ref0105-0412-21', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/chaussures/caf041279_1.jpeg', 1),
(80, 21, 5, 5, 12, 'Bottines Chelsea', 34.99, 'ref0105-0512-21', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/chaussures/caf041279_1.jpeg', 1),
(81, 21, 5, 6, 12, 'Bottines Chelsea', 34.99, 'ref0105-0612-21', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/chaussures/caf041279_1.jpeg', 1),
(82, 21, 5, 7, 12, 'Bottines Chelsea', 34.99, 'ref0105-0712-21', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/chaussures/caf041279_1.jpeg', 1),
(83, 21, 5, 8, 12, 'Bottines Chelsea', 34.99, 'ref0105-0812-21', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/chaussures/caf041279_1.jpeg', 1),
(84, 21, 5, 9, 12, 'Bottines Chelsea', 34.99, 'ref0105-0912-21', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/chaussures/caf041279_1.jpeg', 1),
(85, 21, 5, 10, 12, 'Bottines Chelsea', 34.99, 'ref0105-1012-21', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/chaussures/caf041279_1.jpeg', 1),
(86, 21, 5, 11, 12, 'Bottines Chelsea', 34.99, 'ref0105-1112-21', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/chaussures/caf041279_1.jpeg', 1),
(87, 21, 5, 12, 12, 'Bottines Chelsea', 34.99, 'ref0105-1212-21', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/chaussures/caf041279_1.jpeg', 1),
(88, 21, 5, 13, 12, 'Bottines Chelsea', 34.99, 'ref0105-1312-21', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/chaussures/caf041279_1.jpeg', 1),
(89, 21, 5, 14, 12, 'Bottines Chelsea', 34.99, 'ref0105-1412-21', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/chaussures/caf041279_1.jpeg', 1),
(90, 21, 5, 15, 12, 'Bottines Chelsea', 34.99, 'ref0105-1512-21', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/chaussures/caf041279_1.jpeg', 1),
(91, 21, 5, 16, 12, 'Bottines Chelsea', 34.99, 'ref0105-1612-21', 'Jupe courte en tissu à la surface brossée. Modèle taille haute avec\nfermeture à glissière dissimulé d’un côté. Doublure en polyester recyclé.', 3, 'imgs/produits/femme/chaussures/caf041279_1.jpeg', 1),
(92, 22, 6, 1, 2, 'Surchemise en twill', 29.99, 'ref0206-0102-22', 'Surchemise en twill. Modèle avec col, boutonnage devant et empiècement dans le dos.\nPoches de poitrine à rabat boutonné. Manches longues terminées par poignet boutonné.', 3, 'imgs/produits/homme/chemises/chh010292_1.jpeg', 1),
(93, 22, 6, 2, 2, 'Surchemise en twill', 29.99, 'ref0206-0202-22', 'Surchemise en twill. Modèle avec col, boutonnage devant et empiècement dans le dos.\nPoches de poitrine à rabat boutonné. Manches longues terminées par poignet boutonné.', 3, 'imgs/produits/homme/chemises/chh010292_1.jpeg', 1),
(94, 22, 6, 3, 2, 'Surchemise en twill', 29.99, 'ref0206-0302-22', 'Surchemise en twill. Modèle avec col, boutonnage devant et empiècement dans le dos.\nPoches de poitrine à rabat boutonné. Manches longues terminées par poignet boutonné.', 3, 'imgs/produits/homme/chemises/chh010292_1.jpeg', 1),
(95, 22, 6, 1, 7, 'Surchemise en twill', 29.99, 'ref0206-0107-22', 'Surchemise en twill. Modèle avec col, boutonnage devant et empiècement dans le dos.\nPoches de poitrine à rabat boutonné. Manches longues terminées par poignet boutonné.', 3, 'imgs/produits/homme/chemises/chh010795_1.jpeg', 1),
(96, 22, 6, 2, 7, 'Surchemise en twill', 29.99, 'ref0206-0207-22', 'Surchemise en twill. Modèle avec col, boutonnage devant et empiècement dans le dos.\nPoches de poitrine à rabat boutonné. Manches longues terminées par poignet boutonné.', 3, 'imgs/produits/homme/chemises/chh010795_1.jpeg', 1),
(97, 22, 6, 3, 7, 'Surchemise en twill', 29.99, 'ref0206-0307-22', 'Surchemise en twill. Modèle avec col, boutonnage devant et empiècement dans le dos.\nPoches de poitrine à rabat boutonné. Manches longues terminées par poignet boutonné.', 3, 'imgs/produits/homme/chemises/chh010795_1.jpeg', 1),
(98, 23, 6, 1, 1, 'Chemise Oxford Muscle Fit', 19.99, 'ref0206-0101-23', 'Chemise extensible en coton Oxford. Modèle avec col américain et boutonnage classique. Manches longues terminées par poignet à boutonnage ajustable. Empiècement\nd’épaules et pinces dans le dos. Base arrondie. Muscle Fit – une coupe avec des épaules resserrées\net des manches effilées pour une silhouette flatteuse, qui met le corps en valeur.', 3, 'imgs/produits/homme/chemises/chh010198_1.jpeg', 1),
(99, 23, 6, 2, 1, 'Chemise Oxford Muscle Fit', 19.99, 'ref0206-0201-23', 'Chemise extensible en coton Oxford. Modèle avec col américain et boutonnage classique. Manches longues terminées par poignet à boutonnage ajustable. Empiècement\nd’épaules et pinces dans le dos. Base arrondie. Muscle Fit – une coupe avec des épaules resserrées\net des manches effilées pour une silhouette flatteuse, qui met le corps en valeur.', 3, 'imgs/produits/homme/chemises/chh010198_1.jpeg', 1),
(100, 23, 6, 3, 1, 'Chemise Oxford Muscle Fit', 19.99, 'ref0206-0301-23', 'Chemise extensible en coton Oxford. Modèle avec col américain et boutonnage classique. Manches longues terminées par poignet à boutonnage ajustable. Empiècement\nd’épaules et pinces dans le dos. Base arrondie. Muscle Fit – une coupe avec des épaules resserrées\net des manches effilées pour une silhouette flatteuse, qui met le corps en valeur.', 3, 'imgs/produits/homme/chemises/chh010198_1.jpeg', 1),
(101, 24, 6, 1, 5, 'Chemise en velours Regular Fit', 19.99, 'ref0206-0105-24', 'Chemise en velours de coton côtelé. Modèle avec col boutonné, poche de poitrine et\nboutonnage classique. Manches longues terminées par fente boutonnée et poignet à boutonnage\najustable. ', 3, 'imgs/produits/homme/chemises/chh0105101_1.jpeg', 1),
(102, 24, 6, 2, 5, 'Chemise en velours Regular Fit', 19.99, 'ref0206-0205-24', 'Chemise en velours de coton côtelé. Modèle avec col boutonné, poche de poitrine et\nboutonnage classique. Manches longues terminées par fente boutonnée et poignet à boutonnage\najustable. ', 3, 'imgs/produits/homme/chemises/chh0105101_1.jpeg', 1),
(103, 24, 6, 3, 5, 'Chemise en velours Regular Fit', 19.99, 'ref0206-0305-24', 'Chemise en velours de coton côtelé. Modèle avec col boutonné, poche de poitrine et\nboutonnage classique. Manches longues terminées par fente boutonnée et poignet à boutonnage\najustable. ', 3, 'imgs/produits/homme/chemises/chh0105101_1.jpeg', 1),
(104, 25, 7, 1, 2, 'Pantalon jogger Slim Fit', 29.99, 'ref0207-0102-25', 'Pantalon jogger tissé. Modèle avec élastique et lien de serrage à la taille.\nPoches latérales obliques et poches passepoilées avec bouton dans le dos, Jambes de longueur\ncheville avec plis marqués et terminées par revers cousu. ', 3, 'imgs/produits/homme/pantalons/pah0102104_1.jpeg', 1),
(105, 25, 7, 2, 2, 'Pantalon jogger Slim Fit', 29.99, 'ref0207-0202-25', 'Pantalon jogger tissé. Modèle avec élastique et lien de serrage à la taille.\nPoches latérales obliques et poches passepoilées avec bouton dans le dos, Jambes de longueur\ncheville avec plis marqués et terminées par revers cousu. ', 3, 'imgs/produits/homme/pantalons/pah0102104_1.jpeg', 1),
(106, 25, 7, 3, 2, 'Pantalon jogger Slim Fit', 29.99, 'ref0207-0302-25', 'Pantalon jogger tissé. Modèle avec élastique et lien de serrage à la taille.\nPoches latérales obliques et poches passepoilées avec bouton dans le dos, Jambes de longueur\ncheville avec plis marqués et terminées par revers cousu. ', 3, 'imgs/produits/homme/pantalons/pah0102104_1.jpeg', 1),
(107, 25, 7, 1, 4, 'Pantalon jogger Slim Fit', 29.99, 'ref0207-0104-25', 'Pantalon jogger tissé. Modèle avec élastique et lien de serrage à la taille.\nPoches latérales obliques et poches passepoilées avec bouton dans le dos, Jambes de longueur\ncheville avec plis marqués et terminées par revers cousu. ', 3, 'imgs/produits/homme/pantalons/pah0104107_1.jpeg', 1),
(108, 25, 7, 2, 4, 'Pantalon jogger Slim Fit', 29.99, 'ref0207-0204-25', 'Pantalon jogger tissé. Modèle avec élastique et lien de serrage à la taille.\nPoches latérales obliques et poches passepoilées avec bouton dans le dos, Jambes de longueur\ncheville avec plis marqués et terminées par revers cousu. ', 3, 'imgs/produits/homme/pantalons/pah0104107_1.jpeg', 1),
(109, 25, 7, 3, 4, 'Pantalon jogger Slim Fit', 29.99, 'ref0207-0304-25', 'Pantalon jogger tissé. Modèle avec élastique et lien de serrage à la taille.\nPoches latérales obliques et poches passepoilées avec bouton dans le dos, Jambes de longueur\ncheville avec plis marqués et terminées par revers cousu. ', 3, 'imgs/produits/homme/pantalons/pah0104107_1.jpeg', 1),
(110, 26, 7, 1, 7, 'Pantalon cargo', 34.99, 'ref0207-0107-26', 'Pantalon cargo en twill de coton extensible. Modèle avec élastique et lien de serrage\nà la taille. Fausse braguette. Poches sur les côtés et dans le dos et poches sur les jambes à\nrabat pressionné.', 3, 'imgs/produits/homme/pantalons/pah0107110_1.jpeg', 1),
(111, 26, 7, 2, 7, 'Pantalon cargo', 34.99, 'ref0207-0207-26', 'Pantalon cargo en twill de coton extensible. Modèle avec élastique et lien de serrage\nà la taille. Fausse braguette. Poches sur les côtés et dans le dos et poches sur les jambes à\nrabat pressionné.', 3, 'imgs/produits/homme/pantalons/pah0107110_1.jpeg', 1),
(112, 26, 7, 3, 7, 'Pantalon cargo', 34.99, 'ref0207-0307-26', 'Pantalon cargo en twill de coton extensible. Modèle avec élastique et lien de serrage\nà la taille. Fausse braguette. Poches sur les côtés et dans le dos et poches sur les jambes à\nrabat pressionné.', 3, 'imgs/produits/homme/pantalons/pah0107110_1.jpeg', 1),
(113, 27, 8, 9, 1, 'Baskets', 24.99, 'ref0208-0901-27', 'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette\nmatelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.\nMotif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', 3, 'imgs/produits/homme/chaussures/cah0901113_1.jpeg', 1),
(114, 27, 8, 10, 1, 'Baskets', 24.99, 'ref0208-1001-27', 'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette\nmatelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.\nMotif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', 3, 'imgs/produits/homme/chaussures/cah0901113_1.jpeg', 1),
(115, 27, 8, 11, 1, 'Baskets', 24.99, 'ref0208-1101-27', 'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette\nmatelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.\nMotif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', 3, 'imgs/produits/homme/chaussures/cah0901113_1.jpeg', 1),
(116, 27, 8, 12, 1, 'Baskets', 24.99, 'ref0208-1201-27', 'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette\nmatelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.\nMotif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', 3, 'imgs/produits/homme/chaussures/cah0901113_1.jpeg', 1),
(117, 27, 8, 13, 1, 'Baskets', 24.99, 'ref0208-1301-27', 'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette\nmatelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.\nMotif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', 3, 'imgs/produits/homme/chaussures/cah0901113_1.jpeg', 1),
(118, 27, 8, 14, 1, 'Baskets', 24.99, 'ref0208-1401-27', 'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette\nmatelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.\nMotif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', 3, 'imgs/produits/homme/chaussures/cah0901113_1.jpeg', 1),
(119, 27, 8, 15, 1, 'Baskets', 24.99, 'ref0208-1501-27', 'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette\nmatelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.\nMotif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', 3, 'imgs/produits/homme/chaussures/cah0901113_1.jpeg', 1),
(120, 27, 8, 16, 1, 'Baskets', 24.99, 'ref0208-1601-27', 'Baskets en imitation cuir. Modèle avec bord matelassé autour de l’ouverture, languette\nmatelassée et laçage sur le dessus. Détails contrastants en suédine sur le bout et l’arrière.\nMotif imprimé sur la languette et sur un côté. Doublure et semelle intérieure en mesh. ', 3, 'imgs/produits/homme/chaussures/cah0901113_1.jpeg', 1),
(121, 28, 9, 1, 1, 'Blouse avec dentelle', 12.99, 'ref0309-0101-28', 'Blouse trapèze en viscose tissée. Modèle double épaisseur en haut avec empiècement\nen dentelle. Longues manches bouffantes terminées par mince élastique et petit bord volanté.\nPetite ouverture dans le dos surmontée d’un bouton sur la nuque.', 3, 'imgs/produits/fille/chemises/chi0101121_1.jpeg', 1),
(122, 28, 9, 2, 1, 'Blouse avec dentelle', 12.99, 'ref0309-0201-28', 'Blouse trapèze en viscose tissée. Modèle double épaisseur en haut avec empiècement\nen dentelle. Longues manches bouffantes terminées par mince élastique et petit bord volanté.\nPetite ouverture dans le dos surmontée d’un bouton sur la nuque.', 3, 'imgs/produits/fille/chemises/chi0101121_1.jpeg', 1),
(123, 28, 9, 3, 1, 'Blouse avec dentelle', 12.99, 'ref0309-0301-28', 'Blouse trapèze en viscose tissée. Modèle double épaisseur en haut avec empiècement\nen dentelle. Longues manches bouffantes terminées par mince élastique et petit bord volanté.\nPetite ouverture dans le dos surmontée d’un bouton sur la nuque.', 3, 'imgs/produits/fille/chemises/chi0101121_1.jpeg', 1),
(124, 28, 9, 1, 13, 'Blouse avec dentelle', 12.99, 'ref0309-0113-28', 'Blouse trapèze en viscose tissée. Modèle double épaisseur en haut avec empiècement\nen dentelle. Longues manches bouffantes terminées par mince élastique et petit bord volanté.\nPetite ouverture dans le dos surmontée d’un bouton sur la nuque.', 3, 'imgs/produits/fille/chemises/chi0113124_1.jpeg', 1),
(125, 28, 9, 2, 13, 'Blouse avec dentelle', 12.99, 'ref0309-0213-28', 'Blouse trapèze en viscose tissée. Modèle double épaisseur en haut avec empiècement\nen dentelle. Longues manches bouffantes terminées par mince élastique et petit bord volanté.\nPetite ouverture dans le dos surmontée d’un bouton sur la nuque.', 3, 'imgs/produits/fille/chemises/chi0113124_1.jpeg', 1),
(126, 28, 9, 3, 13, 'Blouse avec dentelle', 12.99, 'ref0309-0313-28', 'Blouse trapèze en viscose tissée. Modèle double épaisseur en haut avec empiècement\nen dentelle. Longues manches bouffantes terminées par mince élastique et petit bord volanté.\nPetite ouverture dans le dos surmontée d’un bouton sur la nuque.', 3, 'imgs/produits/fille/chemises/chi0113124_1.jpeg', 1),
(127, 29, 9, 1, 1, 'Blouse à plis nervure', 19.99, 'ref0309-0101-29', 'Exclusivité enfants. Blouse en tissu de coton bio avec plis nervure et rubans de\ndentelle incrustés en haut. Modèle avec manches longues terminées par mince élastique.\nDécoupe légèrement froncée en haut. Boutons nacrés dans le dos.', 3, 'imgs/produits/fille/chemises/chi0101127_1.jpeg', 1),
(128, 29, 9, 2, 1, 'Blouse à plis nervure', 19.99, 'ref0309-0201-29', 'Exclusivité enfants. Blouse en tissu de coton bio avec plis nervure et rubans de\ndentelle incrustés en haut. Modèle avec manches longues terminées par mince élastique.\nDécoupe légèrement froncée en haut. Boutons nacrés dans le dos.', 3, 'imgs/produits/fille/chemises/chi0101127_1.jpeg', 1),
(129, 29, 9, 3, 1, 'Blouse à plis nervure', 19.99, 'ref0309-0301-29', 'Exclusivité enfants. Blouse en tissu de coton bio avec plis nervure et rubans de\ndentelle incrustés en haut. Modèle avec manches longues terminées par mince élastique.\nDécoupe légèrement froncée en haut. Boutons nacrés dans le dos.', 3, 'imgs/produits/fille/chemises/chi0101127_1.jpeg', 1),
(130, 30, 10, 1, 10, 'Legging en denim', 9.99, 'ref0310-0110-30', 'Legging en denim extensible lavé. Modèle avec élastique à la taille, fausses poches\ndevant et vraies poches dans le dos.', 3, 'imgs/produits/fille/pantalons/pai0110130_1.jpeg', 1),
(131, 30, 10, 2, 10, 'Legging en denim', 9.99, 'ref0310-0210-30', 'Legging en denim extensible lavé. Modèle avec élastique à la taille, fausses poches\ndevant et vraies poches dans le dos.', 3, 'imgs/produits/fille/pantalons/pai0110130_1.jpeg', 1),
(132, 30, 10, 3, 10, 'Legging en denim', 9.99, 'ref0310-0310-30', 'Legging en denim extensible lavé. Modèle avec élastique à la taille, fausses poches\ndevant et vraies poches dans le dos.', 3, 'imgs/produits/fille/pantalons/pai0110130_1.jpeg', 1),
(133, 30, 10, 1, 4, 'Legging en denim', 9.99, 'ref0310-0104-30', 'Legging en denim extensible lavé. Modèle avec élastique à la taille, fausses poches\ndevant et vraies poches dans le dos.', 3, 'imgs/produits/fille/pantalons/pai0104133_1.jpeg', 1),
(134, 30, 10, 2, 4, 'Legging en denim', 9.99, 'ref0310-0204-30', 'Legging en denim extensible lavé. Modèle avec élastique à la taille, fausses poches\ndevant et vraies poches dans le dos.', 3, 'imgs/produits/fille/pantalons/pai0104133_1.jpeg', 1),
(135, 30, 10, 3, 4, 'Legging en denim', 9.99, 'ref0310-0304-30', 'Legging en denim extensible lavé. Modèle avec élastique à la taille, fausses poches\ndevant et vraies poches dans le dos.', 3, 'imgs/produits/fille/pantalons/pai0104133_1.jpeg', 1),
(136, 31, 10, 1, 3, 'Tregging', 9.99, 'ref0310-0103-31', 'Tregging en molleton de coton. Coupe très près du corps avec bord-côte élastique à\nla taille qui facilite l’habillage. ', 3, 'imgs/produits/fille/pantalons/pai0103136_1.jpeg', 1),
(137, 31, 10, 2, 3, 'Tregging', 9.99, 'ref0310-0203-31', 'Tregging en molleton de coton. Coupe très près du corps avec bord-côte élastique à\nla taille qui facilite l’habillage. ', 3, 'imgs/produits/fille/pantalons/pai0103136_1.jpeg', 1),
(138, 31, 10, 3, 3, 'Tregging ', 9.99, 'ref0310-0303-31', 'Tregging en molleton de coton. Coupe très près du corps avec bord-côte élastique à\nla taille qui facilite l’habillage. ', 3, 'imgs/produits/fille/pantalons/pai0103136_1.jpeg', 1),
(139, 32, 11, 1, 14, 'Robe en velours côtelé', 19.99, 'ref0311-0114-32', 'Robe en doux velours de coton côtelé. Modèle avec empiècement bordé d’un volant,\npetite ouverture dans le dos surmontée d’un bouton sur la nuque et découpes froncées\nsur la jupe. ', 3, 'imgs/produits/fille/robes/roi0114139_1.jpeg', 1),
(140, 32, 11, 2, 14, 'Robe en velours côtelé', 19.99, 'ref0311-0214-32', 'Robe en doux velours de coton côtelé. Modèle avec empiècement bordé d’un volant,\npetite ouverture dans le dos surmontée d’un bouton sur la nuque et découpes froncées\nsur la jupe. ', 3, 'imgs/produits/fille/robes/roi0114139_1.jpeg', 1),
(141, 32, 11, 3, 14, 'Robe en velours côtelé', 19.99, 'ref0311-0314-32', 'Robe en doux velours de coton côtelé. Modèle avec empiècement bordé d’un volant,\npetite ouverture dans le dos surmontée d’un bouton sur la nuque et découpes froncées\nsur la jupe. ', 3, 'imgs/produits/fille/robes/roi0114139_1.jpeg', 1),
(142, 32, 11, 1, 3, 'Robe en velours côtelé', 19.99, 'ref0311-0103-32', 'Robe en doux velours de coton côtelé. Modèle avec empiècement bordé d’un volant,\npetite ouverture dans le dos surmontée d’un bouton sur la nuque et découpes froncées\nsur la jupe. ', 3, 'imgs/produits/fille/robes/roi0103142_1.jpeg', 1),
(143, 32, 11, 2, 3, 'Robe en velours côtelé', 19.99, 'ref0311-0203-32', 'Robe en doux velours de coton côtelé. Modèle avec empiècement bordé d’un volant,\npetite ouverture dans le dos surmontée d’un bouton sur la nuque et découpes froncées\nsur la jupe. ', 3, 'imgs/produits/fille/robes/roi0103142_1.jpeg', 1),
(144, 32, 11, 3, 3, 'Robe en velours côtelé', 19.99, 'ref0311-0303-32', 'Robe en doux velours de coton côtelé. Modèle avec empiècement bordé d’un volant,\npetite ouverture dans le dos surmontée d’un bouton sur la nuque et découpes froncées\nsur la jupe. ', 3, 'imgs/produits/fille/robes/roi0103142_1.jpeg', 1),
(145, 33, 11, 1, 9, 'Robe chemise en denim', 19.99, 'ref0311-0109-33', 'Robe en denim de bonne tenue. Modèle avec col, poches de poitrine et boutonnage\ndevant. Manches longues terminées par poignet boutonné. Empiècement avec pli creux dans\nle dos. ', 3, 'imgs/produits/fille/robes/roi0109145_1.jpeg', 1),
(146, 33, 11, 2, 9, 'Robe chemise en denim', 19.99, 'ref0311-0209-33', 'Robe en denim de bonne tenue. Modèle avec col, poches de poitrine et boutonnage\ndevant. Manches longues terminées par poignet boutonné. Empiècement avec pli creux dans\nle dos. ', 3, 'imgs/produits/fille/robes/roi0109145_1.jpeg', 1),
(147, 33, 11, 3, 9, 'Robe chemise en denim', 19.99, 'ref0311-0309-33', 'Robe en denim de bonne tenue. Modèle avec col, poches de poitrine et boutonnage\ndevant. Manches longues terminées par poignet boutonné. Empiècement avec pli creux dans\nle dos. ', 3, 'imgs/produits/fille/robes/roi0109145_1.jpeg', 1),
(148, 34, 12, 1, 14, 'Jupe en velours côtelé', 12.99, 'ref0312-0114-34', 'Jupe corolle en velours de coton doux et côtelé. Modèle avec petit bord volanté\nen haut, élastique habillé à la taille et découpe froncée à la base. Non doublée.', 3, 'imgs/produits/fille/jupes/jui0114148_1.jpeg', 1),
(149, 34, 12, 2, 14, 'Jupe en velours côtelé', 12.99, 'ref0312-0214-34', 'Jupe corolle en velours de coton doux et côtelé. Modèle avec petit bord volanté\nen haut, élastique habillé à la taille et découpe froncée à la base. Non doublée.', 3, 'imgs/produits/fille/jupes/jui0114148_1.jpeg', 1),
(150, 34, 12, 3, 14, 'Jupe en velours côtelé', 12.99, 'ref0312-0314-34', 'Jupe corolle en velours de coton doux et côtelé. Modèle avec petit bord volanté\nen haut, élastique habillé à la taille et découpe froncée à la base. Non doublée.', 3, 'imgs/produits/fille/jupes/jui0114148_1.jpeg', 1),
(151, 34, 12, 1, 3, 'Jupe en velours côtelé', 12.99, 'ref0312-0103-34', 'Jupe corolle en velours de coton doux et côtelé. Modèle avec petit bord volanté\nen haut, élastique habillé à la taille et découpe froncée à la base. Non doublée.', 3, 'imgs/produits/fille/jupes/jui0103151_1.jpeg', 1),
(152, 34, 12, 2, 3, 'Jupe en velours côtelé', 12.99, 'ref0312-0203-34', 'Jupe corolle en velours de coton doux et côtelé. Modèle avec petit bord volanté\nen haut, élastique habillé à la taille et découpe froncée à la base. Non doublée.', 3, 'imgs/produits/fille/jupes/jui0103151_1.jpeg', 1),
(153, 34, 12, 3, 3, 'Jupe en velours côtelé', 12.99, 'ref0312-0303-34', 'Jupe corolle en velours de coton doux et côtelé. Modèle avec petit bord volanté\nen haut, élastique habillé à la taille et découpe froncée à la base. Non doublée.', 3, 'imgs/produits/fille/jupes/jui0103151_1.jpeg', 1),
(154, 35, 12, 1, 2, 'Jupe plissée', 17.99, 'ref0312-0102-35', 'Jupe plissée en tissu vaporeux. Modèle avec élastique habillé à la\ntaille. Doublée.', 3, 'imgs/produits/fille/jupes/jui0102154_1.jpeg', 1),
(155, 35, 12, 2, 2, 'Jupe plissée', 17.99, 'ref0312-0202-35', 'Jupe plissée en tissu vaporeux. Modèle avec élastique habillé à la\ntaille. Doublée.', 3, 'imgs/produits/fille/jupes/jui0102154_1.jpeg', 1),
(156, 35, 12, 3, 2, 'Jupe plissée', 17.99, 'ref0312-0302-35', 'Jupe plissée en tissu vaporeux. Modèle avec élastique habillé à la\ntaille. Doublée.', 3, 'imgs/produits/fille/jupes/jui0102154_1.jpeg', 1),
(157, 36, 13, 1, 3, 'Chemise en flanelle', 14.99, 'ref0413-0103-36', 'Chemise en douce flanelle de coton. Modèle avec col, poche de poitrine et\nboutonnage devant. Manches longues terminées par poignet boutonné. Empiècement\ndouble épaisseur dans le dos. Base fortement arrondie.', 3, 'imgs/produits/garcon/chemises/chg0103157_1.jpeg', 1),
(158, 36, 13, 2, 3, 'Chemise en flanelle', 14.99, 'ref0413-0203-36', 'Chemise en douce flanelle de coton. Modèle avec col, poche de poitrine et\nboutonnage devant. Manches longues terminées par poignet boutonné. Empiècement\ndouble épaisseur dans le dos. Base fortement arrondie.', 3, 'imgs/produits/garcon/chemises/chg0103157_1.jpeg', 1);
INSERT INTO `produits` (`id_produit`, `id_modele`, `cat_produit_id`, `taille_id`, `couleur_id`, `libelle_prod`, `prix_prod`, `ref_prod`, `description_prod`, `quantite`, `img_default`, `statut_produit`) VALUES
(159, 36, 13, 3, 3, 'Chemise en flanelle', 14.99, 'ref0413-0303-36', 'Chemise en douce flanelle de coton. Modèle avec col, poche de poitrine et\nboutonnage devant. Manches longues terminées par poignet boutonné. Empiècement\ndouble épaisseur dans le dos. Base fortement arrondie.', 3, 'imgs/produits/garcon/chemises/chg0103157_1.jpeg', 1),
(160, 36, 13, 1, 5, 'Chemise en flanelle', 14.99, 'ref0413-0105-36', 'Chemise en douce flanelle de coton. Modèle avec col, poche de poitrine et\nboutonnage devant. Manches longues terminées par poignet boutonné. Empiècement\ndouble épaisseur dans le dos. Base fortement arrondie.', 3, 'imgs/produits/garcon/chemises/chg0105160_1.jpeg', 1),
(161, 36, 13, 2, 5, 'Chemise en flanelle', 14.99, 'ref0413-0205-36', 'Chemise en douce flanelle de coton. Modèle avec col, poche de poitrine et\nboutonnage devant. Manches longues terminées par poignet boutonné. Empiècement\ndouble épaisseur dans le dos. Base fortement arrondie.', 3, 'imgs/produits/garcon/chemises/chg0105160_1.jpeg', 1),
(162, 36, 13, 3, 5, 'Chemise en flanelle', 14.99, 'ref0413-0305-36', 'Chemise en douce flanelle de coton. Modèle avec col, poche de poitrine et\nboutonnage devant. Manches longues terminées par poignet boutonné. Empiècement\ndouble épaisseur dans le dos. Base fortement arrondie.', 3, 'imgs/produits/garcon/chemises/chg0105160_1.jpeg', 1),
(163, 37, 13, 1, 1, 'Chemise en coton', 9.99, 'ref0413-0101-37', 'Chemise en coton tissé. Modèle avec col rabattu et boutonnage devant.\nManches longues terminées par poignet boutonné.', 3, 'imgs/produits/garcon/chemises/chg0101163_1.jpeg', 1),
(164, 37, 13, 2, 1, 'Chemise en coton', 9.99, 'ref0413-0201-37', 'Chemise en coton tissé. Modèle avec col rabattu et boutonnage devant.\nManches longues terminées par poignet boutonné.', 3, 'imgs/produits/garcon/chemises/chg0101163_1.jpeg', 1),
(165, 37, 13, 3, 1, 'Chemise en coton', 9.99, 'ref0413-0301-37', 'Chemise en coton tissé. Modèle avec col rabattu et boutonnage devant.\nManches longues terminées par poignet boutonné.', 3, 'imgs/produits/garcon/chemises/chg0101163_1.jpeg', 1),
(166, 38, 14, 1, 2, 'Skinny Fit Jeans', 9.99, 'ref0414-0102-38', 'Jean en denim extensible lavé. Coupe étroite avec élastique réglable à la\ntaille, braguette zippée et bouton-pression. Poches devant et dans le dos.\nBas de jambe étroit.', 3, 'imgs/produits/garcon/pantalons/pag0102166_1.jpeg', 1),
(167, 38, 14, 2, 2, 'Skinny Fit Jeans', 9.99, 'ref0414-0202-38', 'Jean en denim extensible lavé. Coupe étroite avec élastique réglable à la\ntaille, braguette zippée et bouton-pression. Poches devant et dans le dos.\nBas de jambe étroit.', 3, 'imgs/produits/garcon/pantalons/pag0102166_1.jpeg', 1),
(168, 38, 14, 3, 2, 'Skinny Fit Jeans', 9.99, 'ref0414-0302-38', 'Jean en denim extensible lavé. Coupe étroite avec élastique réglable à la\ntaille, braguette zippée et bouton-pression. Poches devant et dans le dos.\nBas de jambe étroit.', 3, 'imgs/produits/garcon/pantalons/pag0102166_1.jpeg', 1),
(169, 38, 14, 1, 4, 'Skinny Fit Jeans', 9.99, 'ref0414-0104-38', 'Jean en denim extensible lavé. Coupe étroite avec élastique réglable à la\ntaille, braguette zippée et bouton-pression. Poches devant et dans le dos.\nBas de jambe étroit.', 3, 'imgs/produits/garcon/pantalons/pag0104169_1.jpeg', 1),
(170, 38, 14, 2, 4, 'Skinny Fit Jeans', 9.99, 'ref0414-0204-38', 'Jean en denim extensible lavé. Coupe étroite avec élastique réglable à la\ntaille, braguette zippée et bouton-pression. Poches devant et dans le dos.\nBas de jambe étroit.', 3, 'imgs/produits/garcon/pantalons/pag0104169_1.jpeg', 1),
(171, 38, 14, 3, 4, 'Skinny Fit Jeans', 9.99, 'ref0414-0304-38', 'Jean en denim extensible lavé. Coupe étroite avec élastique réglable à la\ntaille, braguette zippée et bouton-pression. Poches devant et dans le dos.\nBas de jambe étroit.', 3, 'imgs/produits/garcon/pantalons/pag0104169_1.jpeg', 1),
(172, 39, 14, 1, 5, 'Pantalon Slim Fit', 9.99, 'ref0414-0105-39', 'Pantalon en doux velours de coton finement côtelé. Coupe étroite avec\nélastique réglable à la taille et braguette zippée surmontée d’un bouton-pression.\nPoches devant et dans le dos.', 3, 'imgs/produits/garcon/pantalons/pag0105172_1.jpeg', 1),
(173, 39, 14, 2, 5, 'Pantalon Slim Fit', 9.99, 'ref0414-0205-39', 'Pantalon en doux velours de coton finement côtelé. Coupe étroite avec\nélastique réglable à la taille et braguette zippée surmontée d’un bouton-pression.\nPoches devant et dans le dos.', 3, 'imgs/produits/garcon/pantalons/pag0105172_1.jpeg', 1),
(174, 39, 14, 3, 5, 'Pantalon Slim Fit', 9.99, 'ref0414-0305-39', 'Pantalon en doux velours de coton finement côtelé. Coupe étroite avec\nélastique réglable à la taille et braguette zippée surmontée d’un bouton-pression.\nPoches devant et dans le dos.', 3, 'imgs/produits/garcon/pantalons/pag0105172_1.jpeg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `tailles`
--

DROP TABLE IF EXISTS `tailles`;
CREATE TABLE IF NOT EXISTS `tailles` (
  `id_taille` smallint(6) NOT NULL AUTO_INCREMENT,
  `taille` varchar(40) NOT NULL,
  `statut_taille` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_taille`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tailles`
--

INSERT INTO `tailles` (`id_taille`, `taille`, `statut_taille`) VALUES
(1, 'S', 1),
(2, 'M', 1),
(3, 'L', 1),
(4, '34', 1),
(5, '35', 1),
(6, '36', 1),
(7, '37', 1),
(8, '38', 1),
(9, '39', 1),
(10, '40', 1),
(11, '41', 1),
(12, '42', 1),
(13, '43', 1),
(14, '44', 1),
(15, '45', 1),
(16, '46', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id_utilisateur` smallint(6) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `motDePasse` varchar(255) NOT NULL,
  `dateNaissance` date NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `codepostal` varchar(255) DEFAULT NULL,
  `pays` varchar(255) DEFAULT NULL,
  `statut_utilisateur` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id_utilisateur`, `prenom`, `nom`, `email`, `motDePasse`, `dateNaissance`, `adresse`, `ville`, `codepostal`, `pays`, `statut_utilisateur`) VALUES
(1, 'Pablo', 'Perez', 'pabloperez@gmail.com', 'abc', '1986-09-19', '4 rue La Libération', 'Nancy', '54000', 'France', 1),
(2, 'Laura Sofia', 'Masmela', 'laura@gmail.com', '$2y$10$Wjyd5l5nWEPsgjQZg8iOP.jccD4MBS7bfZu5Yz06gz8OelB9kfnh6', '1989-03-05', '123 rue Lalala', 'Metz', '57000', 'France', 1),
(3, 'Jean ', 'Pi', 'jp@gmail.com', '$2y$10$CdpyodDU/0sWUP/mzYswe.d49AdqMv4B5Bq2n33ScHyu4tw/c82ku', '1985-04-03', NULL, NULL, NULL, NULL, NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categorie_produit`
--
ALTER TABLE `categorie_produit`
  ADD CONSTRAINT `fk_categoriePersonneId` FOREIGN KEY (`cat_personne_id`) REFERENCES `categorie_personne` (`id_cat_personne`);

--
-- Contraintes pour la table `imgs`
--
ALTER TABLE `imgs`
  ADD CONSTRAINT `fk_couleurImgId` FOREIGN KEY (`couleur_id`) REFERENCES `couleurs` (`id_couleur`),
  ADD CONSTRAINT `fk_produitId` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id_produit`);

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `fk_categorieProduitId` FOREIGN KEY (`cat_produit_id`) REFERENCES `categorie_produit` (`id_cat_produit`),
  ADD CONSTRAINT `fk_couleurId` FOREIGN KEY (`couleur_id`) REFERENCES `couleurs` (`id_couleur`),
  ADD CONSTRAINT `fk_tailleId` FOREIGN KEY (`taille_id`) REFERENCES `tailles` (`id_taille`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
