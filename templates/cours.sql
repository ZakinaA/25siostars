-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : mer. 26 nov. 2025 à 09:22
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
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(30, 1, 6, 9, 15, 'Batterie - Individuel', 15, NULL, 0, '16:00:00', '16:45:00'),
(31, 2, 1, 1, 1, 'Orgue - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(32, 2, 1, 1, 1, 'Orgue - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(33, 2, 1, 1, 1, 'Orgue - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(34, 2, 1, 1, 1, 'Orgue - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(35, 2, 1, 1, 1, 'Orgue - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(36, 1, 1, 1, 1, 'Orgue - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(37, 1, 1, 1, 1, 'Orgue - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(38, 1, 1, 1, 1, 'Orgue - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(39, 1, 1, 1, 1, 'Orgue - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(40, 1, 1, 1, 1, 'Orgue - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00'),
(41, 2, 1, 1, 2, 'Piano - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(42, 2, 1, 1, 2, 'Piano - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(43, 2, 1, 1, 2, 'Piano - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(44, 2, 1, 1, 2, 'Piano - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(45, 2, 1, 1, 2, 'Piano - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(46, 1, 1, 1, 2, 'Piano - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(47, 1, 1, 1, 2, 'Piano - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(48, 1, 1, 1, 2, 'Piano - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(49, 1, 1, 1, 2, 'Piano - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(50, 1, 1, 1, 2, 'Piano - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00'),
(51, 2, 1, 1, 3, 'Clavier amplifié - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(52, 2, 1, 1, 3, 'Clavier amplifié - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(53, 2, 1, 1, 3, 'Clavier amplifié - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(54, 2, 1, 1, 3, 'Clavier amplifié - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(55, 2, 1, 1, 3, 'Clavier amplifié - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(56, 1, 1, 1, 3, 'Clavier amplifié - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(57, 1, 1, 1, 3, 'Clavier amplifié - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(58, 1, 1, 1, 3, 'Clavier amplifié - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(59, 1, 1, 1, 3, 'Clavier amplifié - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(60, 1, 1, 1, 3, 'Clavier amplifié - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00'),
(61, 2, 1, 1, 4, 'Guitare électrique - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(62, 2, 1, 1, 4, 'Guitare électrique - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(63, 2, 1, 1, 4, 'Guitare électrique - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(64, 2, 1, 1, 4, 'Guitare électrique - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(65, 2, 1, 1, 4, 'Guitare électrique - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(66, 1, 1, 1, 4, 'Guitare électrique - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(67, 1, 1, 1, 4, 'Guitare électrique - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(68, 1, 1, 1, 4, 'Guitare électrique - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(69, 1, 1, 1, 4, 'Guitare électrique - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(70, 1, 1, 1, 4, 'Guitare électrique - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00'),
(71, 2, 1, 1, 5, 'Basse électrique - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(72, 2, 1, 1, 5, 'Basse électrique - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(73, 2, 1, 1, 5, 'Basse électrique - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(74, 2, 1, 1, 5, 'Basse électrique - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(75, 2, 1, 1, 5, 'Basse électrique - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(76, 1, 1, 1, 5, 'Basse électrique - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(77, 1, 1, 1, 5, 'Basse électrique - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(78, 1, 1, 1, 5, 'Basse électrique - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(79, 1, 1, 1, 5, 'Basse électrique - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(80, 1, 1, 1, 5, 'Basse électrique - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00'),
(81, 2, 1, 1, 6, 'Saxophone - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(82, 2, 1, 1, 6, 'Saxophone - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(83, 2, 1, 1, 6, 'Saxophone - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(84, 2, 1, 1, 6, 'Saxophone - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(85, 2, 1, 1, 6, 'Saxophone - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(86, 1, 1, 1, 6, 'Saxophone - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(87, 1, 1, 1, 6, 'Saxophone - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(88, 1, 1, 1, 6, 'Saxophone - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(89, 1, 1, 1, 6, 'Saxophone - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(90, 1, 1, 1, 6, 'Saxophone - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00'),
(91, 2, 1, 1, 7, 'Clarinette - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(92, 2, 1, 1, 7, 'Clarinette - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(93, 2, 1, 1, 7, 'Clarinette - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(94, 2, 1, 1, 7, 'Clarinette - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(95, 2, 1, 1, 7, 'Clarinette - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(96, 1, 1, 1, 7, 'Clarinette - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(97, 1, 1, 1, 7, 'Clarinette - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(98, 1, 1, 1, 7, 'Clarinette - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(99, 1, 1, 1, 7, 'Clarinette - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(100, 1, 1, 1, 7, 'Clarinette - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00'),
(101, 2, 1, 1, 8, 'Flûte traversière - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(102, 2, 1, 1, 8, 'Flûte traversière - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(103, 2, 1, 1, 8, 'Flûte traversière - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(104, 2, 1, 1, 8, 'Flûte traversière - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(105, 2, 1, 1, 8, 'Flûte traversière - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(106, 1, 1, 1, 8, 'Flûte traversière - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(107, 1, 1, 1, 8, 'Flûte traversière - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(108, 1, 1, 1, 8, 'Flûte traversière - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(109, 1, 1, 1, 8, 'Flûte traversière - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(110, 1, 1, 1, 8, 'Flûte traversière - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00'),
(111, 2, 1, 1, 9, 'Trombone - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(112, 2, 1, 1, 9, 'Trombone - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(113, 2, 1, 1, 9, 'Trombone - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(114, 2, 1, 1, 9, 'Trombone - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(115, 2, 1, 1, 9, 'Trombone - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(116, 1, 1, 1, 9, 'Trombone - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(117, 1, 1, 1, 9, 'Trombone - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(118, 1, 1, 1, 9, 'Trombone - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(119, 1, 1, 1, 9, 'Trombone - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(120, 1, 1, 1, 9, 'Trombone - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00'),
(121, 2, 1, 1, 10, 'Trompette - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(122, 2, 1, 1, 10, 'Trompette - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(123, 2, 1, 1, 10, 'Trompette - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(124, 2, 1, 1, 10, 'Trompette - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(125, 2, 1, 1, 10, 'Trompette - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(126, 1, 1, 1, 10, 'Trompette - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(127, 1, 1, 1, 10, 'Trompette - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(128, 1, 1, 1, 10, 'Trompette - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(129, 1, 1, 1, 10, 'Trompette - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(130, 1, 1, 1, 10, 'Trompette - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00'),
(131, 2, 1, 1, 11, 'Tuba - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(132, 2, 1, 1, 11, 'Tuba - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(133, 2, 1, 1, 11, 'Tuba - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(134, 2, 1, 1, 11, 'Tuba - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(135, 2, 1, 1, 11, 'Tuba - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(136, 1, 1, 1, 11, 'Tuba - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(137, 1, 1, 1, 11, 'Tuba - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(138, 1, 1, 1, 11, 'Tuba - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(139, 1, 1, 1, 11, 'Tuba - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(140, 1, 1, 1, 11, 'Tuba - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00'),
(141, 2, 1, 1, 12, 'Violon - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(142, 2, 1, 1, 12, 'Violon - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(143, 2, 1, 1, 12, 'Violon - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(144, 2, 1, 1, 12, 'Violon - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(145, 2, 1, 1, 12, 'Violon - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(146, 1, 1, 1, 12, 'Violon - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(147, 1, 1, 1, 12, 'Violon - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(148, 1, 1, 1, 12, 'Violon - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(149, 1, 1, 1, 12, 'Violon - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(150, 1, 1, 1, 12, 'Violon - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00'),
(151, 2, 1, 1, 13, 'Violoncelle - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(152, 2, 1, 1, 13, 'Violoncelle - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(153, 2, 1, 1, 13, 'Violoncelle - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(154, 2, 1, 1, 13, 'Violoncelle - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(155, 2, 1, 1, 13, 'Violoncelle - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(156, 1, 1, 1, 13, 'Violoncelle - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(157, 1, 1, 1, 13, 'Violoncelle - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(158, 1, 1, 1, 13, 'Violoncelle - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(159, 1, 1, 1, 13, 'Violoncelle - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(160, 1, 1, 1, 13, 'Violoncelle - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00'),
(161, 2, 1, 1, 14, 'Harpe celtique - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(162, 2, 1, 1, 14, 'Harpe celtique - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(163, 2, 1, 1, 14, 'Harpe celtique - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(164, 2, 1, 1, 14, 'Harpe celtique - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(165, 2, 1, 1, 14, 'Harpe celtique - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(166, 1, 1, 1, 14, 'Harpe celtique - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(167, 1, 1, 1, 14, 'Harpe celtique - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(168, 1, 1, 1, 14, 'Harpe celtique - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(169, 1, 1, 1, 14, 'Harpe celtique - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(170, 1, 1, 1, 14, 'Harpe celtique - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00'),
(171, 2, 1, 1, 15, 'Batterie - Cours Supplémentaire 1', 6, 99, 12, '09:00:00', '10:00:00'),
(172, 2, 1, 1, 15, 'Batterie - Cours Supplémentaire 2', 6, 99, 12, '10:00:00', '11:00:00'),
(173, 2, 1, 1, 15, 'Batterie - Cours Supplémentaire 3', 6, 99, 12, '11:00:00', '12:00:00'),
(174, 2, 1, 1, 15, 'Batterie - Cours Supplémentaire 4', 6, 99, 12, '12:00:00', '13:00:00'),
(175, 2, 1, 1, 15, 'Batterie - Cours Supplémentaire 5', 6, 99, 12, '08:00:00', '09:00:00'),
(176, 1, 1, 1, 15, 'Batterie - Cours Supplémentaire 6', 6, 99, 1, '09:00:00', '10:00:00'),
(177, 1, 1, 1, 15, 'Batterie - Cours Supplémentaire 7', 6, 99, 1, '10:00:00', '11:00:00'),
(178, 1, 1, 1, 15, 'Batterie - Cours Supplémentaire 8', 6, 99, 1, '11:00:00', '12:00:00'),
(179, 1, 1, 1, 15, 'Batterie - Cours Supplémentaire 9', 6, 99, 1, '12:00:00', '13:00:00'),
(180, 1, 1, 1, 15, 'Batterie - Cours Supplémentaire 10', 6, 99, 1, '08:00:00', '09:00:00');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `FK_FDCA8C9C220C6AD0` FOREIGN KEY (`jour_id`) REFERENCES `jour` (`id`),
  ADD CONSTRAINT `FK_FDCA8C9C7C1CAAA9` FOREIGN KEY (`type_instrument_id`) REFERENCES `type_instrument` (`id`),
  ADD CONSTRAINT `FK_FDCA8C9CBAB22EE9` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`),
  ADD CONSTRAINT `FK_FDCA8C9CC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
