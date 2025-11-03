-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : lun. 03 nov. 2025 à 11:05
-- Version du serveur : 11.3.2-MariaDB
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `emusic`
--

-- --------------------------------------------------------

--
-- Structure de la table `accessoire`
--

DROP TABLE IF EXISTS `accessoire`;
CREATE TABLE IF NOT EXISTS `accessoire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instrument_id` int(11) DEFAULT NULL,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8FD026ACF11D9C` (`instrument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `classe_instrument`
--

DROP TABLE IF EXISTS `classe_instrument`;
CREATE TABLE IF NOT EXISTS `classe_instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classe_instrument`
--

INSERT INTO `classe_instrument` (`id`, `libelle`) VALUES
(1, 'Cordes'),
(2, 'Vent'),
(3, 'Percussion'),
(4, 'Clavier'),
(5, 'Cuivres'),
(6, 'Bois'),
(7, 'Électronique'),
(8, 'Cordes pincées'),
(9, 'Cordes frottées'),
(10, 'Batterie');

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

DROP TABLE IF EXISTS `compte`;
CREATE TABLE IF NOT EXISTS `compte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifiant` varchar(50) NOT NULL,
  `motDePasse` varchar(512) NOT NULL,
  `idRole` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role` (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `identifiant`, `motDePasse`, `idRole`) VALUES
(1, 'testEleve', 'MPeleve', 1),
(2, 'testProfesseur', 'MPprofesseur', 2),
(3, 'testGestionnaire', 'MPgestionnaire', 3);

-- --------------------------------------------------------

--
-- Structure de la table `contrat_pret`
--

DROP TABLE IF EXISTS `contrat_pret`;
CREATE TABLE IF NOT EXISTS `contrat_pret` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instrument_id` int(11) NOT NULL,
  `id_eleve_id` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `attestation_assurance` varchar(100) NOT NULL,
  `etat_detaille_debut` varchar(100) NOT NULL,
  `etat_detaille_retour` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1FB84C67CF11D9C` (`instrument_id`),
  KEY `IDX_1FB84C675AB72B27` (`id_eleve_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `couleur`
--

DROP TABLE IF EXISTS `couleur`;
CREATE TABLE IF NOT EXISTS `couleur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `couleur`
--

INSERT INTO `couleur` (`id`, `nom`) VALUES
(1, 'Rouge'),
(2, 'Bleu'),
(3, 'Vert'),
(4, 'Jaune'),
(5, 'Noir'),
(6, 'Blanc'),
(7, 'Orange'),
(8, 'Violet'),
(9, 'Rose'),
(10, 'Gris'),
(11, 'Marron'),
(12, 'Turquoise'),
(13, 'Cyan'),
(14, 'Magenta'),
(15, 'Beige');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `jour_id` int(11) DEFAULT NULL,
  `id_professeur_id` int(11) NOT NULL,
  `id_type_instrument_id` int(11) NOT NULL,
  `age_mini` double NOT NULL,
  `age_maxi` double NOT NULL,
  `nb_places` int(11) NOT NULL,
  `heure_debut` time NOT NULL,
  `heure_fin` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FDCA8C9CC54C8C93` (`type_id`),
  KEY `IDX_FDCA8C9C220C6AD0` (`jour_id`),
  KEY `IDX_FDCA8C9C49AFF8C` (`id_professeur_id`),
  KEY `IDX_FDCA8C9CFF3E1806` (`id_type_instrument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20251015065634', '2025-10-15 06:56:59', 17580);

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tranche_id` int(11) DEFAULT NULL,
  `responsable_id` int(11) DEFAULT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `num_rue` int(11) NOT NULL,
  `rue` varchar(100) NOT NULL,
  `cpos` varchar(10) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `mail` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ECA105F7B76F6B31` (`tranche_id`),
  KEY `IDX_ECA105F753C59D72` (`responsable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cours_id` int(11) DEFAULT NULL,
  `eleve_id` int(11) DEFAULT NULL,
  `date_inscription` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5E90F6D67ECF78B0` (`cours_id`),
  KEY `IDX_5E90F6D6A6CC7B2` (`eleve_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `instrument`
--

DROP TABLE IF EXISTS `instrument`;
CREATE TABLE IF NOT EXISTS `instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_marque_id` int(11) NOT NULL,
  `id_type_instrument_id` int(11) NOT NULL,
  `num_serie` int(11) DEFAULT NULL,
  `date_achat` date DEFAULT NULL,
  `prix_achat` int(11) DEFAULT NULL,
  `utilisation` varchar(50) DEFAULT NULL,
  `chemin_image` varchar(200) DEFAULT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3CBF69DDC8120595` (`id_marque_id`),
  KEY `IDX_3CBF69DDFF3E1806` (`id_type_instrument_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `instrument`
--

INSERT INTO `instrument` (`id`, `id_marque_id`, `id_type_instrument_id`, `num_serie`, `date_achat`, `prix_achat`, `utilisation`, `chemin_image`, `code`) VALUES
(1, 1, 1, 10001, '2020-01-15', 1200, 'Local', '../../assets/images/instruments/1.jpg', 'GUI-1'),
(2, 2, 1, 10002, '2021-03-22', 1250, 'Prêt', '../../assets/images/instruments/2.jpg', 'GUI-2'),
(3, 3, 2, 20001, '2019-07-10', 900, 'Local', '../../assets/images/instruments/3.jpg', 'VIO-1'),
(4, 4, 2, 20002, '2020-09-18', 950, 'Prêt', '../../assets/images/instruments/4.jpg', 'VIO-2'),
(5, 5, 3, 30001, '2018-11-05', 600, 'Local', '../../assets/images/instruments/5.jpg', 'FLU-1'),
(6, 6, 3, 30002, '2019-12-15', 620, 'Prêt', '../../assets/images/instruments/6.jpg', 'FLU-2'),
(7, 7, 4, 40001, '2021-01-10', 1400, 'Local', '../../assets/images/instruments/7.jpg', 'CLA-1'),
(8, 8, 4, 40002, '2022-02-20', 1450, 'Prêt', '../../assets/images/instruments/8.jpg', 'CLA-2'),
(9, 9, 5, 50001, '2017-06-30', 300, 'Local', '../../assets/images/instruments/9.jpg', 'CAI-1'),
(10, 10, 5, 50002, '2018-08-25', 320, 'Prêt', '../../assets/images/instruments/10.jpg', 'CAI-2'),
(11, 1, 6, 60001, '2020-05-12', 700, 'Local', '../../assets/images/instruments/11.jpg', 'TAM-1'),
(12, 2, 6, 60002, '2021-07-14', 730, 'Prêt', '../../assets/images/instruments/12.jpg', 'TAM-2'),
(13, 3, 7, 70001, '2019-03-01', 850, 'Local', '../../assets/images/instruments/13.jpg', 'PIA-1'),
(14, 4, 7, 70002, '2020-04-05', 870, 'Prêt', '../../assets/images/instruments/14.jpg', 'PIA-2'),
(15, 5, 8, 80001, '2018-10-18', 1100, 'Local', '../../assets/images/instruments/15.jpg', 'SYN-1'),
(16, 6, 8, 80002, '2019-11-20', 1150, 'Prêt', '../../assets/images/instruments/16.jpg', 'SYN-2'),
(17, 7, 9, 90001, '2021-08-15', 1300, 'Local', '../../assets/images/instruments/17.jpg', 'TRO-1'),
(18, 8, 9, 90002, '2022-09-25', 1350, 'Prêt', '../../assets/images/instruments/18.jpg', 'TRO-2'),
(19, 9, 10, 100001, '2017-12-01', 1600, 'Local', '../../assets/images/instruments/19.jpg', 'TRO-1'),
(20, 10, 10, 100002, '2018-01-10', 1650, 'Prêt', '../../assets/images/instruments/20.jpg', 'TRO-2'),
(21, 1, 11, 110001, '2019-04-12', 750, 'Local', '../../assets/images/instruments/21.jpg', 'HAU-1'),
(22, 2, 11, 110002, '2020-06-14', 780, 'Prêt', '../../assets/images/instruments/22.jpg', 'HAU-2'),
(23, 3, 12, 120001, '2021-07-10', 820, 'Local', '../../assets/images/instruments/23.jpg', 'BAS-1'),
(24, 4, 12, 120002, '2022-08-11', 850, 'Prêt', '../../assets/images/instruments/24.jpg', 'BAS-2'),
(25, 5, 13, 130001, '2018-02-01', 900, 'Local', '../../assets/images/instruments/25.jpg', 'BOI-1'),
(26, 6, 13, 130002, '2019-03-02', 940, 'Prêt', '../../assets/images/instruments/26.jpg', 'BOI-2'),
(27, 7, 14, 140001, '2020-04-03', 1000, 'Local', '../../assets/images/instruments/27.jpg', 'PED-1'),
(28, 8, 14, 140002, '2021-05-04', 1050, 'Prêt', '../../assets/images/instruments/28.jpg', 'PED-2'),
(29, 9, 15, 150001, '2017-09-15', 1200, 'Local', '../../assets/images/instruments/29.jpg', 'UKU-1'),
(30, 10, 15, 150002, '2018-10-16', 1250, 'Prêt', '../../assets/images/instruments/30.jpg', 'UKU-2'),
(31, 1, 16, 160001, '2019-11-17', 1300, 'Local', '../../assets/images/instruments/31.jpg', 'HAR-1'),
(32, 2, 16, 160002, '2020-12-18', 1350, 'Prêt', '../../assets/images/instruments/32.jpg', 'HAR-2'),
(33, 3, 17, 170001, '2021-01-19', 1400, 'Local', '../../assets/images/instruments/33.jpg', 'VIO-1'),
(34, 4, 17, 170002, '2022-02-20', 1450, 'Prêt', '../../assets/images/instruments/34.jpg', 'VIO-2'),
(35, 5, 18, 180001, '2018-03-21', 1500, 'Local', '../../assets/images/instruments/35.jpg', 'ALT-1'),
(36, 6, 18, 180002, '2019-04-22', 1550, 'Prêt', '../../assets/images/instruments/36.jpg', 'ALT-2'),
(37, 7, 19, 190001, '2020-05-23', 1600, 'Local', '../../assets/images/instruments/37.jpg', 'BAT-1'),
(38, 8, 19, 190002, '2021-06-24', 1650, 'Prêt', '../../assets/images/instruments/38.jpg', 'BAT-2'),
(39, 9, 20, 200001, '2017-07-25', 1700, 'Local', '../../assets/images/instruments/39.jpg', 'CON-1'),
(40, 10, 20, 200002, '2018-08-26', 1750, 'Prêt', '../../assets/images/instruments/40.jpg', 'CON-2');

-- --------------------------------------------------------

--
-- Structure de la table `instrument_couleur`
--

DROP TABLE IF EXISTS `instrument_couleur`;
CREATE TABLE IF NOT EXISTS `instrument_couleur` (
  `instrument_id` int(11) NOT NULL,
  `couleur_id` int(11) NOT NULL,
  PRIMARY KEY (`instrument_id`,`couleur_id`),
  KEY `IDX_443EF844CF11D9C` (`instrument_id`),
  KEY `IDX_443EF844C31BA576` (`couleur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

DROP TABLE IF EXISTS `intervention`;
CREATE TABLE IF NOT EXISTS `intervention` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `professionnel_id` int(11) NOT NULL,
  `instrument_id` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `descriptif` varchar(255) NOT NULL,
  `prix` double NOT NULL,
  `quotite` double NOT NULL,
  `professionnel` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D11814AB8A49CC82` (`professionnel_id`),
  KEY `IDX_D11814ABCF11D9C` (`instrument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jour`
--

DROP TABLE IF EXISTS `jour`;
CREATE TABLE IF NOT EXISTS `jour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id`, `libelle`) VALUES
(1, 'Fender'),
(2, 'Gibson'),
(3, 'Yamaha'),
(4, 'Roland'),
(5, 'Korg'),
(6, 'Marshall'),
(7, 'Pearl'),
(8, 'Shure'),
(9, 'Boss'),
(10, 'Ibanez');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `metier`
--

DROP TABLE IF EXISTS `metier`;
CREATE TABLE IF NOT EXISTS `metier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
CREATE TABLE IF NOT EXISTS `paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inscription_id` int(11) DEFAULT NULL,
  `montant` int(11) NOT NULL,
  `date_paiement` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B1DC7A1E5DAC5993` (`inscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `num_rue` int(11) DEFAULT NULL,
  `rue` varchar(100) DEFAULT NULL,
  `cpos` varchar(10) DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `tel` varchar(10) DEFAULT NULL,
  `mail` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id`, `nom`, `prenom`, `num_rue`, `rue`, `cpos`, `ville`, `tel`, `mail`) VALUES
(1, 'Martin', 'Sophie', 12, 'Rue des Lilas', '14000', 'Caen', '0231456789', 'sophie.martin@example.com'),
(2, 'Dubois', 'Jean', 45, 'Avenue Victor Hugo', '14610', 'Épron', '0231454321', 'jean.dubois@example.com'),
(3, 'Lemoine', 'Claire', 7, 'Boulevard Saint-Michel', '14123', 'Ifs', '0231467890', 'claire.lemoine@example.com'),
(4, 'Moreau', 'Paul', 23, 'Rue de la Paix', '14200', 'Hérouville-Saint-Clair', '0231476543', 'paul.moreau@example.com'),
(5, 'Rousseau', 'Amélie', 18, 'Place de la République', '14530', 'Bretteville-sur-Odon', '0231487654', 'amelie.rousseau@example.com'),
(6, 'Bernard', 'Luc', 9, 'Rue Lafayette', '14460', 'Bayeux', '0231498765', 'luc.bernard@example.com'),
(7, 'Petit', 'Élodie', 56, 'Rue du Faubourg', '14790', 'Colombelles', '0231409876', 'elodie.petit@example.com'),
(8, 'Lefevre', 'Marc', 31, 'Rue des Fleurs', '14320', 'Cabourg', '0231412345', 'marc.lefevre@example.com'),
(9, 'Girard', 'Isabelle', 14, 'Avenue des Champs', '14250', 'Merville-Franceville-Plage', '0231423456', 'isabelle.girard@example.com'),
(10, 'Faure', 'Nicolas', 5, 'Rue Victor Hugo', '14130', 'Isigny-sur-Mer', '0231434567', 'nicolas.faure@example.com');

-- --------------------------------------------------------

--
-- Structure de la table `professionnel`
--

DROP TABLE IF EXISTS `professionnel`;
CREATE TABLE IF NOT EXISTS `professionnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `num_rue` double NOT NULL,
  `rue` varchar(150) NOT NULL,
  `cpos` varchar(10) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `mail` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `professionnel_metier`
--

DROP TABLE IF EXISTS `professionnel_metier`;
CREATE TABLE IF NOT EXISTS `professionnel_metier` (
  `professionnel_id` int(11) NOT NULL,
  `metier_id` int(11) NOT NULL,
  PRIMARY KEY (`professionnel_id`,`metier_id`),
  KEY `IDX_715C73CA8A49CC82` (`professionnel_id`),
  KEY `IDX_715C73CAED16FA20` (`metier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `responsable`
--

DROP TABLE IF EXISTS `responsable`;
CREATE TABLE IF NOT EXISTS `responsable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tranche_id` int(11) DEFAULT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `num_rue` int(11) NOT NULL,
  `rue` varchar(100) NOT NULL,
  `cpos` varchar(10) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `mail` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_52520D07B76F6B31` (`tranche_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `libelle`) VALUES
(1, 'Eleve'),
(2, 'Professeur'),
(3, 'Gestionnaire');

-- --------------------------------------------------------

--
-- Structure de la table `tarif`
--

DROP TABLE IF EXISTS `tarif`;
CREATE TABLE IF NOT EXISTS `tarif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `montant` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tranche`
--

DROP TABLE IF EXISTS `tranche`;
CREATE TABLE IF NOT EXISTS `tranche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarif_id` int(11) DEFAULT NULL,
  `libelle` varchar(100) NOT NULL,
  `quotient_mini` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_66675840357C0A59` (`tarif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarif_id` int(11) DEFAULT NULL,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8CDE5729357C0A59` (`tarif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_instrument`
--

DROP TABLE IF EXISTS `type_instrument`;
CREATE TABLE IF NOT EXISTS `type_instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_classe_instrument_id` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_21BCBFF8C2776E15` (`id_classe_instrument_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_instrument`
--

INSERT INTO `type_instrument` (`id`, `id_classe_instrument_id`, `libelle`) VALUES
(1, 1, 'Guitare électrique'),
(2, 1, 'Violon'),
(3, 2, 'Flûte traversière'),
(4, 2, 'Clarinette'),
(5, 3, 'Caisse claire'),
(6, 3, 'Tambourin'),
(7, 4, 'Piano'),
(8, 4, 'Synthétiseur'),
(9, 5, 'Trompette'),
(10, 5, 'Trombone'),
(11, 6, 'Hautbois'),
(12, 6, 'Basson'),
(13, 7, 'Boîte à rythmes'),
(14, 7, 'Pédale d’effets'),
(15, 8, 'Ukulélé'),
(16, 8, 'Harpe'),
(17, 9, 'Violoncelle'),
(18, 9, 'Alto'),
(19, 10, 'Batterie acoustique'),
(20, 10, 'Conga');

-- --------------------------------------------------------

--
-- Structure de la table `type_instrument_professeur`
--

DROP TABLE IF EXISTS `type_instrument_professeur`;
CREATE TABLE IF NOT EXISTS `type_instrument_professeur` (
  `type_instrument_id` int(11) NOT NULL,
  `professeur_id` int(11) NOT NULL,
  PRIMARY KEY (`type_instrument_id`,`professeur_id`),
  KEY `IDX_A39FA53D7C1CAAA9` (`type_instrument_id`),
  KEY `IDX_A39FA53DBAB22EE9` (`professeur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_instrument_professeur`
--

INSERT INTO `type_instrument_professeur` (`type_instrument_id`, `professeur_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 3),
(13, 6),
(14, 3),
(15, 5),
(16, 7),
(17, 10),
(18, 7),
(19, 9);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `accessoire`
--
ALTER TABLE `accessoire`
  ADD CONSTRAINT `FK_8FD026ACF11D9C` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`);

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`idRole`) REFERENCES `role` (`id`);

--
-- Contraintes pour la table `contrat_pret`
--
ALTER TABLE `contrat_pret`
  ADD CONSTRAINT `FK_1FB84C675AB72B27` FOREIGN KEY (`id_eleve_id`) REFERENCES `eleve` (`id`),
  ADD CONSTRAINT `FK_1FB84C67CF11D9C` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`);

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `FK_FDCA8C9C220C6AD0` FOREIGN KEY (`jour_id`) REFERENCES `jour` (`id`),
  ADD CONSTRAINT `FK_FDCA8C9C49AFF8C` FOREIGN KEY (`id_professeur_id`) REFERENCES `professeur` (`id`),
  ADD CONSTRAINT `FK_FDCA8C9CC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `FK_FDCA8C9CFF3E1806` FOREIGN KEY (`id_type_instrument_id`) REFERENCES `type_instrument` (`id`);

--
-- Contraintes pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD CONSTRAINT `FK_ECA105F753C59D72` FOREIGN KEY (`responsable_id`) REFERENCES `responsable` (`id`),
  ADD CONSTRAINT `FK_ECA105F7B76F6B31` FOREIGN KEY (`tranche_id`) REFERENCES `tranche` (`id`);

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `FK_5E90F6D67ECF78B0` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `FK_5E90F6D6A6CC7B2` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`);

--
-- Contraintes pour la table `instrument`
--
ALTER TABLE `instrument`
  ADD CONSTRAINT `FK_3CBF69DDC8120595` FOREIGN KEY (`id_marque_id`) REFERENCES `marque` (`id`),
  ADD CONSTRAINT `FK_3CBF69DDFF3E1806` FOREIGN KEY (`id_type_instrument_id`) REFERENCES `type_instrument` (`id`);

--
-- Contraintes pour la table `instrument_couleur`
--
ALTER TABLE `instrument_couleur`
  ADD CONSTRAINT `FK_443EF844C31BA576` FOREIGN KEY (`couleur_id`) REFERENCES `couleur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_443EF844CF11D9C` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `FK_D11814AB8A49CC82` FOREIGN KEY (`professionnel_id`) REFERENCES `professionnel` (`id`),
  ADD CONSTRAINT `FK_D11814ABCF11D9C` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`);

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `FK_B1DC7A1E5DAC5993` FOREIGN KEY (`inscription_id`) REFERENCES `inscription` (`id`);

--
-- Contraintes pour la table `professionnel_metier`
--
ALTER TABLE `professionnel_metier`
  ADD CONSTRAINT `FK_715C73CA8A49CC82` FOREIGN KEY (`professionnel_id`) REFERENCES `professionnel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_715C73CAED16FA20` FOREIGN KEY (`metier_id`) REFERENCES `metier` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `responsable`
--
ALTER TABLE `responsable`
  ADD CONSTRAINT `FK_52520D07B76F6B31` FOREIGN KEY (`tranche_id`) REFERENCES `tranche` (`id`);

--
-- Contraintes pour la table `tranche`
--
ALTER TABLE `tranche`
  ADD CONSTRAINT `FK_66675840357C0A59` FOREIGN KEY (`tarif_id`) REFERENCES `tarif` (`id`);

--
-- Contraintes pour la table `type`
--
ALTER TABLE `type`
  ADD CONSTRAINT `FK_8CDE5729357C0A59` FOREIGN KEY (`tarif_id`) REFERENCES `tarif` (`id`);

--
-- Contraintes pour la table `type_instrument`
--
ALTER TABLE `type_instrument`
  ADD CONSTRAINT `FK_21BCBFF8C2776E15` FOREIGN KEY (`id_classe_instrument_id`) REFERENCES `classe_instrument` (`id`);

--
-- Contraintes pour la table `type_instrument_professeur`
--
ALTER TABLE `type_instrument_professeur`
  ADD CONSTRAINT `FK_A39FA53D7C1CAAA9` FOREIGN KEY (`type_instrument_id`) REFERENCES `type_instrument` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A39FA53DBAB22EE9` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
