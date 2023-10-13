-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 12 oct. 2023 à 11:51
-- Version du serveur :  10.5.15-MariaDB-0+deb11u1
-- Version de PHP : 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gpmotog1`
--

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `libelleGP` varchar(30) NOT NULL,
  `dateCourse` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `course`
--

INSERT INTO `course` (`id`, `libelleGP`, `dateCourse`) VALUES
(1, 'GP d\'Aragon', '2022-09-18'),
(2, 'GP d\'Allemagne', '2022-06-19');

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE `participer` (
  `idCourse` int(11) NOT NULL,
  `idPilote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pilote`
--

CREATE TABLE `pilote` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `nationalite` varchar(40) NOT NULL,
  `dateNaiss` date NOT NULL,
  `idTeam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pilote`
--

INSERT INTO `pilote` (`id`, `nom`, `prenom`, `nationalite`, `dateNaiss`, `idTeam`) VALUES
(1, 'Quartararo', 'Fabio', 'français', '1999-04-20', 2),
(2, 'Zarco', 'Yohann', 'français', '1990-07-16', 1),
(3, 'Jorge', 'Martin', 'espagnol', '1998-01-29', 1),
(4, 'Morbidelli', 'Enzo', 'italien', '1992-12-04', 2),
(5, 'Miller', 'Jack', 'australien', '1995-01-18', 6),
(6, 'Espargaro', 'Pol', 'espagnol', '1989-07-30', 3),
(7, 'Marini', 'Luca', 'italien', '1997-08-10', 7),
(8, 'Bastianini', 'Enea', 'italien', '1997-12-30', 5),
(9, 'Di Giannantonio', 'Enzo', 'italien', '1998-10-10', 3),
(10, 'Oliveira', 'Miguel', 'portugais', '1995-01-04', 6),
(11, 'Binder', 'Brad', 'anglais', '1995-08-11', 4);

-- --------------------------------------------------------

--
-- Structure de la table `resultats`
--

CREATE TABLE `resultats` (
  `idCourse` int(11) NOT NULL,
  `idPilote` int(11) NOT NULL,
  `temps` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `libelle` varchar(40) NOT NULL,
  `pays` varchar(30) NOT NULL,
  `modeleMoto` varchar(40) NOT NULL,
  `idPilote1` int(11) NOT NULL,
  `idPilote2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `team`
--

INSERT INTO `team` (`id`, `libelle`, `pays`, `modeleMoto`, `idPilote1`, `idPilote2`) VALUES
(1, 'Pramac Racing', 'Italie', 'Ducati Desmosedici', 0, 0),
(2, 'Monster Energy Yamaha Factory Racing', 'Japon', 'Yamaha YZR-M1', 0, 0),
(3, 'Team Gresini Racing', 'Italie', 'Ducati Desmosedici', 0, 0),
(4, 'Team Red Bull KTM Factory Racing', 'Autriche', 'KTM RC16', 0, 0),
(5, 'Team Ducati', 'Italie', 'Ducati Desmosedici', 0, 0),
(6, 'Team Repsol Honda', 'Japon', 'Honda RC213V', 0, 0),
(7, 'Team VR46', 'Italie', 'Ducati Desmosedici', 0, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`idCourse`,`idPilote`),
  ADD KEY `idPilote` (`idPilote`);

--
-- Index pour la table `pilote`
--
ALTER TABLE `pilote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTeam` (`idTeam`);

--
-- Index pour la table `resultats`
--
ALTER TABLE `resultats`
  ADD PRIMARY KEY (`idCourse`,`idPilote`),
  ADD KEY `idPilote` (`idPilote`);

--
-- Index pour la table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `pilote`
--
ALTER TABLE `pilote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `participer_ibfk_1` FOREIGN KEY (`idPilote`) REFERENCES `pilote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participer_ibfk_2` FOREIGN KEY (`idCourse`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `pilote`
--
ALTER TABLE `pilote`
  ADD CONSTRAINT `pilote_ibfk_1` FOREIGN KEY (`idTeam`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `resultats`
--
ALTER TABLE `resultats`
  ADD CONSTRAINT `resultats_ibfk_1` FOREIGN KEY (`idCourse`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resultats_ibfk_2` FOREIGN KEY (`idPilote`) REFERENCES `pilote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
