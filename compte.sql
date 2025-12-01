-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : lun. 01 déc. 2025 à 15:42
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
-- Structure de la table `compte`
--

DROP TABLE IF EXISTS `compte`;
CREATE TABLE IF NOT EXISTS `compte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifiant` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_IDENTIFIANT` (`identifiant`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `identifiant`, `roles`, `password`) VALUES
(11, 'testEleve', '[\"role_eleve\"]', '$2y$13$iO7WUaxyxqucrN4ysUghduZHO3BuXeI3IjkBzlic5pmfmRisTEHHK'),
(12, 'testProfesseur', '[\"role_professeur\"]', '$2y$13$364d4YO/fcR84ESXg1ha7Oi5k1XuA/O3Q333wSJSg/HlannCkZGpC'),
(13, 'testGestionnaire', '[\"role_gestionnaire\"]', '$2y$13$pZzj49m4f7Nwjss25wzQqOpd.L05cbcSkzUc9z5ir6zjuOcuUJRTm'),
(14, 'ana.leroy', '[\"role_eleve\"]', '$2y$13$hU85RuQb4/7poyyMefTgcOXX0XiBQK9yuTC1NEh/QNgnbGmeOSeli'),
(15, 'lucas.moreau', '[\"role_eleve\"]', '$2y$13$7P8w6Q3YhKIzUy1qcwG6ye3LR2QPPoBnrTbYOGLICFqH/3y/inwTi'),
(16, 'emma.nguyen', '[\"role_eleve\"]', '$2y$13$ETm6DT/En2SUMfspacIwaOCpkTN.bpZybFoRRQfuaET6ixUaGzqiW'),
(17, 'sofia.garcia', '[\"role_eleve\"]', '$2y$13$Vg71F0xJQofoqw.nAkDxhu0kCR9NYjDhicNpwrsyulK975uP7QTlO'),
(18, 'matteo.rossi', '[\"role_eleve\"]', '$2y$13$rO0thK.SsSv6gfDdKgqGQuUAeIexqSgCmS/.n39RpdwQy55oSZX6.'),
(19, 'hugo.dupont', '[\"role_eleve\"]', '$2y$13$8sV95jnGvz4luFwXRnP0nO99i89JGPUj9J2Pc9p4kx2SkGFzyXkmO'),
(20, 'lina.simon', '[\"role_eleve\"]', '$2y$13$NLidtwzO/BgFZbStJj4pP.9WFDtqscZWM5sJEGHadHz0Vy6SKYduq'),
(21, 'leo.faivre', '[\"role_eleve\"]', '$2y$13$6polayFvsv2Faw6J0PbpEuVNB/v.IsUmJuvNsy/2rkSIzNba/O2E2'),
(22, 'chloe.boulanger', '[\"role_eleve\"]', '$2y$13$UgS6ioVbwWj5T9H/3WHUfeEdKH8VeECI7EASEgSjz/ApHUsOPnu6m'),
(23, 'max.rivet', '[\"role_eleve\"]', '$2y$13$kjgeBge83x5/1v.osHMecOjGahaqK77MoWTooTraPR8JB669d1VOi'),
(24, 'eva.hamel', '[\"role_eleve\"]', '$2y$13$TyjUjmFhBVMCWW8rDKc2x.GyltO.TdCmDpCh4Ir0CuJgUU1V3eMni'),
(25, 'noah.garnier', '[\"role_eleve\"]', '$2y$13$CK7X5itJQtBQ74ok9dQsc.2zl1XiUZ/8rUtBrGeXWs1K7Xjo70Tdq'),
(26, 'zoe.blanc', '[\"role_eleve\"]', '$2y$13$EIwb6udhBqP17mUT2bWnJ.CHX.LJq97E3UCHui54I2sNIXo1EMgRm'),
(27, 'leo.mercier', '[\"role_eleve\"]', '$2y$13$103xlm2CPdjP6g7UbBs8Z.4rBtMIzAnwXSGMvJSXiTZATK7CTwaFu'),
(28, 'mia.fernandez', '[\"role_eleve\"]', '$2y$13$/rB3zu/4wsTK..jtHB7S1uhOITCyxy/PsWkMBJpPwjSj0Rqq0t64W'),
(29, 'ana.rossi', '[\"role_eleve\"]', '$2y$13$3SUAj6dQk4MRgfJTPxqeheDxmVehUmxCMWHpL58ejFx8JyFXHDb/O'),
(30, 'marc.klein', '[\"role_eleve\"]', '$2y$13$v21/XXx9dEBzpxBsM5QAA.4iK4Ad7kWUvvJajDUyfMEiNTZFRWkiO'),
(31, 'emma.vidal', '[\"role_eleve\"]', '$2y$13$SMfQJAkvwHX/xPTVTaFlweyygA/CrfvQjMtnd3XY0ADPyI6z3u5bG'),
(32, 'lucas.morel', '[\"role_eleve\"]', '$2y$13$lAj.qv/azfAUkOmbUGpufOJEL.iRBhMP8FyqkZE.xaDBuUzuS6ELm'),
(33, 'sonia.dupuis', '[\"role_eleve\"]', '$2y$13$2a4owLlHay3fgv7ihAKNueA.Oj/B9gfSJL4avm/TJP45ATxZ5ZE9m'),
(34, 'claire.martin', '[\"role_professeur\"]', '$2y$13$0orIefVJrAviWpBznRN3.uIG5U5J4thk8d2B167UItNDMdUef4IWe'),
(35, 'paul.bernard', '[\"role_professeur\"]', '$2y$13$ELnyKjUqdy93Wm7hjXfmv.J8xJg3jjSKCTDJ3h1IkBpmoq5J94P4W'),
(36, 'julie.lefevre', '[\"role_professeur\"]', '$2y$13$HrQEezm/T1ZHY9.CtIQ5i.Z9T.pJ.fNtnOmsQmVTOuvsF76.FNIoy'),
(37, 'thomas.roux', '[\"role_professeur\"]', '$2y$13$3kJddBc./W7LgUv83iSvcOxkbv5RqujQ87i7mhzIaI2Jbq/8n/n3i'),
(38, 'clement.faure', '[\"role_professeur\"]', '$2y$13$o8mISojYzHS3ZS.phtMFdeRuZKFQ.3KnbpUgUJnBOzNw3CU6pq9.S'),
(39, 'camille.petit', '[\"role_professeur\"]', '$2y$13$2nNBYI.ptG59flnCtHPeK.jaTvYQ/LeIpO0uK0Fwzn9EgvqEa1NhW'),
(40, 'benjamin.morel', '[\"role_professeur\"]', '$2y$13$Iwx4Kn1RTphUa08n0HNd/.J8KBzVC/HIPePYnhypRUZY1gkHBJWsa'),
(41, 'sophie.girard', '[\"role_professeur\"]', '$2y$13$Xkz4RYzb1uvC0BVTardvnuCKwU5r5w3lN.BaKI.Pm92U0Hb0iAc5C'),
(42, 'hugo.gauthier', '[\"role_professeur\"]', '$2y$13$rXvFZJsU4aHTuOloD0EzxOJoQMU/.B7ccIKi2v4meqiZ3HybPgPtW'),
(43, 'laure.bertrand', '[\"role_professeur\"]', '$2y$13$dM07X33ZL4q.yLw2Lp2W9u7422oF.Va1h.w3GB/qtH3nLWaNZb/o.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
