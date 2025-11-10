-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : lun. 10 nov. 2025 à 11:06
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `accessoire`
--

INSERT INTO `accessoire` (`id`, `instrument_id`, `libelle`) VALUES
(1, 1, 'Housse Orgue'),
(2, 1, 'Tabouret Orgue'),
(3, 1, 'Pédale Sustain'),
(4, 1, 'Adaptateur Orgue'),
(5, 1, 'Protection Clavier'),
(6, 6, 'Housse Piano'),
(7, 6, 'Tabouret Piano'),
(8, 6, 'Couvre-Touches'),
(9, 6, 'Métronome Piano'),
(10, 6, 'Lampe Piano'),
(11, 16, 'Sangle Guitare'),
(12, 16, 'Capodastre'),
(13, 16, 'Médiators Pack'),
(14, 16, 'Câble Jack'),
(15, 16, 'Accordeur Guitare'),
(16, 21, 'Sangle Basse'),
(17, 21, 'Câble Basse'),
(18, 21, 'Housse Basse'),
(19, 21, 'Accordeur Basse'),
(20, 21, 'Médiators Basse'),
(21, 26, 'Etui Saxophone'),
(22, 26, 'Bec Saxophone'),
(23, 26, 'Ligature Saxophone'),
(24, 26, 'Cordon Saxophone'),
(25, 26, 'Anches Saxophone'),
(26, 56, 'Étui Violon'),
(27, 56, 'Archet Violon'),
(28, 56, 'Colophane'),
(29, 56, 'Sangle Violon'),
(30, 56, 'Mallette Violon'),
(31, 61, 'Étui Violoncelle'),
(32, 61, 'Archet Violoncelle'),
(33, 61, 'Colophane Violoncelle'),
(34, 61, 'Support Violoncelle'),
(35, 61, 'Sangle Violoncelle'),
(36, 66, 'Étui Harpe'),
(37, 66, 'Cordes Harpe'),
(38, 66, 'Mallette Harpe'),
(39, 66, 'Protection Harpe'),
(40, 66, 'Accordeur Harpe'),
(41, 71, 'Baguettes Batterie'),
(42, 71, 'Housse Batterie'),
(43, 71, 'Peaux de rechange'),
(44, 71, 'Tabouret Batterie'),
(45, 71, 'Mallette Batterie'),
(46, 11, 'Clé Trombone'),
(47, 41, 'Bec Trombone'),
(48, 41, 'Huile Trombone'),
(49, 46, 'Étui Trompette'),
(50, 51, 'Sangle Tuba');

-- --------------------------------------------------------

--
-- Structure de la table `classe_instrument`
--

DROP TABLE IF EXISTS `classe_instrument`;
CREATE TABLE IF NOT EXISTS `classe_instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classe_instrument`
--

INSERT INTO `classe_instrument` (`id`, `libelle`) VALUES
(1, 'Clavier'),
(2, 'Instrument amplifiés'),
(3, 'Bois'),
(4, 'Cuivre'),
(5, 'Corde'),
(6, 'Percussion');

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

DROP TABLE IF EXISTS `compte`;
CREATE TABLE IF NOT EXISTS `compte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifiant` varchar(50) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `idRole` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role` (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `identifiant`, `mdp`, `idRole`) VALUES
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
  `eleve_id` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `attestation_assurance` varchar(100) NOT NULL,
  `etat_detaille_debut` varchar(100) NOT NULL,
  `etat_detaille_retour` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1FB84C67CF11D9C` (`instrument_id`),
  KEY `IDX_1FB84C67A6CC7B2` (`eleve_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contrat_pret`
--

INSERT INTO `contrat_pret` (`id`, `instrument_id`, `eleve_id`, `date_debut`, `date_fin`, `attestation_assurance`, `etat_detaille_debut`, `etat_detaille_retour`) VALUES
(1, 1, 1, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(2, 2, 2, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(3, 3, 3, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(4, 4, 4, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(5, 5, 5, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(6, 6, 6, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(7, 7, 7, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(8, 8, 8, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(9, 9, 9, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(10, 10, 10, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(11, 11, 11, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(12, 12, 12, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(13, 13, 13, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(14, 14, 14, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(15, 15, 15, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(16, 16, 16, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(17, 17, 17, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(18, 18, 18, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(19, 19, 19, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon'),
(20, 20, 20, '2025-09-01', '2026-06-30', 'oui', 'bon', 'bon');

-- --------------------------------------------------------

--
-- Structure de la table `couleur`
--

DROP TABLE IF EXISTS `couleur`;
CREATE TABLE IF NOT EXISTS `couleur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `couleur`
--

INSERT INTO `couleur` (`id`, `nom`) VALUES
(1, 'Noir'),
(2, 'Blanc'),
(3, 'Rouge'),
(4, 'Bleu'),
(5, 'Naturel');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `jour_id` int(11) DEFAULT NULL,
  `professeur_id` int(11) NOT NULL,
  `type_instrument_id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `age_mini` double NOT NULL,
  `age_maxi` double DEFAULT NULL,
  `nb_places` int(11) NOT NULL,
  `heure_debut` time NOT NULL,
  `heure_fin` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FDCA8C9CC54C8C93` (`type_id`),
  KEY `IDX_FDCA8C9C220C6AD0` (`jour_id`),
  KEY `IDX_FDCA8C9CBAB22EE9` (`professeur_id`),
  KEY `IDX_FDCA8C9C7C1CAAA9` (`type_instrument_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `type_id`, `jour_id`, `professeur_id`, `type_instrument_id`, `libelle`, `age_mini`, `age_maxi`, `nb_places`, `heure_debut`, `heure_fin`) VALUES
(1, 2, 3, 1, 1, 'Orgue - Groupe A', 6, 12, 8, '16:00:00', '17:00:00'),
(2, 1, 5, 2, 1, 'Orgue - Individuel', 14, NULL, 0, '10:00:00', '10:45:00'),
(3, 2, 3, 3, 2, 'Piano - Débutants', 6, 12, 10, '17:00:00', '18:00:00'),
(4, 1, 4, 1, 2, 'Piano - Individuel', 15, NULL, 0, '09:00:00', '09:45:00'),
(5, 2, 2, 4, 3, 'Clavier amplifié - Groupe', 8, 14, 8, '18:00:00', '19:00:00'),
(6, 1, 6, 5, 3, 'Clavier amplifié - Individuel', 16, NULL, 0, '11:00:00', '11:45:00'),
(7, 2, 1, 6, 4, 'Guitare électrique - Groupe', 10, 16, 10, '18:00:00', '19:00:00'),
(8, 1, 2, 7, 4, 'Guitare électrique - Individuel', 18, NULL, 0, '12:00:00', '12:45:00'),
(9, 2, 3, 8, 5, 'Basse électrique - Groupe', 10, 16, 6, '19:00:00', '20:00:00'),
(10, 1, 4, 9, 5, 'Basse électrique - Individuel', 18, NULL, 0, '13:00:00', '13:45:00'),
(11, 2, 5, 10, 6, 'Saxophone - Groupe', 9, 13, 5, '16:00:00', '17:00:00'),
(12, 1, 6, 1, 6, 'Saxophone - Individuel', 14, NULL, 0, '14:00:00', '14:45:00'),
(13, 2, 1, 2, 7, 'Clarinette - Groupe', 8, 12, 6, '15:00:00', '16:00:00'),
(14, 1, 2, 3, 7, 'Clarinette - Individuel', 13, NULL, 0, '10:30:00', '11:15:00'),
(15, 2, 3, 4, 8, 'Flûte - Groupe', 8, 12, 6, '11:00:00', '12:00:00'),
(16, 1, 4, 5, 8, 'Flûte - Individuel', 13, NULL, 0, '09:30:00', '10:15:00'),
(17, 2, 5, 6, 9, 'Trombone - Groupe', 10, 18, 6, '17:00:00', '18:00:00'),
(18, 1, 6, 7, 9, 'Trombone - Individuel', 15, NULL, 0, '08:30:00', '09:15:00'),
(19, 2, 1, 8, 10, 'Trompette - Groupe', 10, 18, 6, '17:30:00', '18:30:00'),
(20, 1, 2, 9, 10, 'Trompette - Individuel', 15, NULL, 0, '11:30:00', '12:15:00'),
(21, 2, 3, 10, 11, 'Tuba - Groupe', 10, 18, 5, '16:30:00', '17:30:00'),
(22, 1, 4, 1, 11, 'Tuba - Individuel', 15, NULL, 0, '15:00:00', '15:45:00'),
(23, 2, 5, 2, 12, 'Violon - Groupe', 6, 12, 8, '14:00:00', '15:00:00'),
(24, 1, 6, 3, 12, 'Violon - Individuel', 13, NULL, 0, '10:00:00', '10:45:00'),
(25, 2, 1, 4, 13, 'Violoncelle - Groupe', 8, 14, 6, '15:30:00', '16:30:00'),
(26, 1, 2, 5, 13, 'Violoncelle - Individuel', 14, NULL, 0, '13:30:00', '14:15:00'),
(27, 2, 3, 6, 14, 'Harpe - Groupe', 8, 14, 5, '12:00:00', '13:00:00'),
(28, 1, 4, 7, 14, 'Harpe - Individuel', 15, NULL, 0, '09:00:00', '09:45:00'),
(29, 2, 5, 8, 15, 'Batterie - Groupe', 8, 14, 6, '18:00:00', '19:00:00'),
(30, 1, 6, 9, 15, 'Batterie - Individuel', 15, NULL, 0, '16:00:00', '16:45:00');

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
('DoctrineMigrations\\Version20251103145541', '2025-11-03 14:55:45', 16057);

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`id`, `tranche_id`, `responsable_id`, `nom`, `prenom`, `num_rue`, `rue`, `cpos`, `ville`, `tel`, `mail`) VALUES
(1, 1, 1, 'Leroy', 'Ana', 10, 'Rue du Parc', '75020', 'Paris', '0612340001', 'ana.leroy@mail.fr'),
(2, 2, 2, 'Moreau', 'Lucas', 11, 'Rue des Lilas', '75009', 'Paris', '0612340002', 'lucas.moreau@mail.fr'),
(3, 1, 3, 'Nguyen', 'Emma', 12, 'Rue des Fleurs', '34000', 'Montpellier', '0612340003', 'emma.nguyen@mail.fr'),
(4, 3, 4, 'Garcia', 'Sofia', 13, 'Rue du Soleil', '44000', 'Nantes', '0612340004', 'sofia.garcia@mail.fr'),
(5, 2, 5, 'Rossi', 'Matteo', 14, 'Avenue Bleu', '59000', 'Lille', '0612340005', 'matteo.rossi@mail.fr'),
(6, NULL, NULL, 'Dupont', 'Hugo', 15, 'Rue Nationale', '75001', 'Paris', '0612340006', 'hugo.dupont@mail.fr'),
(7, NULL, NULL, 'Simon', 'Lina', 16, 'Rue St Martin', '69002', 'Lyon', '0612340007', 'lina.simon@mail.fr'),
(8, NULL, NULL, 'Faivre', 'Leo', 17, 'Rue du Théâtre', '31000', 'Toulouse', '0612340008', 'leo.faivre@mail.fr'),
(9, NULL, NULL, 'Boulanger', 'Chloe', 18, 'Rue Victor', '13001', 'Marseille', '0612340009', 'chloe.boulanger@mail.fr'),
(10, NULL, NULL, 'Rivet', 'Max', 19, 'Rue Centrale', '67000', 'Strasbourg', '0612340010', 'max.rivet@mail.fr'),
(11, 1, 6, 'Hamel', 'Eva', 20, 'Rue des Prés', '21000', 'Dijon', '0612340011', 'eva.hamel@mail.fr'),
(12, 2, 7, 'Garnier', 'Noah', 21, 'Rue de l\'École', '75003', 'Paris', '0612340012', 'noah.garnier@mail.fr'),
(13, 3, 8, 'Blanc', 'Zoé', 22, 'Rue du Marché', '69003', 'Lyon', '0612340013', 'zoe.blanc@mail.fr'),
(14, 1, 9, 'Mercier', 'Léo', 23, 'Rue des Acacias', '44000', 'Nantes', '0612340014', 'leo.mercier@mail.fr'),
(15, 2, 10, 'Fernandez', 'Mia', 24, 'Rue des Érables', '34000', 'Montpellier', '0612340015', 'mia.fernandez@mail.fr'),
(16, NULL, NULL, 'Rossi', 'Ana', 25, 'Rue du Soleil', '75013', 'Paris', '0612340016', 'ana.rossi@mail.fr'),
(17, NULL, NULL, 'Klein', 'Marc', 26, 'Rue du Théâtre', '69004', 'Lyon', '0612340017', 'marc.klein@mail.fr'),
(18, NULL, NULL, 'Vidal', 'Emma', 27, 'Rue des Champs', '31000', 'Toulouse', '0612340018', 'emma.vidal@mail.fr'),
(19, NULL, NULL, 'Morel', 'Lucas', 28, 'Rue du Parc', '33000', 'Bordeaux', '0612340019', 'lucas.morel@mail.fr'),
(20, NULL, NULL, 'Dupuis', 'Sonia', 29, 'Avenue Bleu', '59000', 'Lille', '0612340020', 'sonia.dupuis@mail.fr');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `cours_id`, `eleve_id`, `date_inscription`) VALUES
(1, 1, 1, '2025-09-01'),
(2, 3, 2, '2025-09-02'),
(3, 5, 3, '2025-09-03'),
(4, 7, 4, '2025-09-04'),
(5, 9, 5, '2025-09-05'),
(6, 11, 6, '2025-09-06'),
(7, 13, 7, '2025-09-07'),
(8, 15, 8, '2025-09-08'),
(9, 17, 9, '2025-09-09'),
(10, 19, 10, '2025-09-10'),
(11, 21, 11, '2025-09-11'),
(12, 23, 12, '2025-09-12'),
(13, 25, 13, '2025-09-13'),
(14, 27, 14, '2025-09-14'),
(15, 29, 15, '2025-09-15'),
(16, 2, 16, '2025-09-16'),
(17, 4, 17, '2025-09-17'),
(18, 6, 18, '2025-09-18'),
(19, 8, 19, '2025-09-19'),
(20, 10, 20, '2025-09-20');

-- --------------------------------------------------------

--
-- Structure de la table `instrument`
--

DROP TABLE IF EXISTS `instrument`;
CREATE TABLE IF NOT EXISTS `instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marque_id` int(11) NOT NULL,
  `type_instrument_id` int(11) NOT NULL,
  `num_serie` int(11) DEFAULT NULL,
  `date_achat` date DEFAULT NULL,
  `prix_achat` int(11) DEFAULT NULL,
  `utilisation` varchar(50) DEFAULT NULL,
  `chemin_image` varchar(200) DEFAULT NULL,
  `code` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3CBF69DD4827B9B2` (`marque_id`),
  KEY `IDX_3CBF69DD7C1CAAA9` (`type_instrument_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `instrument`
--

INSERT INTO `instrument` (`id`, `marque_id`, `type_instrument_id`, `num_serie`, `date_achat`, `prix_achat`, `utilisation`, `chemin_image`, `code`) VALUES
(1, 1, 1, 10001, '2016-01-10', 1500, 'Local', 'instruments/1.jpg', 'ORG1'),
(2, 2, 1, 10002, '2017-03-11', 1600, 'Prêt', 'instruments/2.jpg', 'ORG2'),
(3, 3, 1, 10003, '2018-05-21', 1700, 'Local', 'instruments/3.jpg', 'ORG3'),
(4, 4, 1, 10004, '2019-07-01', 1800, 'Local', 'instruments/4.jpg', 'ORG4'),
(5, 5, 1, 10005, '2020-09-12', 1900, 'Local', 'instruments/5.jpg', 'ORG5'),
(6, 1, 2, 20001, '2016-02-05', 2400, 'Local', 'instruments/6.jpg', 'PIA1'),
(7, 2, 2, 20002, '2017-04-10', 2300, 'Local', 'instruments/7.jpg', 'PIA2'),
(8, 3, 2, 20003, '2018-06-15', 2200, 'Local', 'instruments/8.jpg', 'PIA3'),
(9, 4, 2, 20004, '2019-08-20', 2100, 'Emprunté', 'instruments/9.jpg', 'PIA4'),
(10, 5, 2, 20005, '2020-10-25', 2000, 'Local', 'instruments/10.jpg', 'PIA5'),
(11, 3, 3, 30001, '2017-01-05', 800, 'Emprunté', 'instruments/11.jpg', 'CLA1'),
(12, 1, 3, 30002, '2018-02-06', 850, 'Prêt', 'instruments/12.jpg', 'CLA2'),
(13, 2, 3, 30003, '2019-03-07', 870, 'Local', 'instruments/13.jpg', 'CLA3'),
(14, 4, 3, 30004, '2020-04-08', 900, 'Local', 'instruments/14.jpg', 'CLA4'),
(15, 5, 3, 30005, '2021-05-09', 950, 'Local', 'instruments/15.jpg', 'CLA5'),
(16, 2, 4, 40001, '2017-11-11', 1200, 'Local', 'instruments/16.jpg', 'GUI1'),
(17, 1, 4, 40002, '2018-12-12', 1250, 'Local', 'instruments/17.jpg', 'GUI2'),
(18, 5, 4, 40003, '2019-01-13', 1300, 'Prêt', 'instruments/18.jpg', 'GUI3'),
(19, 3, 4, 40004, '2020-02-14', 1350, 'Prêt', 'instruments/19.jpg', 'GUI4'),
(20, 4, 4, 40005, '2021-03-15', 1400, 'Local', 'instruments/20.jpg', 'GUI5'),
(21, 2, 5, 50001, '2017-07-07', 1100, 'Local', 'instruments/21.jpg', 'BAS1'),
(22, 2, 5, 50002, '2018-08-08', 1150, 'Emprunté', 'instruments/22.jpg', 'BAS2'),
(23, 3, 5, 50003, '2019-09-09', 1175, 'Prêt', 'instruments/23.jpg', 'BAS3'),
(24, 4, 5, 50004, '2020-10-10', 1200, 'Local', 'instruments/24.jpg', 'BAS4'),
(25, 1, 5, 50005, '2021-11-11', 1250, 'Local', 'instruments/25.jpg', 'BAS5'),
(26, 5, 6, 60001, '2016-05-05', 900, 'Emprunté', 'instruments/26.jpg', 'SAX1'),
(27, 5, 6, 60002, '2017-06-06', 920, 'Local', 'instruments/27.jpg', 'SAX2'),
(28, 1, 6, 60003, '2018-07-07', 940, 'Emprunté', 'instruments/28.jpg', 'SAX3'),
(29, 2, 6, 60004, '2019-08-08', 960, 'Prêt', 'instruments/29.jpg', 'SAX4'),
(30, 3, 6, 60005, '2020-09-09', 980, 'Prêt', 'instruments/30.jpg', 'SAX5'),
(31, 5, 7, 70001, '2016-03-03', 350, 'Prêt', 'instruments/31.jpg', 'CLN1'),
(32, 5, 7, 70002, '2017-04-04', 360, 'Emprunté', 'instruments/32.jpg', 'CLN2'),
(33, 1, 7, 70003, '2018-05-05', 370, 'Local', 'instruments/33.jpg', 'CLN3'),
(34, 2, 7, 70004, '2019-06-06', 380, 'Local', 'instruments/34.jpg', 'CLN4'),
(35, 3, 7, 70005, '2020-07-07', 390, 'Emprunté', 'instruments/35.jpg', 'CLN5'),
(36, 5, 8, 80001, '2016-02-02', 300, 'Emprunté', 'instruments/36.jpg', 'FLU1'),
(37, 1, 8, 80002, '2017-03-03', 320, 'Emprunté', 'instruments/37.jpg', 'FLU2'),
(38, 2, 8, 80003, '2018-04-04', 330, 'Prêt', 'instruments/38.jpg', 'FLU3'),
(39, 3, 8, 80004, '2019-05-05', 340, 'Local', 'instruments/39.jpg', 'FLU4'),
(40, 4, 8, 80005, '2020-06-06', 350, 'Emprunté', 'instruments/40.jpg', 'FLU5'),
(41, 5, 9, 90001, '2015-01-01', 700, 'Local', 'instruments/41.jpg', 'TMB1'),
(42, 1, 9, 90002, '2016-02-02', 720, 'Prêt', 'instruments/42.jpg', 'TMB2'),
(43, 2, 9, 90003, '2017-03-03', 740, 'Prêt', 'instruments/43.jpg', 'TMB3'),
(44, 3, 9, 90004, '2018-04-04', 760, 'Prêt', 'instruments/44.jpg', 'TMB4'),
(45, 4, 9, 90005, '2019-05-05', 780, 'Emprunté', 'instruments/45.jpg', 'TMB5'),
(46, 5, 10, 100001, '2015-06-06', 680, 'Local', 'instruments/46.jpg', 'TPT1'),
(47, 1, 10, 100002, '2016-07-07', 700, 'Emprunté', 'instruments/47.jpg', 'TPT2'),
(48, 2, 10, 100003, '2017-08-08', 720, 'Emprunté', 'instruments/48.jpg', 'TPT3'),
(49, 3, 10, 100004, '2018-09-09', 740, 'Prêt', 'instruments/49.jpg', 'TPT4'),
(50, 4, 10, 100005, '2019-10-10', 760, 'Local', 'instruments/50.jpg', 'TPT5'),
(51, 4, 11, 110001, '2015-05-05', 1500, 'Emprunté', 'instruments/51.jpg', 'TUB1'),
(52, 4, 11, 110002, '2016-06-06', 1520, 'Emprunté', 'instruments/52.jpg', 'TUB2'),
(53, 1, 11, 110003, '2017-07-07', 1540, 'Local', 'instruments/53.jpg', 'TUB3'),
(54, 2, 11, 110004, '2018-08-08', 1560, 'Emprunté', 'instruments/54.jpg', 'TUB4'),
(55, 3, 11, 110005, '2019-09-09', 1580, 'Local', 'instruments/55.jpg', 'TUB5'),
(56, 5, 12, 120001, '2019-09-01', 400, 'Local', 'instruments/56.jpg', 'VIO1'),
(57, 5, 12, 120002, '2020-10-02', 420, 'Emprunté', 'instruments/57.jpg', 'VIO2'),
(58, 1, 12, 120003, '2021-11-03', 440, 'Prêt', 'instruments/58.jpg', 'VIO3'),
(59, 2, 12, 120004, '2022-12-04', 460, 'Local', 'instruments/59.jpg', 'VIO4'),
(60, 3, 12, 120005, '2023-01-05', 480, 'Emprunté', 'instruments/60.jpg', 'VIO5'),
(61, 4, 13, 130001, '2018-08-08', 900, 'Prêt', 'instruments/61.jpg', 'VLC1'),
(62, 4, 13, 130002, '2019-09-09', 920, 'Emprunté', 'instruments/62.jpg', 'VLC2'),
(63, 1, 13, 130003, '2020-10-10', 940, 'Emprunté', 'instruments/63.jpg', 'VLC3'),
(64, 2, 13, 130004, '2021-11-11', 960, 'Local', 'instruments/64.jpg', 'VLC4'),
(65, 3, 13, 130005, '2022-12-12', 980, 'Prêt', 'instruments/65.jpg', 'VLC5'),
(66, 4, 14, 140001, '2017-03-03', 1200, 'Prêt', 'instruments/66.jpg', 'HAR1'),
(67, 4, 14, 140002, '2018-04-04', 1250, 'Prêt', 'instruments/67.jpg', 'HAR2'),
(68, 1, 14, 140003, '2019-05-05', 1300, 'Prêt', 'instruments/68.jpg', 'HAR3'),
(69, 2, 14, 140004, '2020-06-06', 1350, 'Emprunté', 'instruments/69.jpg', 'HAR4'),
(70, 3, 14, 140005, '2021-07-07', 1400, 'Emprunté', 'instruments/70.jpg', 'HAR5'),
(71, 3, 15, 150001, '2016-02-02', 600, 'Emprunté', 'instruments/71.jpg', 'BAT1'),
(72, 3, 15, 150002, '2017-03-03', 620, 'Local', 'instruments/72.jpg', 'BAT2'),
(73, 2, 15, 150003, '2018-04-04', 640, 'Local', 'instruments/73.jpg', 'BAT3'),
(74, 1, 15, 150004, '2019-05-05', 660, 'Prêt', 'instruments/74.jpg', 'BAT4'),
(75, 4, 15, 150005, '2020-06-06', 680, 'Local', 'instruments/75.jpg', 'BAT5');

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

--
-- Déchargement des données de la table `instrument_couleur`
--

INSERT INTO `instrument_couleur` (`instrument_id`, `couleur_id`) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 5),
(5, 3),
(6, 2),
(7, 1),
(8, 5),
(9, 4),
(10, 1),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 3),
(17, 2),
(18, 1),
(19, 5),
(20, 4),
(21, 1),
(22, 2),
(23, 3),
(24, 4),
(25, 5),
(26, 1),
(27, 2),
(28, 3),
(29, 4),
(30, 5),
(31, 1),
(32, 2),
(33, 3),
(34, 4),
(35, 5),
(36, 1),
(37, 2),
(38, 3),
(39, 4),
(40, 5),
(41, 1),
(42, 2),
(43, 3),
(44, 4),
(45, 5),
(46, 1),
(47, 2),
(48, 3),
(49, 4),
(50, 5),
(51, 1),
(52, 2),
(53, 3),
(54, 4),
(55, 5),
(56, 1),
(57, 2),
(58, 3),
(59, 4),
(60, 5),
(61, 1),
(62, 2),
(63, 3),
(64, 4),
(65, 5),
(66, 1),
(67, 2),
(68, 3),
(69, 4),
(70, 5),
(71, 1),
(72, 2),
(73, 3),
(74, 4),
(75, 5);

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
  `profressionnel` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D11814AB8A49CC82` (`professionnel_id`),
  KEY `IDX_D11814ABCF11D9C` (`instrument_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `intervention`
--

INSERT INTO `intervention` (`id`, `professionnel_id`, `instrument_id`, `date_debut`, `date_fin`, `descriptif`, `prix`, `quotite`, `profressionnel`) VALUES
(1, 1, 1, '2025-09-02', '2025-09-03', 'Réglage clavier', 50, 100, 1),
(2, 2, 2, '2025-09-03', '2025-09-04', 'Accord piano', 60, 100, 2),
(3, 3, 3, '2025-09-04', '2025-09-05', 'Réglage guitare', 40, 100, 3),
(4, 4, 4, '2025-09-05', '2025-09-06', 'Changement peaux batterie', 70, 100, 4),
(5, 5, 5, '2025-09-06', '2025-09-07', 'Réglage saxophone', 45, 100, 5),
(6, 6, 6, '2025-09-07', '2025-09-08', 'Nettoyage', 30, 100, 6),
(7, 7, 7, '2025-09-08', '2025-09-09', 'Lubrification', 35, 100, 7),
(8, 8, 8, '2025-09-09', '2025-09-10', 'Vérification cordes', 40, 100, 8),
(9, 9, 9, '2025-09-10', '2025-09-11', 'Remplacement cymbales', 50, 100, 9),
(10, 10, 10, '2025-09-11', '2025-09-12', 'Accordage final', 55, 100, 10),
(11, 11, 11, '2025-09-12', '2025-09-13', 'Régler mécanique', 48, 100, 11),
(12, 12, 12, '2025-09-13', '2025-09-14', 'Remplac. cordes', 42, 100, 12),
(13, 13, 13, '2025-09-14', '2025-09-15', 'Contrôle frettes', 38, 100, 13),
(14, 14, 14, '2025-09-15', '2025-09-16', 'Soudure électronique', 90, 100, 14),
(15, 15, 15, '2025-09-16', '2025-09-17', 'Réglage archet', 66, 100, 15),
(16, 16, 16, '2025-09-17', '2025-09-18', 'Test micro', 55, 100, 16),
(17, 17, 17, '2025-09-18', '2025-09-19', 'Accord manuel', 60, 100, 17),
(18, 18, 18, '2025-09-19', '2025-09-20', 'Réglage peaux', 70, 100, 18),
(19, 19, 19, '2025-09-20', '2025-09-21', 'Remplacement pièces', 85, 100, 19),
(20, 20, 20, '2025-09-21', '2025-09-22', 'Nettoyage complet', 45, 100, 20),
(21, 1, 21, '2025-09-22', '2025-09-23', 'Réglage basse', 52, 100, 1),
(22, 2, 22, '2025-09-23', '2025-09-24', 'Accordage', 60, 100, 2),
(23, 3, 23, '2025-09-24', '2025-09-25', 'Contrôle électronique', 48, 100, 3),
(24, 4, 24, '2025-09-25', '2025-09-26', 'Remplac. cordes', 40, 100, 4),
(25, 5, 25, '2025-09-26', '2025-09-27', 'Nettoyage', 35, 100, 5),
(26, 6, 26, '2025-09-27', '2025-09-28', 'Bec réglé', 30, 100, 6),
(27, 7, 27, '2025-09-28', '2025-09-29', 'Ligature réglée', 28, 100, 7),
(28, 8, 28, '2025-09-29', '2025-09-30', 'Test souffle', 33, 100, 8),
(29, 9, 29, '2025-09-30', '2025-10-01', 'Rempla. valve', 48, 100, 9),
(30, 10, 30, '2025-10-01', '2025-10-02', 'Test acoustique', 44, 100, 10),
(31, 11, 31, '2025-10-02', '2025-10-03', 'Réglage', 39, 100, 11),
(32, 12, 32, '2025-10-03', '2025-10-04', 'Entretien', 41, 100, 12),
(33, 13, 33, '2025-10-04', '2025-10-05', 'Contrôle', 37, 100, 13),
(34, 14, 34, '2025-10-05', '2025-10-06', 'Vérif électronique', 72, 100, 14),
(35, 15, 35, '2025-10-06', '2025-10-07', 'Réglage', 58, 100, 15),
(36, 16, 36, '2025-10-07', '2025-10-08', 'Étui vérif', 25, 100, 16),
(37, 17, 37, '2025-10-08', '2025-10-09', 'Remplissage', 29, 100, 17),
(38, 18, 38, '2025-10-09', '2025-10-10', 'Nettoyage', 31, 100, 18),
(39, 19, 39, '2025-10-10', '2025-10-11', 'Révision', 35, 100, 19),
(40, 20, 40, '2025-10-11', '2025-10-12', 'Ajustement', 45, 100, 20),
(41, 1, 41, '2025-10-12', '2025-10-13', 'Test slide', 52, 100, 1),
(42, 2, 42, '2025-10-13', '2025-10-14', 'Valve check', 60, 100, 2),
(43, 3, 43, '2025-10-14', '2025-10-15', 'Grosse révision', 98, 100, 3),
(44, 4, 44, '2025-10-15', '2025-10-16', 'Mécanique', 66, 100, 4),
(45, 5, 45, '2025-10-16', '2025-10-17', 'Nettoyage', 36, 100, 5),
(46, 6, 46, '2025-10-17', '2025-10-18', 'Cordes', 49, 100, 6),
(47, 7, 47, '2025-10-18', '2025-10-19', 'Archet', 55, 100, 7),
(48, 8, 48, '2025-10-19', '2025-10-20', 'Réglage fin', 44, 100, 8),
(49, 9, 49, '2025-10-20', '2025-10-21', 'Remplacement', 60, 100, 9),
(50, 10, 50, '2025-10-21', '2025-10-22', 'Contrôle final', 50, 100, 10);

-- --------------------------------------------------------

--
-- Structure de la table `jour`
--

DROP TABLE IF EXISTS `jour`;
CREATE TABLE IF NOT EXISTS `jour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `jour`
--

INSERT INTO `jour` (`id`, `libelle`) VALUES
(1, 'Lundi'),
(2, 'Mardi'),
(3, 'Mercredi'),
(4, 'Jeudi'),
(5, 'Vendredi'),
(6, 'Samedi');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id`, `libelle`) VALUES
(1, 'Yamaha'),
(2, 'Fender'),
(3, 'Roland'),
(4, 'Gibson'),
(5, 'Selmer');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `metier`
--

INSERT INTO `metier` (`id`, `libelle`) VALUES
(1, 'Luthier'),
(2, 'Accordeuse'),
(3, 'Technicien instrument'),
(4, 'Réparateur électronique'),
(5, 'Accordeur piano');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`id`, `inscription_id`, `montant`, `date_paiement`) VALUES
(1, 1, 417, '2025-09-05'),
(2, 2, 60, '2025-09-05'),
(3, 3, 96, '2025-09-06'),
(4, 4, 126, '2025-09-06'),
(5, 5, 192, '2025-09-07'),
(6, 6, 282, '2025-09-07'),
(7, 7, 330, '2025-09-08'),
(8, 8, 60, '2025-09-08'),
(9, 9, 96, '2025-09-09'),
(10, 10, 126, '2025-09-09'),
(11, 11, 192, '2025-09-10'),
(12, 12, 282, '2025-09-10'),
(13, 13, 330, '2025-09-11'),
(14, 14, 60, '2025-09-11'),
(15, 15, 96, '2025-09-12'),
(16, 16, 126, '2025-09-12'),
(17, 17, 192, '2025-09-13'),
(18, 18, 282, '2025-09-13'),
(19, 19, 330, '2025-09-14'),
(20, 20, 417, '2025-09-14');

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
(1, 'Martin', 'Claire', 3, 'Rue Mozart', '75009', 'Paris', '0600000001', 'claire.martin@ecole.fr'),
(2, 'Bernard', 'Paul', 8, 'Avenue Chopin', '13001', 'Marseille', '0600000002', 'paul.bernard@ecole.fr'),
(3, 'Lefevre', 'Julie', 1, 'Rue Adagio', '31000', 'Toulouse', '0600000003', 'julie.lefevre@ecole.fr'),
(4, 'Roux', 'Thomas', 2, 'Rue Allegretto', '13001', 'Marseille', '0600000004', 'thomas.roux@ecole.fr'),
(5, 'Faure', 'Clément', 4, 'Rue Cadence', '69002', 'Lyon', '0600000005', 'clement.faure@ecole.fr'),
(6, 'Petit', 'Camille', 6, 'Avenue Tempo', '75011', 'Paris', '0600000006', 'camille.petit@ecole.fr'),
(7, 'Morel', 'Benjamin', 8, 'Rue Forte', '59000', 'Lille', '0600000007', 'benjamin.morel@ecole.fr'),
(8, 'Girard', 'Sophie', 10, 'Rue Pianissimo', '44000', 'Nantes', '0600000008', 'sophie.girard@ecole.fr'),
(9, 'Gauthier', 'Hugo', 12, 'Rue Moderato', '34000', 'Montpellier', '0600000009', 'hugo.gauthier@ecole.fr'),
(10, 'Bertrand', 'Laure', 14, 'Boulevard Vivace', '75009', 'Paris', '0600000010', 'laure.bertrand@ecole.fr');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `professionnel`
--

INSERT INTO `professionnel` (`id`, `nom`, `num_rue`, `rue`, `cpos`, `ville`, `tel`, `mail`) VALUES
(1, 'Dubois Instruments', 12, 'Rue des Arts', '75001', 'Paris', '0601020301', 'contact@dubois-inst.fr'),
(2, 'Atelier Sonore', 5, 'Rue Beethoven', '69002', 'Lyon', '0602030402', 'info@atelieronore.fr'),
(3, 'LaboMusique', 7, 'Rue Liszt', '75002', 'Paris', '0603040503', 'contact@labomusique.fr'),
(4, 'Accord & Sons', 9, 'Rue Vivaldi', '69003', 'Lyon', '0604050604', 'contact@accord-sons.fr'),
(5, 'Lutherie Pro', 14, 'Rue Debussy', '31000', 'Toulouse', '0605060705', 'lutherie@pro.fr'),
(6, 'ElectroRépa', 21, 'Rue Ravel', '33000', 'Bordeaux', '0606070806', 'contact@electrorepa.fr'),
(7, 'Atelier Harmonie', 18, 'Rue Rameau', '59000', 'Lille', '0607080907', 'info@atelier-harmonie.fr'),
(8, 'Paris Accorde', 4, 'Rue Saintonge', '75003', 'Paris', '0608091011', 'hello@paris-accorde.fr'),
(9, 'Son & Cie', 12, 'Avenue des Arts', '67000', 'Strasbourg', '0609101112', 'contact@sonetcie.fr'),
(10, 'ProGuitares', 3, 'Rue du Rock', '34000', 'Montpellier', '0610111213', 'sav@proguitares.fr'),
(11, 'Cordes et Bois', 2, 'Rue des Luths', '44000', 'Nantes', '0611121314', 'contact@cordes-bois.fr'),
(12, 'Accordage Express', 6, 'Rue Allegro', '13002', 'Marseille', '0612131415', 'express@accordage.fr'),
(13, 'Réparation Rapide', 11, 'Rue Crescendo', '21000', 'Dijon', '0613141516', 'service@reparrapide.fr'),
(14, 'Studio Réglage', 25, 'Boulevard Chopin', '67000', 'Strasbourg', '0614151617', 'studio@reglage.fr'),
(15, 'Atelier Acoustique', 20, 'Rue Mozart', '59000', 'Lille', '0615161718', 'acoustique@atelier.fr'),
(16, 'Luthier Moderne', 31, 'Rue Paganini', '69006', 'Lyon', '0616171819', 'contact@luthiermoderne.fr'),
(17, 'Serv.Instruments', 8, 'Rue des Musiciens', '75010', 'Paris', '0617181920', 'info@servinstruments.fr'),
(18, 'Accord et Répare', 27, 'Rue Sonata', '06000', 'Nice', '0618192021', 'contact@accordrepare.fr'),
(19, 'Atelier des Cuivres', 16, 'Rue Brass', '69001', 'Lyon', '0619202122', 'cuivres@atelier.fr'),
(20, 'Harmoniques', 5, 'Rue Mélodie', '44000', 'Nantes', '0620212223', 'hello@harmoniques.fr');

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

--
-- Déchargement des données de la table `professionnel_metier`
--

INSERT INTO `professionnel_metier` (`professionnel_id`, `metier_id`) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 3),
(4, 2),
(5, 1),
(6, 4),
(7, 1),
(8, 2),
(9, 3),
(10, 1),
(11, 1),
(12, 2),
(13, 4),
(14, 3),
(15, 1),
(16, 1),
(17, 4),
(18, 2),
(19, 5),
(20, 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `responsable`
--

INSERT INTO `responsable` (`id`, `tranche_id`, `nom`, `prenom`, `num_rue`, `rue`, `cpos`, `ville`, `tel`, `mail`) VALUES
(1, 1, 'Durand', 'Sophie', 10, 'Rue Victor Hugo', '44000', 'Nantes', '0600111222', 'sophie.durand@mail.fr'),
(2, 2, 'Petit', 'Marc', 12, 'Rue de la Paix', '33000', 'Bordeaux', '0600222333', 'marc.petit@mail.fr'),
(3, 1, 'Martin', 'Sophie', 13, 'Rue des Tilleuls', '75012', 'Paris', '0620003003', 'sophie.martin@mail.fr'),
(4, 2, 'Bernard', 'Luc', 14, 'Rue des Roses', '69003', 'Lyon', '0620003004', 'luc.bernard@mail.fr'),
(5, 3, 'Lemaire', 'Isabelle', 15, 'Rue des Lilas', '31000', 'Toulouse', '0620003005', 'isabelle.lemaire@mail.fr'),
(6, 3, 'Rousseau', 'Philippe', 16, 'Boulevard des Arts', '33000', 'Bordeaux', '0620003006', 'philippe.rousseau@mail.fr'),
(7, 1, 'Germain', 'Nathalie', 17, 'Place Mozart', '59000', 'Lille', '0620003007', 'nathalie.germain@mail.fr'),
(8, 4, 'Carpentier', 'Olivier', 18, 'Avenue Debussy', '44000', 'Nantes', '0620003008', 'olivier.carpentier@mail.fr'),
(9, 5, 'Marchal', 'Valerie', 19, 'Rue Vivaldi', '34000', 'Montpellier', '0620003009', 'valerie.marchal@mail.fr'),
(10, 1, 'Perrot', 'Jacques', 20, 'Rue Ravel', '67000', 'Strasbourg', '0620003010', 'jacques.perrot@mail.fr'),
(11, 2, 'Legrand', 'Cecile', 21, 'Rue Rossini', '13001', 'Marseille', '0620003011', 'cecile.legrand@mail.fr'),
(12, 3, 'Gillet', 'Marc', 22, 'Boulevard Bizet', '21000', 'Dijon', '0620003012', 'marc.gillet@mail.fr'),
(13, 4, 'Noiret', 'Agnès', 23, 'Rue Schubert', '75010', 'Paris', '0620003013', 'agnes.noiret@mail.fr'),
(14, 5, 'Besson', 'Thierry', 24, 'Rue Haendel', '33000', 'Bordeaux', '0620003014', 'thierry.besson@mail.fr'),
(15, 6, 'Meyer', 'Claire', 25, 'Rue Strauss', '59000', 'Lille', '0620003015', 'claire.meyer@mail.fr'),
(16, 3, 'Delmas', 'Sabrina', 26, 'Rue Boccherini', '44000', 'Nantes', '0620003016', 'sabrina.delmas@mail.fr'),
(17, 2, 'Ollivier', 'Bruno', 27, 'Rue Vivaldi', '34000', 'Montpellier', '0620003017', 'bruno.ollivier@mail.fr'),
(18, 5, 'Chevalier', 'Muriel', 28, 'Rue Lully', '67000', 'Strasbourg', '0620003018', 'muriel.chevalier@mail.fr'),
(19, 1, 'Pelletier', 'Hugo', 29, 'Rue Handel', '31000', 'Toulouse', '0620003019', 'hugo.pelletier@mail.fr'),
(20, 4, 'Roche', 'Aline', 30, 'Rue Vival', '06000', 'Nice', '0620003020', 'aline.roche@mail.fr');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `libelle`) VALUES
(1, 'Elève'),
(2, 'Professeur'),
(3, 'Gestionnaire');

-- --------------------------------------------------------

--
-- Structure de la table `tarif`
--

DROP TABLE IF EXISTS `tarif`;
CREATE TABLE IF NOT EXISTS `tarif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tranche_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `montant` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E7189C9B76F6B31` (`tranche_id`),
  KEY `IDX_E7189C9C54C8C93` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tarif`
--

INSERT INTO `tarif` (`id`, `tranche_id`, `type_id`, `montant`) VALUES
(1, 1, 1, 417),
(2, 1, 2, 209),
(3, 1, 1, 60),
(4, 1, 2, 30),
(5, 2, 1, 96),
(6, 2, 2, 48),
(7, 2, 2, 63),
(8, 3, 1, 126),
(9, 3, 2, 63),
(10, 4, 1, 192),
(11, 4, 2, 96),
(12, 5, 1, 282),
(13, 5, 2, 141),
(14, 6, 1, 330),
(15, 6, 2, 165);

-- --------------------------------------------------------

--
-- Structure de la table `tranche`
--

DROP TABLE IF EXISTS `tranche`;
CREATE TABLE IF NOT EXISTS `tranche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `quotient_mini` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tranche`
--

INSERT INTO `tranche` (`id`, `libelle`, `quotient_mini`) VALUES
(1, '0-250', 1),
(2, '251-425', 251),
(3, '426-680', 426),
(4, '681-935', 681),
(5, '936-1800', 936),
(6, '1801+', 1801);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `nom`) VALUES
(1, 'Individuel'),
(2, 'Collectif');

-- --------------------------------------------------------

--
-- Structure de la table `type_instrument`
--

DROP TABLE IF EXISTS `type_instrument`;
CREATE TABLE IF NOT EXISTS `type_instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classe_instrument_id` int(11) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_21BCBFF8CE879FB1` (`classe_instrument_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_instrument`
--

INSERT INTO `type_instrument` (`id`, `classe_instrument_id`, `libelle`) VALUES
(1, 1, 'Orgue'),
(2, 1, 'Piano'),
(3, 2, 'Clavier amplifié'),
(4, 2, 'Guitare électrique'),
(5, 2, 'Basse électrique'),
(6, 3, 'Saxophone'),
(7, 3, 'Clarinette'),
(8, 3, 'Flûte traversière'),
(9, 4, 'Trombone'),
(10, 4, 'Trompette'),
(11, 4, 'Tuba'),
(12, 5, 'Violon'),
(13, 5, 'Violoncelle'),
(14, 5, 'Harpe celtique'),
(15, 6, 'Batterie');

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
(1, 10),
(2, 1),
(3, 6),
(4, 4),
(5, 7),
(6, 9),
(7, 8),
(8, 3),
(12, 2),
(13, 5);

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
  ADD CONSTRAINT `FK_1FB84C67A6CC7B2` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`),
  ADD CONSTRAINT `FK_1FB84C67CF11D9C` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`);

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `FK_FDCA8C9C220C6AD0` FOREIGN KEY (`jour_id`) REFERENCES `jour` (`id`),
  ADD CONSTRAINT `FK_FDCA8C9C7C1CAAA9` FOREIGN KEY (`type_instrument_id`) REFERENCES `type_instrument` (`id`),
  ADD CONSTRAINT `FK_FDCA8C9CBAB22EE9` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`),
  ADD CONSTRAINT `FK_FDCA8C9CC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);

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
  ADD CONSTRAINT `FK_3CBF69DD4827B9B2` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id`),
  ADD CONSTRAINT `FK_3CBF69DD7C1CAAA9` FOREIGN KEY (`type_instrument_id`) REFERENCES `type_instrument` (`id`);

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
-- Contraintes pour la table `tarif`
--
ALTER TABLE `tarif`
  ADD CONSTRAINT `FK_E7189C9B76F6B31` FOREIGN KEY (`tranche_id`) REFERENCES `tranche` (`id`),
  ADD CONSTRAINT `FK_E7189C9C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);

--
-- Contraintes pour la table `type_instrument`
--
ALTER TABLE `type_instrument`
  ADD CONSTRAINT `FK_21BCBFF8CE879FB1` FOREIGN KEY (`classe_instrument_id`) REFERENCES `classe_instrument` (`id`);

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
